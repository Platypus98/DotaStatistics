//
//  MainStatsViewController.m
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSMainStatsViewController.h"
#import "DTSMainStatsNetworkService.h"
#import "DTSSectionsOfStatiscticsTableViewController.h"
#import "DTSStartViewController.h"


@interface DTSMainStatsViewController ()

@property (nonatomic, strong) DTSMainStatsNetworkService *networkService;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *estimateMMRLabel;
@property (nonatomic, strong) UILabel *totalWinsLabel;
@property (nonatomic, strong) UILabel *totalLosesLabel;
@property (nonatomic, strong) UILabel *shareOfWinsLabel;

@property (nonatomic, strong) DTSSectionsOfStatiscticsTableViewController *tableViewController;

@end


@implementation DTSMainStatsViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _networkService = [DTSMainStatsNetworkService new];
        _networkService.DTSMainStatsViewConstrollerDelegate = self;
        
        _userImageView = [UIImageView new];
        _userNameLabel = [UILabel new];
        _estimateMMRLabel = [UILabel new];
        _totalWinsLabel = [UILabel new];
        _totalLosesLabel = [UILabel new];
        _shareOfWinsLabel = [UILabel new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:27.0f/255.0f green:28.0f/255.0f blue:32.0f/255.0f alpha:1];
    [self setupNavigationBar];
    [self setupMainInfo];
    [self setupWinsAndLoses];
    [self setupTableViewController];
    [self checkFirstRun];
}

- (void)checkFirstRun
{
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"Steam32Id"] == nil)
    {
        DTSStartViewController *startViewController = [DTSStartViewController new];
        startViewController.mainStatsViewControllerDelegate = self;
        [self.navigationController pushViewController:startViewController animated:YES];
    }
    else
    {
        [self updateAllInformation];
    }
}

- (void)setupNavigationBar
{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"Статистика";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Обновить" style:UIBarButtonItemStyleDone target:self action:@selector(updateButtonAction)];
}

