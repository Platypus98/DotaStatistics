//
//  DTSLastMatchNetworkService.m
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSLastMatchNetworkService.h"
#import "NetworkHelper.h"
#import "DTSGeneralMatchStats.h"
#import "DTSPlayerMatchStats.h"
#import "DTSLastMatchViewController.h"
#import "CoreDataStack.h"


@implementation DTSLastMatchNetworkService

- (void)getLatestMatchStatsWithSteam32Id:(NSString *)steam32Id
{
    NSString *urlString = [NetworkHelper URLForResentMathcesWithSteam32Id:steam32Id];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSArray *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        @try
        {
            NSNumber *matchId = [[temp objectAtIndex:0] valueForKey:@"match_id"];
            [self getMatchStatsWithMatchId:matchId];
        }
        @catch (NSException *exception)
        {
            [self.DTSLastMatchViewConstrollerDelegate infrormationIsntFind];
        }
        @finally
        {
            
        }
    }];
    
    [sessionDataTask resume];
}

- (void)getMatchStatsWithMatchId:(NSNumber *)matchId
{

    NSString *urlString = [NetworkHelper URLForMatchStatsWithMatchId:matchId.stringValue];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];

    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        DTSGeneralMatchStats *generalMatchStats = [DTSGeneralMatchStats new];
        generalMatchStats.matchId = matchId;
        NSNumber *radiantWin = [temp valueForKey:@"radiant_win"];
        if (radiantWin.integerValue == 0)
        {
            generalMatchStats.radiantWin = NO;
        }
        else
        {
           generalMatchStats.radiantWin = YES;
        }
        generalMatchStats.durationInSeconds = [temp valueForKey:@"duration"];
        generalMatchStats.direScore = [temp valueForKey:@"dire_score"];
        generalMatchStats.radiantScore = [temp valueForKey:@"radiant_score"];
        generalMatchStats.startTime = [temp valueForKey:@"start_time"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.DTSLastMatchViewConstrollerDelegate setGeneralMatchStats:generalMatchStats];
        });
        
        for (NSDictionary *element in [temp valueForKey:@"players"])
        {
            DTSPlayerMatchStats *playerMatchStats = [DTSPlayerMatchStats new];
            playerMatchStats.playerName = [element valueForKey:@"personaname"];
            playerMatchStats.kills = [element valueForKey:@"kills"];
            playerMatchStats.deaths = [element valueForKey:@"deaths"];
            playerMatchStats.assists = [element valueForKey:@"assists"];
            playerMatchStats.gPM = [element valueForKey:@"gold_per_min"];
            playerMatchStats.xPM = [element valueForKey:@"xp_per_min"];
            playerMatchStats.lastHits = [element valueForKey:@"last_hits"];
            playerMatchStats.denies = [element valueForKey:@"denies"];
            playerMatchStats.totalGold = [element valueForKey:@"total_gold"];
            playerMatchStats.heroDamage = [element valueForKey:@"hero_damage"];
            playerMatchStats.heroHealing = [element valueForKey:@"hero_healing"];
            playerMatchStats.towerDamage = [element valueForKey:@"tower_damage"];
            playerMatchStats.level = [element valueForKey:@"level"];
            
            NSNumber *damageTaken;
            for (NSNumber *damage in [[element valueForKey:@"damage_taken"] allValues])
            {
                damageTaken = [[NSNumber alloc] initWithLong:(long)damageTaken.integerValue + damage.integerValue];
            }
            playerMatchStats.damageTaken = damageTaken;
            
            NSNumber *heroId = [element valueForKey:@"hero_id"];
            UIImage *heroImage = [[UIImage alloc] initWithData:[CoreDataStack getHeroImageByHeroId:heroId.integerValue]];

            playerMatchStats.heroImage = heroImage;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.DTSLastMatchViewConstrollerDelegate addPlayerMatchStats:playerMatchStats];
            });
        }
        
    }];
    [sessionDataTask resume];
}

@end
