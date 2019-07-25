//
//  NerworkHelper.h
//  DotaStatistics
//
//  Created by Ilya on 06/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NetworkHelper : NSObject

/**
 Получение ссылки для базовых показателей героев

 @return ссылка для базовых показателей героев
 */
+ (NSString *)URLForHeroesStats;

/**
 Получение ссылки для общей информации о пользователе

 @param steam32Id идентификатор Steam32 ID
 @return ссылка для общей информации о пользователе
 */
+ (NSString *)URLForGeneralUserInformationWithSteam32Id:(NSString *)steam32Id;

/**
 Получение ссылки для количества побед и поражений

 @param steam32Id идентификатор Steam32 ID
 @return ссылка для количества побед и поражений
 */
+ (NSString *)URLForWinsAndLosesWithSteam32Id:(NSString *)steam32Id;

/**
 Получение ссылки для общих показателей пользователя

 @param steam32Id идентификатор Steam32 ID
 @return ссылка для общих показателей пользователя
 */
+ (NSString *)URLForTotalDotaStatsWithSteam32Id:(NSString *)steam32Id;

/**
 Получение ссылки для недавних матчей пользователя

 @param steam32Id идентификатор Steam32 ID
 @return ссылка для недавних матчей пользователя
 */
+ (NSString *)URLForResentMathcesWithSteam32Id:(NSString *)steam32Id;

/**
 Получение ссылки для показателей матча

 @param matchId идентификационный номер матча
 @return ссылка для показателей матча
 */
+ (NSString *)URLForMatchStatsWithMatchId:(NSString *)matchId;

@end

NS_ASSUME_NONNULL_END
