//
//  DTSPlayerStatsTableViewCell.h
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSPlayerStatsTableViewCell : UITableViewCell

@property (nonatomic, readonly) UIImageView *heroImageView; /**< Представление картинки героя */
@property (nonatomic, readonly) UILabel *playerNameLabel; /**< Никнейма игрока */
@property (nonatomic, readonly) UILabel *kdaLabel; /**< Убийства/смерти/помощи */
@property (nonatomic, readonly) UILabel *gPMLabel; /**< Количество золота в минуту */
@property (nonatomic, readonly) UILabel *xPMLabel; /**< Количество опыта в минуту */

@property (nonatomic, readonly) UILabel *lastHitsLabel; /**< Количество добитых крипов */
@property (nonatomic, readonly) UILabel *deniesLabel; /**< Количество неотданных крипов */
@property (nonatomic, readonly) UILabel *totalGoldLabel; /**< Общая ценность */
@property (nonatomic, readonly) UILabel *heroDamageLabel; /**< Количество нанесенного урона героям */
@property (nonatomic, readonly) UILabel *heroHealingLabel; /**< Количество восстановленного здоровья героям */
@property (nonatomic, readonly) UILabel *towerDamageLabel; /**< Количесвто нанесенного урона по строениям */
@property (nonatomic, readonly) UILabel *levelLabel; /**< Уровень */
@property (nonatomic, readonly) UILabel *damageTakenLabel; /**< Количество полученного урона */

@end

NS_ASSUME_NONNULL_END
