//
//  DTSTotalStatsViewController.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSTotalStatsViewController.h"
#import "DTSTotalStatsNetworkService.h"
#import "DTSTotalStats.h"


@interface DTSTotalStatsViewController ()

@property (nonatomic, strong) DTSTotalStatsNetworkService *networkService;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *allMatchesTitleLabel;
@property (nonatomic, strong) UILabel *inAnalyzedMatchesTitleLabel;
@property (nonatomic, strong) UILabel *countOfAnalyzedMatchesLabel;

@property (nonatomic, strong) UILabel *killsNameLabel;
@property (nonatomic, strong) UILabel *killsLabel;

@property (nonatomic, strong) UILabel *deathsNameLabel;
@property (nonatomic, strong) UILabel *deathsLabel;

@property (nonatomic, strong) UILabel *assistsNameLabel;
@property (nonatomic, strong) UILabel *assistsLabel;

@property (nonatomic, strong) UILabel *lastHitsNameLabel;
@property (nonatomic, strong) UILabel *lastHitsLabel;

@property (nonatomic, strong) UILabel *deniesNameLabel;
@property (nonatomic, strong) UILabel *deniesLabel;

@property (nonatomic, strong) UILabel *durationNameLabel;
@property (nonatomic, strong) UILabel *durationLabel;

@property (nonatomic, strong) UILabel *levelNameLabel;
@property (nonatomic, strong) UILabel *levelLabel;

@property (nonatomic, strong) UILabel *heroDamageNameLabel;
@property (nonatomic, strong) UILabel *heroDamageLabel;

@property (nonatomic, strong) UILabel *towerDamageNameLabel;
@property (nonatomic, strong) UILabel *towerDamageLabel;

@property (nonatomic, strong) UILabel *heroHealingNameLabel;
@property (nonatomic, strong) UILabel *heroHealingLabel;

@property (nonatomic, strong) UILabel *stunsNameLabel;
@property (nonatomic, strong) UILabel *stunsLabel;

@property (nonatomic, strong) UILabel *towetKillsNameLabel;
@property (nonatomic, strong) UILabel *towetKillsLabel;

@property (nonatomic, strong) UILabel *neutralKillsNameLabel;
@property (nonatomic, strong) UILabel *neutralKillsLabel;

@property (nonatomic, strong) UILabel *courierKillsNameLabel;
@property (nonatomic, strong) UILabel *courierKillsLabel;

@property (nonatomic, strong) UILabel *purchaseTpscrollNameLabel;
@property (nonatomic, strong) UILabel *purchaseTpscrollLabel;

@property (nonatomic, strong) UILabel *purchaseWardObserverNameLabel;
@property (nonatomic, strong) UILabel *purchaseWardObserverLabel;

@property (nonatomic, strong) UILabel *purchaseWardSentryNameLabel;
@property (nonatomic, strong) UILabel *purchaseWardSentryLabel;

@property (nonatomic, strong) UILabel *purchaseGemNameLabel;
@property (nonatomic, strong) UILabel *purchaseGemLabel;

@property (nonatomic, strong) UILabel *purchaseRapierNameLabel;
@property (nonatomic, strong) UILabel *purchaseRapieraLabel;

@property (nonatomic, strong) UILabel *mapPingsNameLabel;
@property (nonatomic, strong) UILabel *mapPingsLabel;

@end


@implementation DTSTotalStatsViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _networkService = [DTSTotalStatsNetworkService new];
        _networkService.DTSTotalStatsViewConstrollerDelegate = self;
        
        _scrollView = [UIScrollView new];
        _contentView = [UIView new];
        _allMatchesTitleLabel = [UILabel new];
        _inAnalyzedMatchesTitleLabel = [UILabel new];
        _countOfAnalyzedMatchesLabel = [UILabel new];
        
        _killsNameLabel = [UILabel new];
        _killsLabel = [UILabel new];
        
        _deathsNameLabel = [UILabel new];
        _deathsLabel = [UILabel new];
        
        _assistsNameLabel = [UILabel new];
        _assistsLabel = [UILabel new];
        
        _lastHitsNameLabel = [UILabel new];
        _lastHitsLabel = [UILabel new];
        
        _deniesNameLabel = [UILabel new];
        _deniesLabel = [UILabel new];
        
        _durationNameLabel = [UILabel new];
        _durationLabel = [UILabel new];
        
        _levelNameLabel = [UILabel new];
        _levelLabel = [UILabel new];
        
        _heroDamageNameLabel = [UILabel new];
        _heroDamageLabel = [UILabel new];
        
        _towerDamageNameLabel = [UILabel new];
        _towerDamageLabel = [UILabel new];
        
        _heroHealingNameLabel = [UILabel new];
        _heroHealingLabel = [UILabel new];
        
        _stunsNameLabel = [UILabel new];
        _stunsLabel = [UILabel new];
        
        _towetKillsNameLabel = [UILabel new];
        _towetKillsLabel = [UILabel new];
        
        _neutralKillsNameLabel = [UILabel new];
        _neutralKillsLabel = [UILabel new];
        
        _courierKillsNameLabel = [UILabel new];
        _courierKillsLabel = [UILabel new];
        
        _purchaseTpscrollNameLabel = [UILabel new];
        _purchaseTpscrollLabel = [UILabel new];
        
        _purchaseWardObserverNameLabel = [UILabel new];
        _purchaseWardObserverLabel = [UILabel new];
        
        _purchaseWardSentryNameLabel = [UILabel new];
        _purchaseWardSentryLabel = [UILabel new];
        
        _purchaseGemNameLabel = [UILabel new];
        _purchaseGemLabel = [UILabel new];
        
        _purchaseRapierNameLabel = [UILabel new];
        _purchaseRapieraLabel = [UILabel new];
        
        _mapPingsNameLabel = [UILabel new];
        _mapPingsLabel = [UILabel new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:27.0f/255.0f green:28.0f/255.0f blue:32.0f/255.0f alpha:1];
    [self setupNavigationBar];
    [self setupScrollViewAndContentView];
    [self setupAllMatchesTitle];
    [self setupAllMatchesStats];
    [self setupInAnalyzedMatchesTitleLabel];
    [self.networkService getTotalStatsWithSteam32Id:[[NSUserDefaults standardUserDefaults] stringForKey:@"Steam32Id"]];
}

