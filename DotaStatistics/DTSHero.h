//
//  Hero.h
//  DotaStatistics
//
//  Created by Ilya on 10/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSHero : NSObject

@property (nonatomic, strong) NSNumber *heroId; /**< Идентификационный номер героя */
@property (nonatomic, copy) NSString *name; /**< Имя героя */
@property (nonatomic, strong) UIImage *image; /**< Изображение героя */

@property (nonatomic, copy) NSString *attackType; /**< Тип атаки */
@property (nonatomic, copy) NSString *roles; /**< Роли */

@property (nonatomic, strong, nullable) NSNumber *baseHealth; /**< Базовый запас здоровья */
@property (nonatomic, strong, nullable) NSNumber *baseHealthRegen; /**< Базовая регенерация здоровья */
@property (nonatomic, strong) NSNumber *baseMana; /**< Базовый запас маны */
@property (nonatomic, strong) NSNumber *baseManaRegen; /**< Базовая регенерация маны */
@property (nonatomic, strong) NSNumber *baseArmor; /**< Базовый показатель брони */
@property (nonatomic, strong) NSNumber *baseMagicResistance; /**< Базовое сопротивление магии */
@property (nonatomic, strong) NSNumber *baseAttackMinDamage; /**< Минимальный базовый урон атаки */
@property (nonatomic, strong) NSNumber *baseAttackMaxDamage;/**< Максимальный базовый урон атаки */

@property (nonatomic, strong) NSNumber *baseStrenght; /**< Базовая сила */
@property (nonatomic, strong) NSNumber *baseAgility; /**< Базовая ловкость */
@property (nonatomic, strong) NSNumber *baseIntelligence; /**< Базовый интелект */
@property (nonatomic, strong) NSNumber *strenghtGain; /**< Прирост силы с увеличением уровня */
@property (nonatomic, strong) NSNumber *agilityGain; /**< Прирост ловкости с увеличением уровня */
@property (nonatomic, strong) NSNumber *intelligenceGain; /**< Прирость интелекта с увеличением уровня */

@property (nonatomic, strong) NSNumber *attackRange; /**< Дальность атаки */
@property (nonatomic, strong) NSNumber *attackRate; /**< Скорость атаки */
@property (nonatomic, strong) NSNumber *moveSpeed; /**< Скорость передвижения */
@property (nonatomic, strong) NSNumber *turnRate; /**< Скорость поворота */
@property (nonatomic, assign) BOOL capitanModeEnabled; /**< Доступнсоть в CM */
@property (nonatomic, strong) NSNumber *legs; /**< Количество ног */

@end

NS_ASSUME_NONNULL_END
