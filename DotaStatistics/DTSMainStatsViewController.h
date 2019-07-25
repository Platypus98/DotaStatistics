//
//  MainStatsViewController.h
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSMainStatsViewController : UIViewController

/**
 Получение общей информации пользователя от Network Service

 @param personalName никнейм пользователя
 @param estimateMMR приблизительная оценка MMR пользователя
 */
- (void)setGeneralUserInformationWithPersonalName:(NSString *)personalName estimateMMR:(NSString *)estimateMMR;

/**
 Получение количества побед и поражений пользователя от Network Service

 @param wins количество побед
 @param loses количество поражений
 */
- (void)setWins:(NSNumber *)wins loses:(NSNumber *)loses;

/**
 Получение изображения пользователя от Network Service

 @param userImage изображение пользователя
 */
- (void)setUserImage:(UIImage *)userImage;

/**
 Получение события о том, что информация не найдена
 */
- (void)infrormationIsntFind;

/**
 Получение события о том, что осутствует интеренет соединение
 */
- (void)checkInternetConnection;

/**
 Получение события о том, что Steam32 ID был введен
 */
- (void)steam32IDRecived;

@end

NS_ASSUME_NONNULL_END
