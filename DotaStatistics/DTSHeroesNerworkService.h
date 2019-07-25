//
//  AllHeroesNerworkService.h
//  DotaStatistics
//
//  Created by Ilya on 11/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTSAllHeroesViewController.h"

NS_ASSUME_NONNULL_BEGIN


@interface DTSHeroesNerworkService : NSObject

@property (nonatomic, weak) DTSAllHeroesViewController *DTSAllHeroesViewControllerDelegate; /**< Делегат внешних событий */

/**
 Скачивание информации о героях
 */
- (void)updateHeroes;

@end

NS_ASSUME_NONNULL_END
