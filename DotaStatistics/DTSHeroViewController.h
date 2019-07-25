//
//  HeroViewController.h
//  DotaStatistics
//
//  Created by Ilya on 11/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSHeroViewController : UIViewController

@property (nonatomic, readonly) UIImageView *heroImageView; /**< Изображение героя */
@property (nonatomic, readonly) UILabel *heroNameLabel; /**< Имя героя */

@property (nonatomic, readonly) UILabel *attackTypeLabel; /**< Тип атаки */
@property (nonatomic, readonly) UILabel *rolesLabel; /**< Роли */

@property (nonatomic, readonly) UILabel *baseHealthLabel; /**< Базовый запас здоровья */
@property (nonatomic, readonly) UILabel *baseHealthRegenLabel; /**< Базовая регенерация здоровья */
@property (nonatomic, readonly) UILabel *baseManaLabel; /**< Базовый запас маны */
@property (nonatomic, readonly) UILabel *baseManaRegenLabel; /**< Базовая регенерация маны*/
@property (nonatomic, readonly) UILabel *baseArmorLabel; /**< Базовый показатель брони */
@property (nonatomic, readonly) UILabel *baseMagicResistanceLabel; /**< Базовое сопротивление магии */
@property (nonatomic, readonly) UILabel *baseAttackMinDamageLabel; /**< Минимальный базовый урон атаки */
@property (nonatomic, readonly) UILabel *baseAttackMaxDamageLabel; /**< Максимальный базовый урон атаки */

@property (nonatomic, readonly) UILabel *baseStrenghtLabel; /**< Базовая сила */
@property (nonatomic, readonly) UILabel *baseAgilityLabel; /**< Базовая ловкость */
@property (nonatomic, readonly) UILabel *baseIntelligenceLabel; /**< Базовый интелект */
@property (nonatomic, readonly) UILabel *strenghtGainLabel; /**< Прирост силы с увеличением уровня */
@property (nonatomic, readonly) UILabel *agilityGainLabel; /**< Прирост ловкости с увеличением уровня */
@property (nonatomic, readonly) UILabel *intelligenceGainLabel; /**< Прирость интелекта с увеличением уровня */

@property (nonatomic, readonly) UILabel *attackRangeLabel; /**< Дальность атаки */
@property (nonatomic, readonly) UILabel *attackRateLabel; /**< Скорость атаки */
@property (nonatomic, readonly) UILabel *moveSpeedLabel; /**< Скорость передвижения */
@property (nonatomic, readonly) UILabel *turnRateLabel; /**< Скорость поворота */
@property (nonatomic, readonly) UILabel *capitanModeEnabledLabel; /**< Доступнсоть в CM */
@property (nonatomic, readonly) UILabel *legsLabel; /**< Количество ног */

@end

NS_ASSUME_NONNULL_END
