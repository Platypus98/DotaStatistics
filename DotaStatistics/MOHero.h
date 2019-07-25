//
//  MOHero.h
//  DotaStatistics
//
//  Created by Ilya on 17/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN


@interface MOHero : NSManagedObject

@property (nonatomic, assign) NSInteger heroId; /**< Идентификационный номер */
@property (nonatomic, copy) NSString *name; /**< Имя */
@property (nonatomic, strong) NSData *image; /**< Данные картинки */

@property (nonatomic, copy) NSString *attackType; /**< Тип атаки */
@property (nonatomic, copy) NSString *roles; /**< Игровые роли */

@property (nonatomic, assign) float baseHealth; /**< Базовый запас здоровья */
@property (nonatomic, assign) float baseHealthRegen; /**< Базовая регенерация здоровья */
@property (nonatomic, assign) float baseMana; /**< Базовый запас маны */
@property (nonatomic, assign) float baseManaRegen; /**< Базовая регенерация маны*/
@property (nonatomic, assign) float baseArmor; /**< Базовый показатель брони */
@property (nonatomic, assign) float baseMagicResistance; /**< Базовое сопротивление магии */
@property (nonatomic, assign) NSInteger baseAttackMinDamage; /**< Минимальный базовый урон атаки */
@property (nonatomic, assign) NSInteger baseAttackMaxDamage; /**< Максимальный базовый урон атаки */

@property (nonatomic, assign) NSInteger baseStrenght; /**< Базовая сила */
@property (nonatomic, assign) NSInteger baseAgility; /**< Базовая ловкость */
@property (nonatomic, assign) NSInteger baseIntelligence; /**< Базовый интелект */
@property (nonatomic, assign) float strenghtGain; /**< Прирост силы с увеличением уровня */
@property (nonatomic, assign) float agilityGain; /**< Прирост ловкости с увеличением уровня */
@property (nonatomic, assign) float intelligenceGain; /**< Прирость интелекта с увеличением уровня */

@property (nonatomic, assign) NSInteger attackRange; /**< Дальность атаки */
@property (nonatomic, assign) float attackRate; /**< Скорость атаки */
@property (nonatomic, assign) NSInteger moveSpeed; /**< Скорость передвижения */
@property (nonatomic, assign) float turnRate; /**< Скорость поворота */
@property (nonatomic, assign) BOOL capitanModeEnabled; /**< Доступнсоть в CM */
@property (nonatomic, assign) NSInteger legs; /**< Количество ног */

@end

NS_ASSUME_NONNULL_END
