//
//  DTSTotalStatsNetworkService.h
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTSTotalStatsViewController;

NS_ASSUME_NONNULL_BEGIN


@interface DTSTotalStatsNetworkService : NSObject

@property (nonatomic, weak) DTSTotalStatsViewController *DTSTotalStatsViewConstrollerDelegate; /**< Делегат внешних событий */

/**
 Скачивание общих показателей пользователя

 @param steam32Id идентификатор Steam32 ID
 */
- (void)getTotalStatsWithSteam32Id:(NSString *)steam32Id;

@end

NS_ASSUME_NONNULL_END
