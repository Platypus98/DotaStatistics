//
//  DTSMainStatsNetworkService.h
//  DotaStatistics
//
//  Created by Ilya on 18/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTSMainStatsViewController;

NS_ASSUME_NONNULL_BEGIN


@interface DTSMainStatsNetworkService : NSObject

@property (nonatomic, weak) DTSMainStatsViewController *DTSMainStatsViewConstrollerDelegate; /**< Делегат внешних событий */

/**
 Скачивание общей информации о пользователе

 @param steam32Id идентификационный номер Steam32 ID
 */
- (void)getGeneralUserInfromationWithSteam32Id:(NSString *)steam32Id;

/**
 Скачивание количества побед и поражений пользователя

 @param steam32Id идентификационный номер Steam32 ID
 */
- (void)getWinAndLosesWithSteam32Id:(NSString *)steam32Id;

@end

NS_ASSUME_NONNULL_END
