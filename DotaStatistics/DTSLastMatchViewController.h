//
//  DTSLastMatchViewController.h
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTSGeneralMatchStats;
@class DTSPlayerMatchStats;

NS_ASSUME_NONNULL_BEGIN


@interface DTSLastMatchViewController : UIViewController

/**
 Получение общей информации по матчу от Network Service

 @param generalMatchStats модель общей информации матча
 */
- (void)setGeneralMatchStats:(DTSGeneralMatchStats *)generalMatchStats;

/**
 Получение показателей игрока матча от Network Service

 @param playerMatchStats модель показателей игрока матча
 */
- (void)addPlayerMatchStats:(DTSPlayerMatchStats *)playerMatchStats;

/**
 Получение события о том, что информация не найдена
 */
- (void)infrormationIsntFind;

@end

NS_ASSUME_NONNULL_END
