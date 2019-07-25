//
//  DTSTotalStats.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSTotalStats.h"


@implementation DTSTotalStats

+ (NSString *)convertTotalDurationToString:(NSNumber *)durationInSeconds
{
    NSInteger days = durationInSeconds.integerValue / (60 * 60 * 24);
    NSInteger reminder = durationInSeconds.integerValue - days * (60 * 60 * 24);
    NSInteger hours = reminder / (60 * 60);
    reminder = reminder - hours * (60 * 60);
    NSInteger minutes = reminder / 60;
    reminder = reminder - minutes * 60;
    
    return [NSString stringWithFormat:@"%ldд %ldч %ldм %ldс", days, hours, minutes, reminder];
}

@end
