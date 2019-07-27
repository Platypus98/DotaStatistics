//
//  DTSGeneralMatchStats.m
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSGeneralMatchStats.h"


@implementation DTSGeneralMatchStats

+ (NSString *)convertMatchDurationToString:(NSNumber *)matchDurationInSeconds
{
    NSInteger minutes = matchDurationInSeconds.integerValue / 60;
    NSInteger seconds = matchDurationInSeconds.integerValue - (minutes * 60);
    
    NSString *secondsString;
    if (seconds < 10)
    {
        secondsString = [NSString stringWithFormat:@"0%ld", seconds];
    }
    else
    {
        secondsString = [NSString stringWithFormat:@"%ld", seconds];
    }
    
    return [NSString stringWithFormat:@"%ld:%@", minutes, secondsString];
}

+ (NSString *)convertStartTimeToString:(NSNumber *)startTime
{
    NSTimeInterval seconds = [startTime doubleValue];
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM HH:mm"];
    
    return [dateFormatter stringFromDate:epochNSDate];
}

@end
