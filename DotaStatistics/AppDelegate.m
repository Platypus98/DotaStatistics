//
//  AppDelegate.m
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "AppDelegate.h"
#import "DTSMainStatsViewController.h"
#import "DTSAllHeroesViewController.h"
#import "DTSSettingsViewController.h"


@interface AppDelegate ()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    
    DTSMainStatsViewController *mainStatsViewController = [DTSMainStatsViewController new];
    UINavigationController *mainStatsNavigationController = [[UINavigationController alloc] initWithRootViewController:mainStatsViewController];
    mainStatsViewController.tabBarItem.title = @"Статистика";
    mainStatsViewController.tabBarItem.image = [UIImage imageNamed:@"mainStatsImage"];
    
    DTSAllHeroesViewController *allHeroesViewController = [DTSAllHeroesViewController new];
    UINavigationController *heroesNavigationController = [[UINavigationController alloc] initWithRootViewController:allHeroesViewController];
    allHeroesViewController.tabBarItem.title = @"Герои";
    allHeroesViewController.tabBarItem.image = [UIImage imageNamed:@"heroImage"];
    
    DTSSettingsViewController *settingsViewController = [DTSSettingsViewController new];
    UINavigationController *settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    settingsViewController.tabBarItem.title = @"Настройки";
    settingsViewController.tabBarItem.image = [UIImage imageNamed:@"settingsImage"];
    
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.tabBar.barStyle = UIBarStyleBlack;
    tabBarController.viewControllers = @[mainStatsNavigationController, heroesNavigationController, settingsNavigationController];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