- (void)viewDidLayoutSubviews
{
    self.scrollView.contentSize = self.contentView.frame.size;
}

- (void)setupNavigationBar
{
    self.navigationItem.title = @"Общее";
}

- (void)setupScrollViewAndContentView
{
    self.scrollView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + 5, self.view.frame.size.width, self.view.frame.size.height);
    self.scrollView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:self.scrollView];
    
    self.contentView.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, 1150);
    self.contentView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.scrollView addSubview:self.contentView];
    
}

- (void)setupAllMatchesTitle
{
    [self.allMatchesTitleLabel setText:@"Все матчи"];
    self.allMatchesTitleLabel.textColor = UIColor.whiteColor;
    [self.allMatchesTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:21]];
    self.allMatchesTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.allMatchesTitleLabel];
    [self.allMatchesTitleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5].active = YES;
    [self.allMatchesTitleLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:10].active = YES;
    [self.allMatchesTitleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [self.allMatchesTitleLabel.heightAnchor constraintEqualToConstant:20].active = YES;
}


- (void)setupAllMatchesStats
{
    [self.killsNameLabel setText:@"УБИЙСТВА"];
    self.killsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.killsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.killsNameLabel.textAlignment = NSTextAlignmentCenter;
    self.killsNameLabel.frame = CGRectMake(10, 40, self.view.frame.size.width/2 - 20, 40);
    [self.contentView addSubview:self.killsNameLabel];
    
    [self.killsLabel setText:@"-"];
    self.killsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.killsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.killsLabel.textColor = UIColor.whiteColor;
    self.killsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.killsLabel];
    [self.killsLabel.topAnchor constraintEqualToAnchor:self.killsNameLabel.bottomAnchor].active = YES;
    [self.killsLabel.leftAnchor constraintEqualToAnchor:self.killsNameLabel.leftAnchor].active = YES;
    [self.killsLabel.rightAnchor constraintEqualToAnchor:self.killsNameLabel.rightAnchor].active = YES;
    [self.killsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.deathsNameLabel setText:@"СМЕРТИ"];
    self.deathsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.deathsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.deathsNameLabel.textAlignment = NSTextAlignmentCenter;
    self.deathsNameLabel.frame = CGRectMake(self.view.frame.size.width/2 + 10, 40, self.view.frame.size.width/2 - 20, 40);
    [self.contentView addSubview:self.deathsNameLabel];
    
    [self.deathsLabel setText:@"-"];
    self.deathsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.deathsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.deathsLabel.textColor = UIColor.whiteColor;
    self.deathsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.deathsLabel];
    [self.deathsLabel.topAnchor constraintEqualToAnchor:self.deathsNameLabel.bottomAnchor].active = YES;
    [self.deathsLabel.leftAnchor constraintEqualToAnchor:self.deathsNameLabel.leftAnchor].active = YES;
    [self.deathsLabel.rightAnchor constraintEqualToAnchor:self.deathsNameLabel.rightAnchor].active = YES;
    [self.deathsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.assistsNameLabel setText:@"ПОМОЩЬ"];
    self.assistsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.assistsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.assistsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.assistsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.assistsNameLabel];
    [self.assistsNameLabel.topAnchor constraintEqualToAnchor:self.killsLabel.bottomAnchor constant:15].active = YES;
    [self.assistsNameLabel.leftAnchor constraintEqualToAnchor:self.killsLabel.leftAnchor].active = YES;
    [self.assistsNameLabel.rightAnchor constraintEqualToAnchor:self.killsLabel.rightAnchor].active = YES;
    [self.assistsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.assistsLabel setText:@"-"];
    self.assistsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.assistsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.assistsLabel.textColor = UIColor.whiteColor;
    self.assistsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.assistsLabel];
    [self.assistsLabel.topAnchor constraintEqualToAnchor:self.assistsNameLabel.bottomAnchor].active = YES;
    [self.assistsLabel.leftAnchor constraintEqualToAnchor:self.assistsNameLabel.leftAnchor].active = YES;
    [self.assistsLabel.rightAnchor constraintEqualToAnchor:self.assistsNameLabel.rightAnchor].active = YES;
    [self.assistsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.lastHitsNameLabel setText:@"ДОБИТО КРИПОВ"];
    self.lastHitsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.lastHitsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.lastHitsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastHitsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.lastHitsNameLabel];
    [self.lastHitsNameLabel.topAnchor constraintEqualToAnchor:self.deathsLabel.bottomAnchor constant:15].active = YES;
    [self.lastHitsNameLabel.leftAnchor constraintEqualToAnchor:self.deathsLabel.leftAnchor].active = YES;
    [self.lastHitsNameLabel.rightAnchor constraintEqualToAnchor:self.deathsLabel.rightAnchor].active = YES;
    [self.lastHitsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.lastHitsLabel setText:@"-"];
    self.lastHitsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastHitsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.lastHitsLabel.textColor = UIColor.whiteColor;
    self.lastHitsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.lastHitsLabel];
    [self.lastHitsLabel.topAnchor constraintEqualToAnchor:self.lastHitsNameLabel.bottomAnchor].active = YES;
    [self.lastHitsLabel.leftAnchor constraintEqualToAnchor:self.lastHitsNameLabel.leftAnchor].active = YES;
    [self.lastHitsLabel.rightAnchor constraintEqualToAnchor:self.lastHitsNameLabel.rightAnchor].active = YES;
    [self.lastHitsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.deniesNameLabel setText:@"НЕ ОТДАНО КРИПОВ"];
    self.deniesNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.deniesNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.deniesNameLabel.adjustsFontSizeToFitWidth = YES;
    self.deniesNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.deniesNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.deniesNameLabel];
    [self.deniesNameLabel.topAnchor constraintEqualToAnchor:self.assistsLabel.bottomAnchor constant:15].active = YES;
    [self.deniesNameLabel.leftAnchor constraintEqualToAnchor:self.assistsLabel.leftAnchor].active = YES;
    [self.deniesNameLabel.rightAnchor constraintEqualToAnchor:self.assistsLabel.rightAnchor].active = YES;
    [self.deniesNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.deniesLabel setText:@"-"];
    self.deniesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.deniesLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.deniesLabel.textColor = UIColor.whiteColor;
    self.deniesLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.deniesLabel];
    [self.deniesLabel.topAnchor constraintEqualToAnchor:self.deniesNameLabel.bottomAnchor].active = YES;
    [self.deniesLabel.leftAnchor constraintEqualToAnchor:self.deniesNameLabel.leftAnchor].active = YES;
    [self.deniesLabel.rightAnchor constraintEqualToAnchor:self.deniesNameLabel.rightAnchor].active = YES;
    [self.deniesLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.durationNameLabel setText:@"ПРОДОЛЖИТЕЛЬНОСТЬ"];
    self.durationNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.durationNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.durationNameLabel.adjustsFontSizeToFitWidth = YES;
    self.durationNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.durationNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.durationNameLabel];
    [self.durationNameLabel.topAnchor constraintEqualToAnchor:self.lastHitsLabel.bottomAnchor constant:15].active = YES;
    [self.durationNameLabel.leftAnchor constraintEqualToAnchor:self.lastHitsLabel.leftAnchor].active = YES;
    [self.durationNameLabel.rightAnchor constraintEqualToAnchor:self.lastHitsLabel.rightAnchor].active = YES;
    [self.durationNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.durationLabel setText:@"-"];
    self.durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.durationLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.durationLabel.textColor = UIColor.whiteColor;
    self.durationLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.durationLabel];
    [self.durationLabel.topAnchor constraintEqualToAnchor:self.durationNameLabel.bottomAnchor].active = YES;
    [self.durationLabel.leftAnchor constraintEqualToAnchor:self.durationNameLabel.leftAnchor].active = YES;
    [self.durationLabel.rightAnchor constraintEqualToAnchor:self.durationNameLabel.rightAnchor].active = YES;
    [self.durationLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.levelNameLabel setText:@"УРОВЕНЬ"];
    self.levelNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.levelNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.levelNameLabel.adjustsFontSizeToFitWidth = YES;
    self.levelNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.levelNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.levelNameLabel];
    [self.levelNameLabel.topAnchor constraintEqualToAnchor:self.deniesLabel.bottomAnchor constant:15].active = YES;
    [self.levelNameLabel.leftAnchor constraintEqualToAnchor:self.deniesLabel.leftAnchor].active = YES;
    [self.levelNameLabel.rightAnchor constraintEqualToAnchor:self.deniesLabel.rightAnchor].active = YES;
    [self.levelNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.levelLabel setText:@"-"];
    self.levelLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.levelLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.levelLabel.textColor = UIColor.whiteColor;
    self.levelLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.levelLabel];
    [self.levelLabel.topAnchor constraintEqualToAnchor:self.levelNameLabel.bottomAnchor].active = YES;
    [self.levelLabel.leftAnchor constraintEqualToAnchor:self.levelNameLabel.leftAnchor].active = YES;
    [self.levelLabel.rightAnchor constraintEqualToAnchor:self.levelNameLabel.rightAnchor].active = YES;
    [self.levelLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.heroDamageNameLabel setText:@"УРОН ПО ГЕРОЯМ"];
    self.heroDamageNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.heroDamageNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.heroDamageNameLabel.adjustsFontSizeToFitWidth = YES;
    self.heroDamageNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.heroDamageNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.heroDamageNameLabel];
    [self.heroDamageNameLabel.topAnchor constraintEqualToAnchor:self.durationLabel.bottomAnchor constant:15].active = YES;
    [self.heroDamageNameLabel.leftAnchor constraintEqualToAnchor:self.durationLabel.leftAnchor].active = YES;
    [self.heroDamageNameLabel.rightAnchor constraintEqualToAnchor:self.durationLabel.rightAnchor].active = YES;
    [self.heroDamageNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.heroDamageLabel setText:@"-"];
    self.heroDamageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.heroDamageLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.heroDamageLabel.textColor = UIColor.whiteColor;
    self.heroDamageLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.heroDamageLabel];
    [self.heroDamageLabel.topAnchor constraintEqualToAnchor:self.heroDamageNameLabel.bottomAnchor].active = YES;
    [self.heroDamageLabel.leftAnchor constraintEqualToAnchor:self.heroDamageNameLabel.leftAnchor].active = YES;
    [self.heroDamageLabel.rightAnchor constraintEqualToAnchor:self.heroDamageNameLabel.rightAnchor].active = YES;
    [self.heroDamageLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.towerDamageNameLabel setText:@"УРОН ПО СТРОЕНИЯМ"];
    self.towerDamageNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.towerDamageNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.towerDamageNameLabel.adjustsFontSizeToFitWidth = YES;
    self.towerDamageNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.towerDamageNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.towerDamageNameLabel];
    [self.towerDamageNameLabel.topAnchor constraintEqualToAnchor:self.levelLabel.bottomAnchor constant:15].active = YES;
    [self.towerDamageNameLabel.leftAnchor constraintEqualToAnchor:self.levelLabel.leftAnchor].active = YES;
    [self.towerDamageNameLabel.rightAnchor constraintEqualToAnchor:self.levelLabel.rightAnchor].active = YES;
    [self.towerDamageNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.towerDamageLabel setText:@"-"];
    self.towerDamageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.towerDamageLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.towerDamageLabel.textColor = UIColor.whiteColor;
    self.towerDamageLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.towerDamageLabel];
    [self.towerDamageLabel.topAnchor constraintEqualToAnchor:self.towerDamageNameLabel.bottomAnchor].active = YES;
    [self.towerDamageLabel.leftAnchor constraintEqualToAnchor:self.towerDamageNameLabel.leftAnchor].active = YES;
    [self.towerDamageLabel.rightAnchor constraintEqualToAnchor:self.towerDamageNameLabel.rightAnchor].active = YES;
    [self.towerDamageLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.heroHealingNameLabel setText:@"ЛЕЧЕНИЕ ГЕРОЕВ"];
    self.heroHealingNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.heroHealingNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.heroHealingNameLabel.adjustsFontSizeToFitWidth = YES;
    self.heroHealingNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.heroHealingNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.heroHealingNameLabel];
    [self.heroHealingNameLabel.topAnchor constraintEqualToAnchor:self.heroDamageLabel.bottomAnchor constant:15].active = YES;
    [self.heroHealingNameLabel.leftAnchor constraintEqualToAnchor:self.heroDamageLabel.leftAnchor].active = YES;
    [self.heroHealingNameLabel.rightAnchor constraintEqualToAnchor:self.heroDamageLabel.rightAnchor].active = YES;
    [self.heroHealingNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.heroHealingLabel setText:@"-"];
    self.heroHealingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.heroHealingLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.heroHealingLabel.textColor = UIColor.whiteColor;
    self.heroHealingLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.heroHealingLabel];
    [self.heroHealingLabel.topAnchor constraintEqualToAnchor:self.heroHealingNameLabel.bottomAnchor].active = YES;
    [self.heroHealingLabel.leftAnchor constraintEqualToAnchor:self.heroHealingNameLabel.leftAnchor].active = YES;
    [self.heroHealingLabel.rightAnchor constraintEqualToAnchor:self.heroHealingNameLabel.rightAnchor].active = YES;
    [self.heroHealingLabel.heightAnchor constraintEqualToConstant:40].active = YES;
}

