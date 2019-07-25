//
//  AllHeroesNerworkService.m
//  DotaStatistics
//
//  Created by Ilya on 11/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSHeroesNerworkService.h"
#import "NetworkHelper.h"
#import "DTSHero.h"
#import "CoreDataStack.h"
#import "MOHero.h"


@interface DTSHeroesNerworkService ()

@end


@implementation DTSHeroesNerworkService

- (void)updateHeroes
{
    NSString *urlString = [NetworkHelper URLForHeroesStats];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        @try
        {
            NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            [self.DTSAllHeroesViewControllerDelegate updateInformationWillBe];
            [self.DTSAllHeroesViewControllerDelegate updateCountOfHeroes:temp.count];
            [CoreDataStack clearHeroTable];
            
            for (id item in temp)
            {
                DTSHero *newHero = [DTSHero new];
                newHero.heroId = [item valueForKey:@"hero_id"];
                newHero.name = [item valueForKey:@"localized_name"];
                newHero.attackType = [item valueForKey:@"attack_type"];
                NSArray *arrayRoles = [item valueForKey:@"roles"];
                newHero.roles = [arrayRoles componentsJoinedByString:@", "];
                newHero.baseHealth = [item valueForKey:@"base_health"];
                newHero.baseHealthRegen = [item valueForKey:@"base_health_regen"];
                newHero.baseMana = [item valueForKey:@"base_mana"];
                newHero.baseManaRegen = [item valueForKey:@"base_mana_regen"];
                newHero.baseArmor = [item valueForKey:@"base_armor"];
                newHero.baseMagicResistance = [item valueForKey:@"base_mr"];
                newHero.baseAttackMinDamage = [item valueForKey:@"base_attack_min"];
                newHero.baseAttackMaxDamage = [item valueForKey:@"base_attack_max"];
                newHero.baseStrenght = [item valueForKey:@"base_str"];
                newHero.baseAgility = [item valueForKey:@"base_agi"];
                newHero.baseIntelligence = [item valueForKey:@"base_int"];
                newHero.strenghtGain = [item valueForKey:@"str_gain"];
                newHero.agilityGain = [item valueForKey:@"agi_gain"];
                newHero.intelligenceGain = [item valueForKey:@"int_gain"];
                newHero.attackRange = [item valueForKey:@"attack_range"];
                newHero.attackRate = [item valueForKey:@"attack_rate"];
                newHero.moveSpeed = [item valueForKey:@"move_speed"];
                newHero.turnRate = [item valueForKey:@"turn_rate"];
                newHero.capitanModeEnabled = [item valueForKey:@"cm_enabled"];
                newHero.legs = [item valueForKey:@"legs"];
                
                NSNumber *baseHealth = [[NSNumber alloc] initWithInt:newHero.baseHealth.intValue + 20*newHero.baseStrenght.intValue];
                newHero.baseHealth = baseHealth;
                NSNumber *baseMana = [[NSNumber alloc] initWithInt:newHero.baseMana.intValue + 12*newHero.baseIntelligence.intValue];
                newHero.baseMana = baseMana;
                NSNumber *baseArmor = [[NSNumber alloc] initWithFloat:newHero.baseArmor.intValue + 0.16*newHero.baseAgility.intValue];
                newHero.baseArmor = baseArmor;
                NSInteger heroMaxPoint = MAX(newHero.baseStrenght.intValue, MAX(newHero.baseAgility.intValue, newHero.baseIntelligence.intValue));
                NSNumber *minDamage = [[NSNumber alloc] initWithLong:heroMaxPoint + newHero.baseAttackMinDamage.intValue];
                NSNumber *maxDamage = [[NSNumber alloc] initWithLong:heroMaxPoint + newHero.baseAttackMaxDamage.intValue];
                newHero.baseAttackMinDamage = minDamage;
                newHero.baseAttackMaxDamage = maxDamage;
                
                NSString *urlString = [NSString stringWithFormat:@"https://api.opendota.com%@", [item valueForKey:@"img"]];
                NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                newHero.image = image;
                [self.DTSAllHeroesViewControllerDelegate addHero:newHero];
                [CoreDataStack addHeroRecord:newHero];
            };
            [self.DTSAllHeroesViewControllerDelegate getInformationDidEnd];
        }
        @catch (NSException *exception)
        {
            [self.DTSAllHeroesViewControllerDelegate checkInternetConnection];
        }
        @finally
        {
            
        }
    }];
    [sessionDataTask resume];
}

@end
