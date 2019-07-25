//
//  DTSPlayerMatchStats.h
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface DTSPlayerMatchStats : NSObject

@property (nonatomic, strong) UIImage *heroImage; /**< Картинка героя */
@property (nonatomic, copy) NSString *playerName; /**< Никнейм игрока */
@property (nonatomic, strong) NSNumber *kills; /**< Количество убийств */
@property (nonatomic, strong) NSNumber *deaths; /**< Количество смертей */
@property (nonatomic, strong) NSNumber *assists; /**< Количество помощей в убийствах */
@property (nonatomic, strong) NSNumber *gPM; /**< Золота в минуту */
@property (nonatomic, strong) NSNumber *xPM; /**< Опыта в минуту */
@property (nonatomic, strong) NSNumber *lastHits; /**< Количество добитых крипов */
@property (nonatomic, strong) NSNumber *denies; /**< Количество неотданных крипов */
@property (nonatomic, strong) NSNumber *totalGold; /**< Ценность */
@property (nonatomic, strong) NSNumber *heroDamage; /**< Количество нанесенного урона по героям */
@property (nonatomic, strong) NSNumber *heroHealing; /**< Количество восстановленного здоровья героям */
@property (nonatomic, strong) NSNumber *towerDamage; /**< Количество нанесенного урона по строениям */
@property (nonatomic, strong) NSNumber *level; /**< Уровень */
@property (nonatomic, strong) NSNumber *damageTaken; /**< Полученный урон */

@end

NS_ASSUME_NONNULL_END