- (void)setupInAnalyzedMatchesTitleLabel
{
    [self.inAnalyzedMatchesTitleLabel setText:@"В анализируемых матчах"];
    self.inAnalyzedMatchesTitleLabel.textColor = UIColor.whiteColor;
    [self.inAnalyzedMatchesTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:21]];
    self.inAnalyzedMatchesTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.inAnalyzedMatchesTitleLabel];
    [self.inAnalyzedMatchesTitleLabel.topAnchor constraintEqualToAnchor:self.towerDamageLabel.bottomAnchor constant:25].active = YES;
    [self.inAnalyzedMatchesTitleLabel.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor constant:10].active = YES;
    [self.inAnalyzedMatchesTitleLabel.widthAnchor constraintEqualToConstant:260].active = YES;
    [self.inAnalyzedMatchesTitleLabel.heightAnchor constraintEqualToConstant:30].active = YES;
    
    [self.countOfAnalyzedMatchesLabel setText:@"(-)"];
    self.countOfAnalyzedMatchesLabel.textColor = UIColor.whiteColor;
    [self.countOfAnalyzedMatchesLabel setFont:[UIFont fontWithName:@"Helvetica" size:21]];
    self.countOfAnalyzedMatchesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.countOfAnalyzedMatchesLabel];
    [self.countOfAnalyzedMatchesLabel.topAnchor constraintEqualToAnchor:self.inAnalyzedMatchesTitleLabel.topAnchor].active = YES;
    [self.countOfAnalyzedMatchesLabel.leftAnchor constraintEqualToAnchor:self.inAnalyzedMatchesTitleLabel.rightAnchor].active = YES;
    [self.countOfAnalyzedMatchesLabel.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.countOfAnalyzedMatchesLabel.heightAnchor constraintEqualToConstant:30].active = YES;
    
    [self.stunsNameLabel setText:@"ОГЛУШИЛ"];
    self.stunsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.stunsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.stunsNameLabel.adjustsFontSizeToFitWidth = YES;
    self.stunsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.stunsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.stunsNameLabel];
    [self.stunsNameLabel.topAnchor constraintEqualToAnchor:self.inAnalyzedMatchesTitleLabel.bottomAnchor constant:15].active = YES;
    [self.stunsNameLabel.leftAnchor constraintEqualToAnchor:self.towerDamageLabel.leftAnchor].active = YES;
    [self.stunsNameLabel.rightAnchor constraintEqualToAnchor:self.towerDamageLabel.rightAnchor].active = YES;
    [self.stunsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.stunsLabel setText:@"-"];
    self.stunsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.stunsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.stunsLabel.textColor = UIColor.whiteColor;
    self.stunsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.stunsLabel];
    [self.stunsLabel.topAnchor constraintEqualToAnchor:self.stunsNameLabel.bottomAnchor].active = YES;
    [self.stunsLabel.leftAnchor constraintEqualToAnchor:self.stunsNameLabel.leftAnchor].active = YES;
    [self.stunsLabel.rightAnchor constraintEqualToAnchor:self.stunsNameLabel.rightAnchor].active = YES;
    [self.stunsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.towetKillsNameLabel setText:@"БАШЕН РАЗРУШЕНО"];
    self.towetKillsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.towetKillsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.towetKillsNameLabel.adjustsFontSizeToFitWidth = YES;
    self.towetKillsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.towetKillsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.towetKillsNameLabel];
    [self.towetKillsNameLabel.topAnchor constraintEqualToAnchor:self.stunsNameLabel.topAnchor].active = YES;
    [self.towetKillsNameLabel.leftAnchor constraintEqualToAnchor:self.heroHealingLabel.leftAnchor].active = YES;
    [self.towetKillsNameLabel.rightAnchor constraintEqualToAnchor:self.heroHealingLabel.rightAnchor].active = YES;
    [self.towetKillsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.towetKillsLabel setText:@"-"];
    self.towetKillsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.towetKillsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.towetKillsLabel.textColor = UIColor.whiteColor;
    self.towetKillsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.towetKillsLabel];
    [self.towetKillsLabel.topAnchor constraintEqualToAnchor:self.towetKillsNameLabel.bottomAnchor].active = YES;
    [self.towetKillsLabel.leftAnchor constraintEqualToAnchor:self.towetKillsNameLabel.leftAnchor].active = YES;
    [self.towetKillsLabel.rightAnchor constraintEqualToAnchor:self.towetKillsNameLabel.rightAnchor].active = YES;
    [self.towetKillsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.neutralKillsNameLabel setText:@"УБИТО НЕЙТРАЛОВ"];
    self.neutralKillsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.neutralKillsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.neutralKillsNameLabel.adjustsFontSizeToFitWidth = YES;
    self.neutralKillsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.neutralKillsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.neutralKillsNameLabel];
    [self.neutralKillsNameLabel.topAnchor constraintEqualToAnchor:self.stunsLabel.bottomAnchor constant:15].active = YES;
    [self.neutralKillsNameLabel.leftAnchor constraintEqualToAnchor:self.stunsLabel.leftAnchor].active = YES;
    [self.neutralKillsNameLabel.rightAnchor constraintEqualToAnchor:self.stunsLabel.rightAnchor].active = YES;
    [self.neutralKillsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.neutralKillsLabel setText:@"-"];
    self.neutralKillsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.neutralKillsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.neutralKillsLabel.textColor = UIColor.whiteColor;
    self.neutralKillsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.neutralKillsLabel];
    [self.neutralKillsLabel.topAnchor constraintEqualToAnchor:self.neutralKillsNameLabel.bottomAnchor].active = YES;
    [self.neutralKillsLabel.leftAnchor constraintEqualToAnchor:self.neutralKillsNameLabel.leftAnchor].active = YES;
    [self.neutralKillsLabel.rightAnchor constraintEqualToAnchor:self.neutralKillsNameLabel.rightAnchor].active = YES;
    [self.neutralKillsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.courierKillsNameLabel setText:@"УБИТО КУРЬЕРОВ"];
    self.courierKillsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.courierKillsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.courierKillsNameLabel.adjustsFontSizeToFitWidth = YES;
    self.courierKillsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.courierKillsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.courierKillsNameLabel];
    [self.courierKillsNameLabel.topAnchor constraintEqualToAnchor:self.towetKillsLabel.bottomAnchor constant:15].active = YES;
    [self.courierKillsNameLabel.leftAnchor constraintEqualToAnchor:self.towetKillsLabel.leftAnchor].active = YES;
    [self.courierKillsNameLabel.rightAnchor constraintEqualToAnchor:self.towetKillsLabel.rightAnchor].active = YES;
    [self.courierKillsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.courierKillsLabel setText:@"-"];
    self.courierKillsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.courierKillsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.courierKillsLabel.textColor = UIColor.whiteColor;
    self.courierKillsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.courierKillsLabel];
    [self.courierKillsLabel.topAnchor constraintEqualToAnchor:self.courierKillsNameLabel.bottomAnchor].active = YES;
    [self.courierKillsLabel.leftAnchor constraintEqualToAnchor:self.courierKillsNameLabel.leftAnchor].active = YES;
    [self.courierKillsLabel.rightAnchor constraintEqualToAnchor:self.courierKillsNameLabel.rightAnchor].active = YES;
    [self.courierKillsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseTpscrollNameLabel setText:@"КУПЛЕНО СВИТКОВ ТЕЛЕПОРТАЦИИ"];
    self.purchaseTpscrollNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.purchaseTpscrollNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.purchaseTpscrollNameLabel.adjustsFontSizeToFitWidth = YES;
    self.purchaseTpscrollNameLabel.numberOfLines = 0;
    self.purchaseTpscrollNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseTpscrollNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseTpscrollNameLabel];
    [self.purchaseTpscrollNameLabel.topAnchor constraintEqualToAnchor:self.neutralKillsLabel.bottomAnchor constant:15].active = YES;
    [self.purchaseTpscrollNameLabel.leftAnchor constraintEqualToAnchor:self.neutralKillsLabel.leftAnchor].active = YES;
    [self.purchaseTpscrollNameLabel.rightAnchor constraintEqualToAnchor:self.neutralKillsLabel.rightAnchor].active = YES;
    [self.purchaseTpscrollNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseTpscrollLabel setText:@"-"];
    self.purchaseTpscrollLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseTpscrollLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.purchaseTpscrollLabel.textColor = UIColor.whiteColor;
    self.purchaseTpscrollLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseTpscrollLabel];
    [self.purchaseTpscrollLabel.topAnchor constraintEqualToAnchor:self.purchaseTpscrollNameLabel.bottomAnchor].active = YES;
    [self.purchaseTpscrollLabel.leftAnchor constraintEqualToAnchor:self.purchaseTpscrollNameLabel.leftAnchor].active = YES;
    [self.purchaseTpscrollLabel.rightAnchor constraintEqualToAnchor:self.purchaseTpscrollNameLabel.rightAnchor].active = YES;
    [self.purchaseTpscrollLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseWardObserverNameLabel setText:@"КУПЛЕНО OBSERVER WARD"];
    self.purchaseWardObserverNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.purchaseWardObserverNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.purchaseWardObserverNameLabel.adjustsFontSizeToFitWidth = YES;
    self.purchaseWardObserverNameLabel.numberOfLines = 0;
    self.purchaseWardObserverNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseWardObserverNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseWardObserverNameLabel];
    [self.purchaseWardObserverNameLabel.topAnchor constraintEqualToAnchor:self.courierKillsLabel.bottomAnchor constant:15].active = YES;
    [self.purchaseWardObserverNameLabel.leftAnchor constraintEqualToAnchor:self.courierKillsLabel.leftAnchor].active = YES;
    [self.purchaseWardObserverNameLabel.rightAnchor constraintEqualToAnchor:self.courierKillsLabel.rightAnchor].active = YES;
    [self.purchaseWardObserverNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseWardObserverLabel setText:@"-"];
    self.purchaseWardObserverLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseWardObserverLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.purchaseWardObserverLabel.textColor = UIColor.whiteColor;
    self.purchaseWardObserverLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseWardObserverLabel];
    [self.purchaseWardObserverLabel.topAnchor constraintEqualToAnchor:self.purchaseWardObserverNameLabel.bottomAnchor].active = YES;
    [self.purchaseWardObserverLabel.leftAnchor constraintEqualToAnchor:self.purchaseWardObserverNameLabel.leftAnchor].active = YES;
    [self.purchaseWardObserverLabel.rightAnchor constraintEqualToAnchor:self.purchaseWardObserverNameLabel.rightAnchor].active = YES;
    [self.purchaseWardObserverLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseWardSentryNameLabel setText:@"КУПЛЕНО SENTRY WARD"];
    self.purchaseWardSentryNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.purchaseWardSentryNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.purchaseWardSentryNameLabel.adjustsFontSizeToFitWidth = YES;
    self.purchaseWardSentryNameLabel.numberOfLines = 0;
    self.purchaseWardSentryNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseWardSentryNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseWardSentryNameLabel];
    [self.purchaseWardSentryNameLabel.topAnchor constraintEqualToAnchor:self.purchaseTpscrollLabel.bottomAnchor constant:15].active = YES;
    [self.purchaseWardSentryNameLabel.leftAnchor constraintEqualToAnchor:self.purchaseTpscrollLabel.leftAnchor].active = YES;
    [self.purchaseWardSentryNameLabel.rightAnchor constraintEqualToAnchor:self.purchaseTpscrollLabel.rightAnchor].active = YES;
    [self.purchaseWardSentryNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseWardSentryLabel setText:@"-"];
    self.purchaseWardSentryLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseWardSentryLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.purchaseWardSentryLabel.textColor = UIColor.whiteColor;
    self.purchaseWardSentryLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseWardSentryLabel];
    [self.purchaseWardSentryLabel.topAnchor constraintEqualToAnchor:self.purchaseWardSentryNameLabel.bottomAnchor].active = YES;
    [self.purchaseWardSentryLabel.leftAnchor constraintEqualToAnchor:self.purchaseWardSentryNameLabel.leftAnchor].active = YES;
    [self.purchaseWardSentryLabel.rightAnchor constraintEqualToAnchor:self.purchaseWardSentryNameLabel.rightAnchor].active = YES;
    [self.purchaseWardSentryLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseGemNameLabel setText:@"КУПЛЕНО GEM"];
    self.purchaseGemNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.purchaseGemNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.purchaseGemNameLabel.adjustsFontSizeToFitWidth = YES;
    self.purchaseGemNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseGemNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseGemNameLabel];
    [self.purchaseGemNameLabel.topAnchor constraintEqualToAnchor:self.purchaseWardObserverLabel.bottomAnchor constant:15].active = YES;
    [self.purchaseGemNameLabel.leftAnchor constraintEqualToAnchor:self.purchaseWardObserverLabel.leftAnchor].active = YES;
    [self.purchaseGemNameLabel.rightAnchor constraintEqualToAnchor:self.purchaseWardObserverLabel.rightAnchor].active = YES;
    [self.purchaseGemNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseGemLabel setText:@"-"];
    self.purchaseGemLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseGemLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.purchaseGemLabel.textColor = UIColor.whiteColor;
    self.purchaseGemLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseGemLabel];
    [self.purchaseGemLabel.topAnchor constraintEqualToAnchor:self.purchaseGemNameLabel.bottomAnchor].active = YES;
    [self.purchaseGemLabel.leftAnchor constraintEqualToAnchor:self.purchaseGemNameLabel.leftAnchor].active = YES;
    [self.purchaseGemLabel.rightAnchor constraintEqualToAnchor:self.purchaseGemNameLabel.rightAnchor].active = YES;
    [self.purchaseGemLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseRapierNameLabel setText:@"КУПЛЕНО RAPIER"];
    self.purchaseRapierNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.purchaseRapierNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.purchaseRapierNameLabel.adjustsFontSizeToFitWidth = YES;
    self.purchaseRapierNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseRapierNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseRapierNameLabel];
    [self.purchaseRapierNameLabel.topAnchor constraintEqualToAnchor:self.purchaseWardSentryLabel.bottomAnchor constant:15].active = YES;
    [self.purchaseRapierNameLabel.leftAnchor constraintEqualToAnchor:self.purchaseWardSentryLabel.leftAnchor].active = YES;
    [self.purchaseRapierNameLabel.rightAnchor constraintEqualToAnchor:self.purchaseWardSentryLabel.rightAnchor].active = YES;
    [self.purchaseRapierNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.purchaseRapieraLabel setText:@"-"];
    self.purchaseRapieraLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.purchaseRapieraLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.purchaseRapieraLabel.textColor = UIColor.whiteColor;
    self.purchaseRapieraLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.purchaseRapieraLabel];
    [self.purchaseRapieraLabel.topAnchor constraintEqualToAnchor:self.purchaseRapierNameLabel.bottomAnchor].active = YES;
    [self.purchaseRapieraLabel.leftAnchor constraintEqualToAnchor:self.purchaseRapierNameLabel.leftAnchor].active = YES;
    [self.purchaseRapieraLabel.rightAnchor constraintEqualToAnchor:self.purchaseRapierNameLabel.rightAnchor].active = YES;
    [self.purchaseRapieraLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.mapPingsNameLabel setText:@"СИГНАЛОВ НА КАРТЕ"];
    self.mapPingsNameLabel.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    self.mapPingsNameLabel.textColor = [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.mapPingsNameLabel.adjustsFontSizeToFitWidth = YES;
    self.mapPingsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.mapPingsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.mapPingsNameLabel];
    [self.mapPingsNameLabel.topAnchor constraintEqualToAnchor:self.purchaseGemLabel.bottomAnchor constant:15].active = YES;
    [self.mapPingsNameLabel.leftAnchor constraintEqualToAnchor:self.purchaseGemLabel.leftAnchor].active = YES;
    [self.mapPingsNameLabel.rightAnchor constraintEqualToAnchor:self.purchaseGemLabel.rightAnchor].active = YES;
    [self.mapPingsNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.mapPingsLabel setText:@"-"];
    self.mapPingsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.mapPingsLabel.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.mapPingsLabel.textColor = UIColor.whiteColor;
    self.mapPingsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.mapPingsLabel];
    [self.mapPingsLabel.topAnchor constraintEqualToAnchor:self.mapPingsNameLabel.bottomAnchor].active = YES;
    [self.mapPingsLabel.leftAnchor constraintEqualToAnchor:self.mapPingsNameLabel.leftAnchor].active = YES;
    [self.mapPingsLabel.rightAnchor constraintEqualToAnchor:self.mapPingsNameLabel.rightAnchor].active = YES;
    [self.mapPingsLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
}

