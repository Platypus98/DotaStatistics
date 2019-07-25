//
//  DTSLastMatchNetworkService.h
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTSLastMatchViewController;

NS_ASSUME_NONNULL_BEGIN


@interface DTSLastMatchNetworkService : NSObject

@property (nonatomic, weak) DTSLastMatchViewController *DTSLastMatchViewConstrollerDelegate;

/**
 Скачивание информации по последнему матчу

 @param steam32Id идентификатор Steam32 ID
 */
- (void)getLatestMatchStatsWithSteam32Id:(NSString *)steam32Id;

@end

NS_ASSUME_NONNULL_END
