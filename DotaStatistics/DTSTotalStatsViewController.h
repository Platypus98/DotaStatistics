//
//  DTSTotalStatsViewController.h
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTSTotalStats;

NS_ASSUME_NONNULL_BEGIN


@interface DTSTotalStatsViewController : UIViewController

/**
 Получение общих показателей пользователя от Network Service

 @param totalStats модель общих показателей пользователя
 */
- (void)setTotalStats:(DTSTotalStats *)totalStats;

@end

NS_ASSUME_NONNULL_END
