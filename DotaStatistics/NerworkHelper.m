//
//  NerworkHelper.m
//  DotaStatistics
//
//  Created by Ilya on 06/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "NetworkHelper.h"


@implementation NetworkHelper

+ (NSString *)URLForHeroesStats
{
    return @"https://api.opendota.com/api/heroStats";
}

+ (NSString *)URLForGeneralUserInformationWithSteam32Id:(NSString *)steam32Id
{
    return [NSString stringWithFormat:@"https://api.opendota.com/api/players/%@", steam32Id];
}

+ (NSString *)URLForWinsAndLosesWithSteam32Id:(NSString *)steam32Id
{
    return [NSString stringWithFormat:@"https://api.opendota.com/api/players/%@/wl", steam32Id];
}

+ (NSString *)URLForTotalDotaStatsWithSteam32Id:(NSString *)steam32Id
{
    return [NSString stringWithFormat:@"https://api.opendota.com/api/players/%@/totals", steam32Id];
}

+ (NSString *)URLForResentMathcesWithSteam32Id:(NSString *)steam32Id
{
    return [NSString stringWithFormat:@"https://api.opendota.com/api/players/%@/recentMatches", steam32Id];
}

+ (NSString *)URLForMatchStatsWithMatchId:(NSString *)matchId
{
    return [NSString stringWithFormat:@"https://api.opendota.com/api/matches/%@", matchId];
}

@end
