//
//  DTSSectionsOfStatiscticsTableViewController.h
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSSectionsOfStatiscticsTableViewController : UITableViewController

@property (nonatomic, assign) BOOL isInternetConnectionAvailable; /**< Флаг доступности интеренет соединения */
@property (nonatomic, assign) BOOL isInformationFind; /**< Флаг доступности информации по текущему Steam32 ID */

@end

NS_ASSUME_NONNULL_END
