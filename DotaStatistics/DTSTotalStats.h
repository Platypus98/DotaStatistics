//
//  DTSTotalStats.h
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSTotalStats : NSObject

@property (nonatomic, strong) NSNumber *kills; /**< Количество убийств */
@property (nonatomic, strong) NSNumber *deaths; /**< Количество смертей */
@property (nonatomic, strong) NSNumber *assists; /**< Количество помощей в убийствах */
@property (nonatomic, strong) NSNumber *lastHits; /**< Количество добиваний крипов */
@property (nonatomic, strong) NSNumber *denies; /**< Количество не отданных крипов */
@property (nonatomic, strong) NSNumber *durationInSeconds; /**< Общая длительность игры в секундах */
@property (nonatomic, strong) NSNumber *level; /**< Суммарный уровень */
@property (nonatomic, strong) NSNumber *heroDamage; /**< Суммарнное нанесенное количество урона героям */
@property (nonatomic, strong) NSNumber *towerDamage; /**< Суммарнное нанесенное количество урона строениям */
@property (nonatomic, strong) NSNumber *heroHealing; /**< Количество восстановленного здоровья героям */

@property (nonatomic, strong) NSNumber *countOfAnalyzedMatchesLabel; /**< Количество проанализированных матчей, по которым вычислены некоторый показатели */
@property (nonatomic, strong) NSNumber *stuns; /**< Количество оглушений */
@property (nonatomic, strong) NSNumber *towetKills; /**< Количество добитых строений */
@property (nonatomic, strong) NSNumber *neutralKills; /**< Количество убитых нейтральных крипов */
@property (nonatomic, strong) NSNumber *courierKills; /**< Количество убитых курьеров */
@property (nonatomic, strong) NSNumber *purchaseTpscroll; /**< Количество купленных свитков телепортации */
@property (nonatomic, strong) NSNumber *purchaseWardObserver; /**< Количество купленных Observer Ward'ов */
@property (nonatomic, strong) NSNumber *purchaseWardSentry; /**< Количество купленных Sentry Ward'ов */
@property (nonatomic, strong) NSNumber *purchaseGem; /**< Количество купленных GEM'ов */
@property (nonatomic, strong) NSNumber *purchaseRapier; /**< Количество кулпенных Divine Rapier */
@property (nonatomic, strong) NSNumber *mapPings; /**< Количество сигналов на карте */

/**
 Представление общего времени игры в виде строки

 @param durationInSeconds общее время игры в секундах
 @return строка общего времени игры
 */
+ (NSString *)convertTotalDurationToString:(NSNumber *)durationInSeconds;

@end

NS_ASSUME_NONNULL_END
