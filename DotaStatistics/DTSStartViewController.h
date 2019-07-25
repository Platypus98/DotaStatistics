//
//  ViewController.h
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTSMainStatsViewController;


@interface DTSStartViewController : UIViewController

@property (nonatomic, weak) DTSMainStatsViewController *mainStatsViewControllerDelegate; /**< Делегат внешних событий */

@end

