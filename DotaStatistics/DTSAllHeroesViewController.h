//
//  HeroesViewController.h
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTSHero;


NS_ASSUME_NONNULL_BEGIN


@interface DTSAllHeroesViewController : UIViewController

/**
 Получение модели героя от Network Service

 @param hero модель героя
 */
- (void)addHero:(DTSHero *)hero;

/**
 Обновление количества героев

 @param countOfHeroes количество героев
 */
- (void)updateCountOfHeroes:(NSInteger)countOfHeroes;

/**
 Событие того, что начинается обновление героев
 */
- (void)updateInformationWillBe;

/**
 Событие того, что получение информации закончено
 */
- (void)getInformationDidEnd;

/**
 Проверка доступности интернет соединения
 */
- (void)checkInternetConnection;

@end

NS_ASSUME_NONNULL_END