- (void)setupMainInfo
{
    self.userImageView.backgroundColor = UIColor.grayColor;
    self.userImageView.layer.cornerRadius = 70;
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.frame = CGRectMake(10, UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + self.navigationController.navigationBar.frame.size.height + 15, 140, 140);
    [self.view addSubview:self.userImageView];
    
    self.userNameLabel.textColor = UIColor.whiteColor;
    self.userNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.userNameLabel.adjustsFontSizeToFitWidth = YES;
    [self.userNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [self.view addSubview:self.userNameLabel];
    [self.userNameLabel.topAnchor constraintEqualToAnchor:self.userImageView.topAnchor constant:10].active = YES;
    [self.userNameLabel.leftAnchor constraintEqualToAnchor:self.userImageView.rightAnchor constant:10].active = YES;
    [self.userNameLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.userNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    self.estimateMMRLabel.textColor = UIColor.whiteColor;
    self.estimateMMRLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.estimateMMRLabel.adjustsFontSizeToFitWidth = YES;
    [self.estimateMMRLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [self.view addSubview:self.estimateMMRLabel];
    [self.estimateMMRLabel.topAnchor constraintEqualToAnchor:self.userNameLabel.bottomAnchor constant:10].active = YES;
    [self.estimateMMRLabel.leftAnchor constraintEqualToAnchor:self.userNameLabel.leftAnchor].active = YES;
    [self.estimateMMRLabel.rightAnchor constraintEqualToAnchor:self.userNameLabel.rightAnchor].active = YES;
    [self.estimateMMRLabel.heightAnchor constraintEqualToConstant:15].active = YES;
}

- (void)setupWinsAndLoses
{
    UILabel *shareOfWinsNameLabel = [UILabel new];
    shareOfWinsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    shareOfWinsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    shareOfWinsNameLabel.adjustsFontSizeToFitWidth = NO;
    shareOfWinsNameLabel.numberOfLines = 0;
    shareOfWinsNameLabel.textAlignment = NSTextAlignmentCenter;
    [shareOfWinsNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [shareOfWinsNameLabel setText:@"ДОЛЯ ПОБЕД"];
    [self.view addSubview:shareOfWinsNameLabel];
    [shareOfWinsNameLabel.topAnchor constraintEqualToAnchor:self.userImageView.bottomAnchor constant:20].active = YES;
    [shareOfWinsNameLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [shareOfWinsNameLabel.widthAnchor constraintEqualToConstant:60].active = YES;
    [shareOfWinsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    self.shareOfWinsLabel.textColor = UIColor.whiteColor;
    self.shareOfWinsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.shareOfWinsLabel.adjustsFontSizeToFitWidth = YES;
    self.shareOfWinsLabel.textAlignment = NSTextAlignmentCenter;
    [self.shareOfWinsLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [self.view addSubview:self.shareOfWinsLabel];
    [self.shareOfWinsLabel.topAnchor constraintEqualToAnchor:shareOfWinsNameLabel.bottomAnchor constant:5].active = YES;
    [self.shareOfWinsLabel.leftAnchor constraintEqualToAnchor:shareOfWinsNameLabel.leftAnchor].active = YES;
    [self.shareOfWinsLabel.rightAnchor constraintEqualToAnchor:shareOfWinsNameLabel.rightAnchor].active = YES;
    [self.shareOfWinsLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UILabel *winsNameLabel = [UILabel new];
    winsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    winsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    winsNameLabel.adjustsFontSizeToFitWidth = NO;
    winsNameLabel.textAlignment = NSTextAlignmentCenter;
    [winsNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [winsNameLabel setText:@"ПОБЕДЫ"];
    [self.view addSubview:winsNameLabel];
    [winsNameLabel.centerYAnchor constraintEqualToAnchor:shareOfWinsNameLabel.centerYAnchor].active = YES;
    [winsNameLabel.rightAnchor constraintEqualToAnchor:shareOfWinsNameLabel.leftAnchor constant:-10].active = YES;
    [winsNameLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:5].active = YES;
    [winsNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    self.totalWinsLabel.textColor = [UIColor colorWithRed:86.0f/255.0f green:177.0f/255.0f blue:117.0f/255.0f alpha:1];
    self.totalWinsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.totalWinsLabel.adjustsFontSizeToFitWidth = YES;
    self.totalWinsLabel.textAlignment = NSTextAlignmentCenter;
    [self.totalWinsLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [self.view addSubview:self.totalWinsLabel];
    [self.totalWinsLabel.topAnchor constraintEqualToAnchor:self.shareOfWinsLabel.topAnchor].active = YES;
    [self.totalWinsLabel.leftAnchor constraintEqualToAnchor:winsNameLabel.leftAnchor].active = YES;
    [self.totalWinsLabel.rightAnchor constraintEqualToAnchor:winsNameLabel.rightAnchor].active = YES;
    [self.totalWinsLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UILabel *losesNameLabel = [UILabel new];
    losesNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    losesNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    losesNameLabel.adjustsFontSizeToFitWidth = NO;
    losesNameLabel.textAlignment = NSTextAlignmentCenter;
    [losesNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [losesNameLabel setText:@"ПОРАЖЕНИЯ"];
    [self.view addSubview:losesNameLabel];
    [losesNameLabel.centerYAnchor constraintEqualToAnchor:shareOfWinsNameLabel.centerYAnchor].active = YES;
    [losesNameLabel.leftAnchor constraintEqualToAnchor:shareOfWinsNameLabel.rightAnchor constant:10].active = YES;
    [losesNameLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-5].active = YES;
    [losesNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    self.totalLosesLabel.textColor = [UIColor colorWithRed:219.0f/255.0f green:56.0f/255.0f blue:86.0f/255.0f alpha:1];
    self.totalLosesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.totalLosesLabel.adjustsFontSizeToFitWidth = YES;
    self.totalLosesLabel.textAlignment = NSTextAlignmentCenter;
    [self.totalLosesLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [self.view addSubview:self.totalLosesLabel];
    [self.totalLosesLabel.topAnchor constraintEqualToAnchor:self.shareOfWinsLabel.topAnchor].active = YES;
    [self.totalLosesLabel.leftAnchor constraintEqualToAnchor:losesNameLabel.leftAnchor].active = YES;
    [self.totalLosesLabel.rightAnchor constraintEqualToAnchor:losesNameLabel.rightAnchor].active = YES;
    [self.totalLosesLabel.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)setupTableViewController
{
    self.tableViewController = [DTSSectionsOfStatiscticsTableViewController new];
    [self addChildViewController:self.tableViewController];
    [self.view addSubview:self.tableViewController.view];
    [self.tableViewController didMoveToParentViewController:self];
    
    [self.tableViewController.view.topAnchor constraintEqualToAnchor:self.shareOfWinsLabel.bottomAnchor constant:40].active = YES;
    [self.tableViewController.view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.tableViewController.view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.tableViewController.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-40].active = YES;
}

- (void)steam32IDRecived
{
    [self updateAllInformation];
}

- (void)updateAllInformation
{
    self.tableViewController.isInternetConnectionAvailable = YES;
    self.tableViewController.isInformationFind = YES;
    [self.networkService getGeneralUserInfromationWithSteam32Id:[[NSUserDefaults standardUserDefaults] stringForKey:@"Steam32Id"]];
    [self.networkService getWinAndLosesWithSteam32Id:[[NSUserDefaults standardUserDefaults] stringForKey:@"Steam32Id"]];
}

- (void)updateButtonAction
{
    [self resetData];
    [self updateAllInformation];
}

- (void)resetData
{
    [self.userImageView setImage:nil];
    [self.userNameLabel setText:@""];
    [self.estimateMMRLabel setText:@""];
    [self.totalWinsLabel setText:@"-"];
    [self.shareOfWinsLabel setText:@"-"];
    [self.totalLosesLabel setText:@"-"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)infrormationIsntFind
{
    self.tableViewController.isInformationFind = NO;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Упс ..." message:@"По данному Steam32 ID не найдено данных 😢. Измените его в разделе 'Настройки' и повторите попытку" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)checkInternetConnection
{
    self.tableViewController.isInternetConnectionAvailable = NO;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Интеренет соединение" message:@"Для получения данных необходимо наличие интеренет соединения.😎 Проверьте его и повторите попытку. \n \n P.S. Также, наше API может быть временно недоступно. Повторите попытку позднее" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)setGeneralUserInformationWithPersonalName:(NSString *)personalName estimateMMR:(NSString *)estimateMMR
{
    [self.userNameLabel setText:personalName];
    [self.estimateMMRLabel setText:[NSString stringWithFormat:@"≈ %@ MMR", estimateMMR]];
}

- (void)setWins:(NSNumber *)wins loses:(NSNumber *)loses
{
    [self.totalWinsLabel setText:wins.stringValue];
    NSNumber *shareOfWins = [NSNumber numberWithFloat:(float)(100/(wins.floatValue + loses.floatValue) * wins.floatValue)];
    [self.shareOfWinsLabel setText:[NSString stringWithFormat:@"%0.2f%%", shareOfWins.floatValue]];
    [self.totalLosesLabel setText:loses.stringValue];
}

- (void)setUserImage:(UIImage *)userImage
{
    [self.userImageView setImage:userImage];
}

@end
