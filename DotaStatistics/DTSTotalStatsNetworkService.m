//
//  DTSTotalStatsNetworkService.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSTotalStatsNetworkService.h"
#import "NetworkHelper.h"
#import "DTSTotalStatsViewController.h"
#import "DTSTotalStats.h"


@implementation DTSTotalStatsNetworkService

- (void)getTotalStatsWithSteam32Id:(NSString *)steam32Id
{
    NSString *urlString = [NetworkHelper URLForTotalDotaStatsWithSteam32Id:steam32Id];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        NSArray *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        DTSTotalStats *totalStats = [DTSTotalStats new];
        totalStats.kills = [[temp objectAtIndex:0] valueForKey:@"sum"];
        totalStats.deaths = [[temp objectAtIndex:1] valueForKey:@"sum"];
        totalStats.assists = [[temp objectAtIndex:2] valueForKey:@"sum"];
        totalStats.lastHits = [[temp objectAtIndex:6] valueForKey:@"sum"];
        totalStats.denies = [[temp objectAtIndex:7] valueForKey:@"sum"];
        totalStats.durationInSeconds = [[temp objectAtIndex:9] valueForKey:@"sum"];
        totalStats.level = [[temp objectAtIndex:10] valueForKey:@"sum"];
        totalStats.heroDamage = [[temp objectAtIndex:11] valueForKey:@"sum"];
        totalStats.towerDamage = [[temp objectAtIndex:12] valueForKey:@"sum"];
        totalStats.heroHealing = [[temp objectAtIndex:13] valueForKey:@"sum"];
        
        totalStats.countOfAnalyzedMatchesLabel = [[temp objectAtIndex:15] valueForKey:@"n"];;
        totalStats.stuns = [[temp objectAtIndex:14] valueForKey:@"sum"];
        totalStats.towetKills = [[temp objectAtIndex:15] valueForKey:@"sum"];
        totalStats.neutralKills = [[temp objectAtIndex:16] valueForKey:@"sum"];
        totalStats.courierKills = [[temp objectAtIndex:17] valueForKey:@"sum"];
        totalStats.purchaseTpscroll = [[temp objectAtIndex:18] valueForKey:@"sum"];
        totalStats.purchaseWardObserver = [[temp objectAtIndex:19] valueForKey:@"sum"];
        totalStats.purchaseWardSentry = [[temp objectAtIndex:20] valueForKey:@"sum"];
        totalStats.purchaseGem = [[temp objectAtIndex:21] valueForKey:@"sum"];
        totalStats.purchaseRapier = [[temp objectAtIndex:22] valueForKey:@"sum"];
        totalStats.mapPings = [[temp objectAtIndex:23] valueForKey:@"sum"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.DTSTotalStatsViewConstrollerDelegate setTotalStats:totalStats];
        });
    }];
    [sessionDataTask resume];
}

@end