- (void)setTotalStats:(DTSTotalStats *)totalStats
{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setUsesGroupingSeparator:YES];
    [formatter setGroupingSeparator:@"\u00a0"];
    [formatter setGroupingSize:3];
    
    [self.killsLabel setText:[formatter stringFromNumber:totalStats.kills]];
    [self.deathsLabel setText:[formatter stringFromNumber:totalStats.deaths]];
    [self.assistsLabel setText:[formatter stringFromNumber:totalStats.assists]];
    [self.lastHitsLabel setText:[formatter stringFromNumber:totalStats.lastHits]];
    [self.deniesLabel setText:[formatter stringFromNumber:totalStats.denies]];
    [self.durationLabel setText:[DTSTotalStats convertTotalDurationToString:totalStats.durationInSeconds]];
    [self.levelLabel setText:[formatter stringFromNumber:totalStats.level]];
    [self.heroDamageLabel setText:[formatter stringFromNumber:totalStats.heroDamage]];
    [self.towerDamageLabel setText:[formatter stringFromNumber:totalStats.towerDamage]];
    [self.heroHealingLabel setText:[formatter stringFromNumber:totalStats.heroHealing]];
    [self.stunsLabel setText:[formatter stringFromNumber:totalStats.stuns]];
    [self.towetKillsLabel setText:[formatter stringFromNumber:totalStats.towetKills]];
    [self.neutralKillsLabel setText:[formatter stringFromNumber:totalStats.neutralKills]];
    [self.courierKillsLabel setText:[formatter stringFromNumber:totalStats.courierKills]];
    [self.purchaseTpscrollLabel setText:[formatter stringFromNumber:totalStats.purchaseTpscroll]];
    [self.purchaseWardObserverLabel setText:[formatter stringFromNumber:totalStats.purchaseWardObserver]];
    [self.purchaseWardSentryLabel setText:[formatter stringFromNumber:totalStats.purchaseWardSentry]];
    [self.purchaseGemLabel setText:[formatter stringFromNumber:totalStats.purchaseGem]];
    [self.purchaseRapieraLabel setText:[formatter stringFromNumber:totalStats.purchaseRapier]];
    [self.mapPingsLabel setText:[formatter stringFromNumber:totalStats.mapPings]];
    [self.countOfAnalyzedMatchesLabel setText:[NSString stringWithFormat:@"(%@)", [formatter stringFromNumber:totalStats.countOfAnalyzedMatchesLabel]]];
}

@end
