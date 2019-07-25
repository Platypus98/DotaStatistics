//
//  HeroViewController.m
//  DotaStatistics
//
//  Created by Ilya on 11/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//


#import "DTSHeroViewController.h"


@interface DTSHeroViewController ()

@property (nonatomic, strong) UIImageView *heroImageView;
@property (nonatomic, strong) UILabel *heroNameLabel;

@property (nonatomic, strong) UILabel *attackTypeLabel;
@property (nonatomic, strong) UILabel *rolesLabel;

@property (nonatomic, strong) UILabel *baseHealthLabel;
@property (nonatomic, strong) UILabel *baseHealthRegenLabel;
@property (nonatomic, strong) UILabel *baseManaLabel;
@property (nonatomic, strong) UILabel *baseManaRegenLabel;
@property (nonatomic, strong) UILabel *baseArmorLabel;
@property (nonatomic, strong) UILabel *baseMagicResistanceLabel;
@property (nonatomic, strong) UILabel *baseAttackMinDamageLabel;
@property (nonatomic, strong) UILabel *baseAttackMaxDamageLabel;

@property (nonatomic, strong) UILabel *baseStrenghtLabel;
@property (nonatomic, strong) UILabel *baseAgilityLabel;
@property (nonatomic, strong) UILabel *baseIntelligenceLabel;
@property (nonatomic, strong) UILabel *strenghtGainLabel;
@property (nonatomic, strong) UILabel *agilityGainLabel;
@property (nonatomic, strong) UILabel *intelligenceGainLabel;

@property (nonatomic, strong) UILabel *attackRangeLabel;
@property (nonatomic, strong) UILabel *attackRateLabel;
@property (nonatomic, strong) UILabel *moveSpeedLabel;
@property (nonatomic, strong) UILabel *turnRateLabel;
@property (nonatomic, strong) UILabel *capitanModeEnabledLabel;
@property (nonatomic, strong) UILabel *legsLabel;

@end


@implementation DTSHeroViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _heroImageView = [UIImageView new];
        _heroNameLabel = [UILabel new];
        _attackTypeLabel = [UILabel new];
        _rolesLabel = [UILabel new];
        _baseStrenghtLabel = [UILabel new];
        _strenghtGainLabel = [UILabel new];
        _baseAgilityLabel = [UILabel new];
        _agilityGainLabel = [UILabel new];
        _baseIntelligenceLabel = [UILabel new];
        _intelligenceGainLabel = [UILabel new];
        
        _baseAttackMinDamageLabel = [UILabel new];
        _baseAttackMaxDamageLabel = [UILabel new];
        _attackRateLabel = [UILabel new];
        _attackRangeLabel = [UILabel new];
        _baseHealthLabel = [UILabel new];
        _baseHealthRegenLabel = [UILabel new];
        _baseManaLabel = [UILabel new];
        _baseManaRegenLabel = [UILabel new];
        _baseArmorLabel = [UILabel new];
        _baseMagicResistanceLabel = [UILabel new];
        _moveSpeedLabel = [UILabel new];
        _turnRateLabel = [UILabel new];
        _legsLabel = [UILabel new];
        _capitanModeEnabledLabel = [UILabel new];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1.0f];
    [self setupHeroMainInformation];
    [self setupMainInformationConstraints];
    [self setupAgilityAndConstraints];
    [self setupStrenghtAndConstraints];
    [self setupIntelligenceAndConstraints];
    [self setupHeroStatsAndConstraints];
}

- (void)setupHeroMainInformation
{
    self.heroImageView.frame = CGRectMake(10, self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + 10, 190, 140);
    self.heroImageView.layer.cornerRadius = 10;
    self.heroImageView.layer.masksToBounds = YES;
    [self.view addSubview:self.heroImageView];
    
    [self.heroNameLabel setTextColor:UIColor.whiteColor];
    [self.heroNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    self.heroNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.heroNameLabel.adjustsFontSizeToFitWidth = YES;
    self.heroNameLabel.numberOfLines = 0;
    [self.view addSubview:self.heroNameLabel];

    self.attackTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.attackTypeLabel setTextColor:UIColor.whiteColor];
    [self.attackTypeLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [self.view addSubview:self.attackTypeLabel];
    
    self.rolesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rolesLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [self.rolesLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    self.rolesLabel.adjustsFontSizeToFitWidth = YES;
    self.rolesLabel.numberOfLines = 0;
    [self.view addSubview:self.rolesLabel];
}


- (void)setupMainInformationConstraints
{
    [self.heroNameLabel.topAnchor constraintEqualToAnchor:self.heroImageView.topAnchor constant:5].active = YES;
    [self.heroNameLabel.leadingAnchor constraintEqualToAnchor:self.heroImageView.trailingAnchor constant:10].active = YES;
    [self.heroNameLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.heroNameLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.attackTypeLabel.topAnchor constraintEqualToAnchor:self.heroNameLabel.bottomAnchor constant:10].active = YES;
    [self.attackTypeLabel.leadingAnchor constraintEqualToAnchor:self.heroImageView.trailingAnchor constant:10].active = YES;
    [self.attackTypeLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.attackTypeLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    [self.rolesLabel.topAnchor constraintEqualToAnchor:self.attackTypeLabel.bottomAnchor constant:2].active = YES;
    [self.rolesLabel.leadingAnchor constraintEqualToAnchor:self.heroImageView.trailingAnchor constant:10].active = YES;
    [self.rolesLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-2].active = YES;
    [self.rolesLabel.heightAnchor constraintEqualToConstant:45].active = YES;
}


- (void)setupAgilityAndConstraints
{
    UILabel *plusAgilityLabel = [UILabel new];
    [plusAgilityLabel setText:@"+"];
    [plusAgilityLabel setTextColor:UIColor.whiteColor];
    [self.view addSubview:plusAgilityLabel];
    plusAgilityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [plusAgilityLabel.topAnchor constraintEqualToAnchor:self.heroImageView.bottomAnchor constant:21].active = YES;
    [plusAgilityLabel.centerXAnchor constraintEqualToAnchor:self.heroImageView.rightAnchor].active = YES;
    [plusAgilityLabel.widthAnchor constraintEqualToConstant:10].active = YES;
    [plusAgilityLabel.heightAnchor constraintEqualToConstant:10].active = YES;
    
    self.baseAgilityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.baseAgilityLabel setTextColor:UIColor.whiteColor];
    [self.baseAgilityLabel setFont:[self fontForStrenghtAgilityAndIntelligenceStats]];
    [self.view addSubview:self.baseAgilityLabel];
    [self.baseAgilityLabel.topAnchor constraintEqualToAnchor:self.heroImageView.bottomAnchor constant:19].active = YES;
    [self.baseAgilityLabel.rightAnchor constraintEqualToAnchor:plusAgilityLabel.leftAnchor constant:-3].active = YES;
    [self.baseAgilityLabel.widthAnchor constraintEqualToConstant:17].active = YES;
    [self.baseAgilityLabel.heightAnchor constraintEqualToConstant:15].active = YES;
    
    UIView *greenCircle = [UIView new];
    greenCircle.backgroundColor = UIColor.greenColor;
    greenCircle.layer.cornerRadius = 7.5;
    greenCircle.layer.masksToBounds = YES;
    greenCircle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:greenCircle];
    [greenCircle.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [greenCircle.rightAnchor constraintEqualToAnchor:self.baseAgilityLabel.leftAnchor constant:-5].active = YES;
    [greenCircle.widthAnchor constraintEqualToConstant:15].active = YES;
    [greenCircle.heightAnchor constraintEqualToConstant:15].active = YES;
    
    self.agilityGainLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.agilityGainLabel setTextColor:UIColor.whiteColor];
    [self.agilityGainLabel setFont:[self fontForStrenghtAgilityAndIntelligenceStats]];
    [self.view addSubview:self.agilityGainLabel];
    [self.agilityGainLabel.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [self.agilityGainLabel.leftAnchor constraintEqualToAnchor:plusAgilityLabel.rightAnchor constant:3].active = YES;
    [self.agilityGainLabel.widthAnchor constraintEqualToConstant:25].active = YES;
    [self.agilityGainLabel.heightAnchor constraintEqualToConstant:15].active = YES;
    
}

- (void)setupStrenghtAndConstraints
{
    UIView *redCircle = [UIView new];
    redCircle.backgroundColor = UIColor.redColor;
    redCircle.layer.cornerRadius = 7.5;
    redCircle.layer.masksToBounds = YES;
    redCircle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redCircle];
    [redCircle.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [redCircle.leftAnchor constraintEqualToAnchor:self.heroImageView.leftAnchor constant:10].active = YES;
    [redCircle.widthAnchor constraintEqualToConstant:15].active = YES;
    [redCircle.heightAnchor constraintEqualToConstant:15].active = YES;
    
    self.baseStrenghtLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.baseStrenghtLabel setTextColor:UIColor.whiteColor];
    [self.baseStrenghtLabel setFont:[self fontForStrenghtAgilityAndIntelligenceStats]];
    [self.view addSubview:self.baseStrenghtLabel];
    [self.baseStrenghtLabel.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [self.baseStrenghtLabel.leftAnchor constraintEqualToAnchor:redCircle.rightAnchor constant:5].active = YES;
    [self.baseStrenghtLabel.widthAnchor constraintEqualToConstant:17].active = YES;
    [self.baseStrenghtLabel.heightAnchor constraintEqualToConstant:15].active = YES;
    
    UILabel *plusStrenghtLabel = [UILabel new];
    [plusStrenghtLabel setText:@"+"];
    [plusStrenghtLabel setTextColor:UIColor.whiteColor];
    plusStrenghtLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:plusStrenghtLabel];
    [plusStrenghtLabel.topAnchor constraintEqualToAnchor:self.heroImageView.bottomAnchor constant:21].active = YES;
    [plusStrenghtLabel.leftAnchor constraintEqualToAnchor:self.baseStrenghtLabel.rightAnchor constant:3].active = YES;
    [plusStrenghtLabel.widthAnchor constraintEqualToConstant:10].active = YES;
    [plusStrenghtLabel.heightAnchor constraintEqualToConstant:10].active = YES;
    
    self.strenghtGainLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.strenghtGainLabel setTextColor:UIColor.whiteColor];
    [self.strenghtGainLabel setFont:[self fontForStrenghtAgilityAndIntelligenceStats]];
    [self.view addSubview:self.strenghtGainLabel];
    [self.strenghtGainLabel.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [self.strenghtGainLabel.leftAnchor constraintEqualToAnchor:plusStrenghtLabel.rightAnchor constant:3].active = YES;
    [self.strenghtGainLabel.widthAnchor constraintEqualToConstant:25].active = YES;
    [self.strenghtGainLabel.heightAnchor constraintEqualToConstant:15].active = YES;
}

- (void)setupIntelligenceAndConstraints
{
    self.intelligenceGainLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.intelligenceGainLabel setTextColor:UIColor.whiteColor];
    [self.intelligenceGainLabel setFont:[self fontForStrenghtAgilityAndIntelligenceStats]];
    [self.view addSubview:self.intelligenceGainLabel];
    [self.intelligenceGainLabel.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [self.intelligenceGainLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    [self.intelligenceGainLabel.widthAnchor constraintEqualToConstant:25].active = YES;
    [self.intelligenceGainLabel.heightAnchor constraintEqualToConstant:15].active = YES;
    
    UILabel *plusIntelligenceLabel = [UILabel new];
    [plusIntelligenceLabel setText:@"+"];
    [plusIntelligenceLabel setTextColor:UIColor.whiteColor];
    plusIntelligenceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:plusIntelligenceLabel];
    [plusIntelligenceLabel.topAnchor constraintEqualToAnchor:self.heroImageView.bottomAnchor constant:21].active = YES;
    [plusIntelligenceLabel.rightAnchor constraintEqualToAnchor:self.intelligenceGainLabel.leftAnchor constant:-3].active = YES;
    [plusIntelligenceLabel.widthAnchor constraintEqualToConstant:10].active = YES;
    [plusIntelligenceLabel.heightAnchor constraintEqualToConstant:10].active = YES;

    self.baseIntelligenceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.baseIntelligenceLabel setTextColor:UIColor.whiteColor];
    [self.baseIntelligenceLabel setFont:[self fontForStrenghtAgilityAndIntelligenceStats]];
    [self.view addSubview:self.baseIntelligenceLabel];
    [self.baseIntelligenceLabel.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [self.baseIntelligenceLabel.rightAnchor constraintEqualToAnchor:plusIntelligenceLabel.leftAnchor constant:-3].active = YES;
    [self.baseIntelligenceLabel.widthAnchor constraintEqualToConstant:17].active = YES;
    [self.baseIntelligenceLabel.heightAnchor constraintEqualToConstant:15].active = YES;

    UIView *blueCircle = [UIView new];
    blueCircle.backgroundColor = [UIColor colorWithRed:4.0f/255.0f green:166.0f/255.0f blue:255.0f/255.0f alpha:1];
    blueCircle.layer.cornerRadius = 7.5;
    blueCircle.layer.masksToBounds = YES;
    blueCircle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueCircle];
    [blueCircle.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.topAnchor].active = YES;
    [blueCircle.rightAnchor constraintEqualToAnchor:self.baseIntelligenceLabel.leftAnchor constant:-5].active = YES;
    [blueCircle.widthAnchor constraintEqualToConstant:15].active = YES;
    [blueCircle.heightAnchor constraintEqualToConstant:15].active = YES;
}

- (void)setupHeroStatsAndConstraints
{
    UILabel *detailsLabel = [UILabel new];
    [detailsLabel setText:@"Подробности"];
    detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    detailsLabel.textAlignment = NSTextAlignmentCenter;
    [detailsLabel setTextColor:UIColor.whiteColor];
    [detailsLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [self.view addSubview:detailsLabel];
    [detailsLabel.topAnchor constraintEqualToAnchor:self.baseAgilityLabel.bottomAnchor constant:22].active = YES;
    [detailsLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [detailsLabel.widthAnchor constraintEqualToConstant:150].active = YES;
    [detailsLabel.heightAnchor constraintEqualToConstant:40].active = YES;

    UIView *baseAttackBackgroundView = [self createLightViewForStats];
    [self.view addSubview:baseAttackBackgroundView];
    [baseAttackBackgroundView.topAnchor constraintEqualToAnchor:detailsLabel.bottomAnchor constant:10].active = YES;
    [baseAttackBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [baseAttackBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [baseAttackBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseAttackBackgroundViewRightBorder = [self createRightBorderWithViewFrame:baseAttackBackgroundView.frame width:1];
    [baseAttackBackgroundView addSubview:baseAttackBackgroundViewRightBorder];
    
    UILabel *baseAttackNameLabel = [UILabel new];
    baseAttackNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseAttackNameLabel setText:@"БАЗОВЫЙ УРОН:"];
    [baseAttackNameLabel setFont:[self fontForStatsNames]];
    [baseAttackNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseAttackBackgroundView addSubview:baseAttackNameLabel];
    [baseAttackNameLabel.centerYAnchor constraintEqualToAnchor:baseAttackBackgroundView.centerYAnchor].active = YES;
    [baseAttackNameLabel.leftAnchor constraintEqualToAnchor:baseAttackBackgroundView.leftAnchor constant:10].active = YES;
    [baseAttackNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseAttackNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseAttackMinDamageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseAttackMinDamageLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseAttackMinDamageLabel setTextColor:UIColor.whiteColor];
    [self.baseAttackMinDamageLabel setFont:[self fontForHeroStatsLabels]];
    [baseAttackBackgroundView addSubview:self.baseAttackMinDamageLabel];
    [self.baseAttackMinDamageLabel.centerYAnchor constraintEqualToAnchor:baseAttackNameLabel.centerYAnchor].active = YES;
    [self.baseAttackMinDamageLabel.leftAnchor constraintEqualToAnchor:baseAttackNameLabel.rightAnchor constant:4].active = YES;
    [self.baseAttackMinDamageLabel.widthAnchor constraintEqualToConstant:20].active = YES;
    [self.baseAttackMinDamageLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UILabel *dashLabel = [UILabel new];
    dashLabel.translatesAutoresizingMaskIntoConstraints = NO;
    dashLabel.adjustsFontSizeToFitWidth = NO;
    [dashLabel setText:@"-"];
    [dashLabel setTextColor:UIColor.whiteColor];
    [dashLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [baseAttackBackgroundView addSubview:dashLabel];
    [dashLabel.leftAnchor constraintEqualToAnchor:self.baseAttackMinDamageLabel.rightAnchor constant:1].active = YES;
    [dashLabel.centerYAnchor constraintEqualToAnchor:self.baseAttackMinDamageLabel.centerYAnchor].active = YES;
    [dashLabel.widthAnchor constraintEqualToConstant:8].active = YES;
    [dashLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    self.baseAttackMaxDamageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseAttackMaxDamageLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseAttackMaxDamageLabel setTextColor:UIColor.whiteColor];
    [self.baseAttackMaxDamageLabel setFont:[self fontForHeroStatsLabels]];
    [baseAttackBackgroundView addSubview:self.baseAttackMaxDamageLabel];
    [self.baseAttackMaxDamageLabel.centerYAnchor constraintEqualToAnchor:baseAttackNameLabel.centerYAnchor].active = YES;
    [self.baseAttackMaxDamageLabel.leftAnchor constraintEqualToAnchor:dashLabel.rightAnchor constant:1].active = YES;
    [self.baseAttackMaxDamageLabel.widthAnchor constraintEqualToConstant:20].active = YES;
    [self.baseAttackMaxDamageLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    
    UIView *baseAttackRateBackgroundView = [self createLightViewForStats];
    [self.view addSubview:baseAttackRateBackgroundView];
    [baseAttackRateBackgroundView.topAnchor constraintEqualToAnchor:baseAttackBackgroundView.topAnchor].active = YES;
    [baseAttackRateBackgroundView.leftAnchor constraintEqualToAnchor:baseAttackBackgroundView.rightAnchor].active = YES;
    [baseAttackRateBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [baseAttackRateBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseAttackRateBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:baseAttackRateBackgroundView.frame width:1];
    [baseAttackRateBackgroundView addSubview:baseAttackRateBackgroundViewLeftBorder];
    
    UILabel *baseAttackRateNameLabel = [UILabel new];
    baseAttackRateNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseAttackRateNameLabel setText:@"СКОРОСТЬ АТАКИ:"];
    [baseAttackRateNameLabel setFont:[self fontForStatsNames]];
    [baseAttackRateNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseAttackRateBackgroundView addSubview:baseAttackRateNameLabel];
    [baseAttackRateNameLabel.centerYAnchor constraintEqualToAnchor:baseAttackRateBackgroundView.centerYAnchor].active = YES;
    [baseAttackRateNameLabel.leftAnchor constraintEqualToAnchor:baseAttackRateBackgroundView.leftAnchor constant:5].active = YES;
    [baseAttackRateNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseAttackRateNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.attackRateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.attackRateLabel.adjustsFontSizeToFitWidth = NO;
    [self.attackRateLabel setTextColor:UIColor.whiteColor];
    [self.attackRateLabel setFont:[self fontForHeroStatsLabels]];
    [baseAttackRateBackgroundView addSubview:self.attackRateLabel];
    [self.attackRateLabel.centerYAnchor constraintEqualToAnchor:baseAttackRateNameLabel.centerYAnchor].active = YES;
    [self.attackRateLabel.leftAnchor constraintEqualToAnchor:baseAttackRateNameLabel.rightAnchor constant:4].active = YES;
    [self.attackRateLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.attackRateLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    
    UIView *baseAttackRangeBackgroundView = [self createDarkViewForStats];
    [self.view addSubview:baseAttackRangeBackgroundView];
    [baseAttackRangeBackgroundView.topAnchor constraintEqualToAnchor:baseAttackRateBackgroundView.bottomAnchor].active = YES;
    [baseAttackRangeBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [baseAttackRangeBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [baseAttackRangeBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseAttackRangeBackgroundViewRigthBorder = [self createRightBorderWithViewFrame:baseAttackRangeBackgroundView.frame width:1];
    [baseAttackRangeBackgroundView addSubview:baseAttackRangeBackgroundViewRigthBorder];
    
    UILabel *baseAttackRangeNameLabel = [UILabel new];
    baseAttackRangeNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseAttackRangeNameLabel setText:@"ДАЛЬНОСТЬ АТАКИ:"];
    [baseAttackRangeNameLabel setFont:[self fontForStatsNames]];
    [baseAttackRangeNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseAttackRangeBackgroundView addSubview:baseAttackRangeNameLabel];
    [baseAttackRangeNameLabel.centerYAnchor constraintEqualToAnchor:baseAttackRangeBackgroundView.centerYAnchor].active = YES;
    [baseAttackRangeNameLabel.leftAnchor constraintEqualToAnchor:baseAttackRangeBackgroundView.leftAnchor constant:10].active = YES;
    [baseAttackRangeNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseAttackRangeNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.attackRangeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.attackRangeLabel.adjustsFontSizeToFitWidth = NO;
    [self.attackRangeLabel setTextColor:UIColor.whiteColor];
    [self.attackRangeLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [baseAttackRangeBackgroundView addSubview:self.attackRangeLabel];
    [self.attackRangeLabel.centerYAnchor constraintEqualToAnchor:baseAttackRangeNameLabel.centerYAnchor].active = YES;
    [self.attackRangeLabel.leftAnchor constraintEqualToAnchor:baseAttackRangeNameLabel.rightAnchor constant:4].active = YES;
    [self.attackRangeLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.attackRangeLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UIView *emptyFirstBackgroundView = [self createDarkViewForStats];
    [self.view addSubview:emptyFirstBackgroundView];
    [emptyFirstBackgroundView.topAnchor constraintEqualToAnchor:baseAttackBackgroundView.bottomAnchor].active = YES;
    [emptyFirstBackgroundView.leftAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [emptyFirstBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [emptyFirstBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *emptyFirstBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:emptyFirstBackgroundView.frame width:1];
    [emptyFirstBackgroundView addSubview:emptyFirstBackgroundViewLeftBorder];
    
    
    UIView *baseHealthBackgroundView = [self createLightViewForStats];
    [self.view addSubview:baseHealthBackgroundView];
    [baseHealthBackgroundView.topAnchor constraintEqualToAnchor:baseAttackRangeBackgroundView.bottomAnchor].active = YES;
    [baseHealthBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [baseHealthBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [baseHealthBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseHealthBackgroundViewRigthBorder = [self createRightBorderWithViewFrame:baseHealthBackgroundView.frame width:1];
    [baseHealthBackgroundView addSubview:baseHealthBackgroundViewRigthBorder];
    UIView *baseHealthBackgroundViewTopBorder = [self createTopBorderWithViewFrame:baseHealthBackgroundView.frame width:1];
    [baseHealthBackgroundView addSubview:baseHealthBackgroundViewTopBorder];
    
    UILabel *baseHealthNameLabel = [UILabel new];
    baseHealthNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseHealthNameLabel setText:@"ЗДОРОВЬЕ:"];
    [baseHealthNameLabel setFont:[self fontForStatsNames]];
    [baseHealthNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseHealthBackgroundView addSubview:baseHealthNameLabel];
    [baseHealthNameLabel.centerYAnchor constraintEqualToAnchor:baseHealthBackgroundView.centerYAnchor].active = YES;
    [baseHealthNameLabel.leftAnchor constraintEqualToAnchor:baseHealthBackgroundView.leftAnchor constant:10].active = YES;
    [baseHealthNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseHealthNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseHealthLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseHealthLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseHealthLabel setTextColor:UIColor.whiteColor];
    [self.baseHealthLabel setFont:[self fontForHeroStatsLabels]];
    [baseHealthBackgroundView addSubview:self.baseHealthLabel];
    [self.baseHealthLabel.centerYAnchor constraintEqualToAnchor:baseHealthNameLabel.centerYAnchor].active = YES;
    [self.baseHealthLabel.leftAnchor constraintEqualToAnchor:baseHealthNameLabel.rightAnchor constant:4].active = YES;
    [self.baseHealthLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.baseHealthLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UIView *baseHealthRegenBackgroundView = [self createLightViewForStats];
    [self.view addSubview:baseHealthRegenBackgroundView];
    [baseHealthRegenBackgroundView.topAnchor constraintEqualToAnchor:baseHealthBackgroundView.topAnchor].active = YES;
    [baseHealthRegenBackgroundView.leftAnchor constraintEqualToAnchor:baseHealthBackgroundView.rightAnchor].active = YES;
    [baseHealthRegenBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [baseHealthRegenBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseHealthRegenBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:baseHealthRegenBackgroundView.frame width:1];
    [baseHealthRegenBackgroundView addSubview:baseHealthRegenBackgroundViewLeftBorder];
    UIView *baseHealthRegenBackgroundViewTopBorder = [self createTopBorderWithViewFrame:baseHealthRegenBackgroundView.frame width:1];
    [baseHealthRegenBackgroundView addSubview:baseHealthRegenBackgroundViewTopBorder];
    
    UILabel *baseHealthRegenNameLabel = [UILabel new];
    baseHealthRegenNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseHealthRegenNameLabel setText:@"ВОССТ. ЗДОРОВЬЯ:"];
    [baseHealthRegenNameLabel setFont:[self fontForStatsNames]];
    [baseHealthRegenNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseHealthRegenBackgroundView addSubview:baseHealthRegenNameLabel];
    [baseHealthRegenNameLabel.centerYAnchor constraintEqualToAnchor:baseHealthRegenBackgroundView.centerYAnchor].active = YES;
    [baseHealthRegenNameLabel.leftAnchor constraintEqualToAnchor:baseHealthRegenBackgroundView.leftAnchor constant:5].active = YES;
    [baseHealthRegenNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseHealthRegenNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseHealthRegenLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseHealthRegenLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseHealthRegenLabel setTextColor:UIColor.whiteColor];
    [self.baseHealthRegenLabel setFont:[self fontForHeroStatsLabels]];
    [baseHealthRegenBackgroundView addSubview:self.baseHealthRegenLabel];
    [self.baseHealthRegenLabel.centerYAnchor constraintEqualToAnchor:baseHealthRegenNameLabel.centerYAnchor].active = YES;
    [self.baseHealthRegenLabel.leftAnchor constraintEqualToAnchor:baseHealthRegenNameLabel.rightAnchor constant:4].active = YES;
    [self.baseHealthRegenLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.baseHealthRegenLabel.heightAnchor constraintEqualToConstant:20].active = YES;

    
    UIView *baseManaBackgroundView = [self createDarkViewForStats];
    [self.view addSubview:baseManaBackgroundView];
    [baseManaBackgroundView.topAnchor constraintEqualToAnchor:baseHealthBackgroundView.bottomAnchor].active = YES;
    [baseManaBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [baseManaBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [baseManaBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseManaBackgroundViewRigthBorder = [self createRightBorderWithViewFrame:baseManaBackgroundView.frame width:1];
    [baseManaBackgroundView addSubview:baseManaBackgroundViewRigthBorder];
    
    UILabel *baseManaNameLabel = [UILabel new];
    baseManaNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseManaNameLabel setText:@"МАНА:"];
    [baseManaNameLabel setFont:[self fontForStatsNames]];
    [baseManaNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseManaBackgroundView addSubview:baseManaNameLabel];
    [baseManaNameLabel.centerYAnchor constraintEqualToAnchor:baseManaBackgroundView.centerYAnchor].active = YES;
    [baseManaNameLabel.leftAnchor constraintEqualToAnchor:baseManaBackgroundView.leftAnchor constant:10].active = YES;
    [baseManaNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseManaNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseManaLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseManaLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseManaLabel setTextColor:UIColor.whiteColor];
    [self.baseManaLabel setFont:[self fontForHeroStatsLabels]];
    [baseManaBackgroundView addSubview:self.baseManaLabel];
    [self.baseManaLabel.centerYAnchor constraintEqualToAnchor:baseManaBackgroundView.centerYAnchor].active = YES;
    [self.baseManaLabel.leftAnchor constraintEqualToAnchor:baseManaNameLabel.rightAnchor constant:4].active = YES;
    [self.baseManaLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.baseManaLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UIView *baseManaRegenBackgroundView = [self createDarkViewForStats];
    [self.view addSubview:baseManaRegenBackgroundView];
    [baseManaRegenBackgroundView.topAnchor constraintEqualToAnchor:baseManaBackgroundView.topAnchor].active = YES;
    [baseManaRegenBackgroundView.leftAnchor constraintEqualToAnchor:baseManaBackgroundView.rightAnchor].active = YES;
    [baseManaRegenBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [baseManaRegenBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseManaRegenBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:baseManaRegenBackgroundView.frame width:1];
    [baseManaRegenBackgroundView addSubview:baseManaRegenBackgroundViewLeftBorder];
    
    UILabel *baseManaRegenNameLabel = [UILabel new];
    baseManaRegenNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseManaRegenNameLabel setText:@"ВОССТ. МАНЫ:"];
    [baseManaRegenNameLabel setFont:[self fontForStatsNames]];
    [baseManaRegenNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseManaRegenBackgroundView addSubview:baseManaRegenNameLabel];
    [baseManaRegenNameLabel.centerYAnchor constraintEqualToAnchor:baseManaRegenBackgroundView.centerYAnchor].active = YES;
    [baseManaRegenNameLabel.leftAnchor constraintEqualToAnchor:baseManaRegenBackgroundView.leftAnchor constant:5].active = YES;
    [baseManaRegenNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseManaRegenNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseManaRegenLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseManaRegenLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseManaRegenLabel setTextColor:UIColor.whiteColor];
    [self.baseManaRegenLabel setFont:[self fontForHeroStatsLabels]];
    [baseManaRegenBackgroundView addSubview:self.baseManaRegenLabel];
    [self.baseManaRegenLabel.centerYAnchor constraintEqualToAnchor:baseManaRegenNameLabel.centerYAnchor].active = YES;
    [self.baseManaRegenLabel.leftAnchor constraintEqualToAnchor:baseManaRegenNameLabel.rightAnchor constant:4].active = YES;
    [self.baseManaRegenLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.baseManaRegenLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    

    UIView *baseArmorBackgroundView = [self createLightViewForStats];
    [self.view addSubview:baseArmorBackgroundView];
    [baseArmorBackgroundView.topAnchor constraintEqualToAnchor:baseManaBackgroundView.bottomAnchor].active = YES;
    [baseArmorBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [baseArmorBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [baseArmorBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseArmorBackgroundViewRightBorder = [self createRightBorderWithViewFrame:baseArmorBackgroundView.frame width:1];
    [baseArmorBackgroundView addSubview:baseArmorBackgroundViewRightBorder];
    UIView *baseArmorBackgroundViewTopBorder = [self createTopBorderWithViewFrame:baseArmorBackgroundView.frame width:1];
    [baseArmorBackgroundView addSubview:baseArmorBackgroundViewTopBorder];
    
    UILabel *baseArmorNameLabel = [UILabel new];
    baseArmorNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseArmorNameLabel setText:@"БАЗОВАЯ БРОНЯ:"];
    [baseArmorNameLabel setFont:[self fontForStatsNames]];
    [baseArmorNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseArmorBackgroundView addSubview:baseArmorNameLabel];
    [baseArmorNameLabel.centerYAnchor constraintEqualToAnchor:baseArmorBackgroundView.centerYAnchor].active = YES;
    [baseArmorNameLabel.leftAnchor constraintEqualToAnchor:baseArmorBackgroundView.leftAnchor constant:10].active = YES;
    [baseArmorNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseArmorNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseArmorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseArmorLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseArmorLabel setTextColor:UIColor.whiteColor];
    [self.baseArmorLabel setFont:[self fontForHeroStatsLabels]];
    [baseArmorBackgroundView addSubview:self.baseArmorLabel];
    [self.baseArmorLabel.centerYAnchor constraintEqualToAnchor:baseArmorBackgroundView.centerYAnchor].active = YES;
    [self.baseArmorLabel.leftAnchor constraintEqualToAnchor:baseArmorNameLabel.rightAnchor constant:4].active = YES;
    [self.baseArmorLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.baseArmorLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    
    UIView *baseMagicResistanceBackgroundView = [self createLightViewForStats];
    [self.view addSubview:baseMagicResistanceBackgroundView];
    [baseMagicResistanceBackgroundView.topAnchor constraintEqualToAnchor:baseArmorBackgroundView.topAnchor].active = YES;
    [baseMagicResistanceBackgroundView.leftAnchor constraintEqualToAnchor:baseArmorBackgroundView.rightAnchor].active = YES;
    [baseMagicResistanceBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [baseMagicResistanceBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseMagicResistanceBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:baseMagicResistanceBackgroundView.frame width:1];
    [baseMagicResistanceBackgroundView addSubview:baseMagicResistanceBackgroundViewLeftBorder];
    UIView *baseMagicResistanceBackgroundViewTopBorder = [self createTopBorderWithViewFrame:baseMagicResistanceBackgroundView.frame width:1];
    [baseMagicResistanceBackgroundView addSubview:baseMagicResistanceBackgroundViewTopBorder];
    
    UILabel *baseMagicResistanceNameLabel = [UILabel new];
    baseMagicResistanceNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseMagicResistanceNameLabel setText:@"СОПРОТ. МАГИИ:"];
    [baseMagicResistanceNameLabel setFont:[self fontForStatsNames]];
    [baseMagicResistanceNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseMagicResistanceBackgroundView addSubview:baseMagicResistanceNameLabel];
    [baseMagicResistanceNameLabel.centerYAnchor constraintEqualToAnchor:baseMagicResistanceBackgroundView.centerYAnchor].active = YES;
    [baseMagicResistanceNameLabel.leftAnchor constraintEqualToAnchor:baseMagicResistanceBackgroundView.leftAnchor constant:5].active = YES;
    [baseMagicResistanceNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseMagicResistanceNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.baseMagicResistanceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.baseMagicResistanceLabel.adjustsFontSizeToFitWidth = NO;
    [self.baseMagicResistanceLabel setTextColor:UIColor.whiteColor];
    [self.baseMagicResistanceLabel setFont:[self fontForHeroStatsLabels]];
    [baseMagicResistanceBackgroundView addSubview:self.baseMagicResistanceLabel];
    [self.baseMagicResistanceLabel.centerYAnchor constraintEqualToAnchor:baseMagicResistanceNameLabel.centerYAnchor].active = YES;
    [self.baseMagicResistanceLabel.leftAnchor constraintEqualToAnchor:baseMagicResistanceNameLabel.rightAnchor constant:4].active = YES;
    [self.baseMagicResistanceLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.baseMagicResistanceLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    

    UIView *baseMoveSpeedBackgroundView = [self createDarkViewForStats];
    [self.view addSubview:baseMoveSpeedBackgroundView];
    [baseMoveSpeedBackgroundView.topAnchor constraintEqualToAnchor:baseArmorBackgroundView.bottomAnchor].active = YES;
    [baseMoveSpeedBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [baseMoveSpeedBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [baseMoveSpeedBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseMoveSpeedBackgroundViewRight = [self createRightBorderWithViewFrame:baseMoveSpeedBackgroundView.frame width:1];
    [baseMoveSpeedBackgroundView addSubview:baseMoveSpeedBackgroundViewRight];

    UILabel *baseMoveSpeedNameLabel = [UILabel new];
    baseMoveSpeedNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseMoveSpeedNameLabel setText:@"СКОРОСТЬ ПРЕДВ.:"];
    [baseMoveSpeedNameLabel setFont:[self fontForStatsNames]];
    [baseMoveSpeedNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseMoveSpeedBackgroundView addSubview:baseMoveSpeedNameLabel];
    [baseMoveSpeedNameLabel.centerYAnchor constraintEqualToAnchor:baseMoveSpeedBackgroundView.centerYAnchor].active = YES;
    [baseMoveSpeedNameLabel.leftAnchor constraintEqualToAnchor:baseMoveSpeedBackgroundView.leftAnchor constant:10].active = YES;
    [baseMoveSpeedNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseMoveSpeedNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.moveSpeedLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.moveSpeedLabel.adjustsFontSizeToFitWidth = NO;
    [self.moveSpeedLabel setTextColor:UIColor.whiteColor];
    [self.moveSpeedLabel setFont:[self fontForHeroStatsLabels]];
    [baseMoveSpeedBackgroundView addSubview:self.moveSpeedLabel];
    [self.moveSpeedLabel.centerYAnchor constraintEqualToAnchor:baseMoveSpeedBackgroundView.centerYAnchor].active = YES;
    [self.moveSpeedLabel.leftAnchor constraintEqualToAnchor:baseMoveSpeedNameLabel.rightAnchor constant:4].active = YES;
    [self.moveSpeedLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.moveSpeedLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    
    UIView *baseTurnRateBackgroundView = [self createDarkViewForStats];
    [self.view addSubview:baseTurnRateBackgroundView];
    [baseTurnRateBackgroundView.topAnchor constraintEqualToAnchor:baseMoveSpeedBackgroundView.topAnchor].active = YES;
    [baseTurnRateBackgroundView.leftAnchor constraintEqualToAnchor:baseMoveSpeedBackgroundView.rightAnchor].active = YES;
    [baseTurnRateBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [baseTurnRateBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *baseTurnRateBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:baseTurnRateBackgroundView.frame width:1];
    [baseTurnRateBackgroundView addSubview:baseTurnRateBackgroundViewLeftBorder];
    
    UILabel *baseTurnRateNameLabel = [UILabel new];
    baseTurnRateNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [baseTurnRateNameLabel setText:@"СКОРОСТЬ ПОВОРОТА:"];
    [baseTurnRateNameLabel setFont:[self fontForStatsNames]];
    [baseTurnRateNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [baseTurnRateBackgroundView addSubview:baseTurnRateNameLabel];
    [baseTurnRateNameLabel.centerYAnchor constraintEqualToAnchor:baseTurnRateBackgroundView.centerYAnchor].active = YES;
    [baseTurnRateNameLabel.leftAnchor constraintEqualToAnchor:baseTurnRateBackgroundView.leftAnchor constant:5].active = YES;
    [baseTurnRateNameLabel.widthAnchor constraintEqualToConstant:150];
    [baseTurnRateNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.turnRateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.turnRateLabel.adjustsFontSizeToFitWidth = NO;
    [self.turnRateLabel setTextColor:UIColor.whiteColor];
    [self.turnRateLabel setFont:[self fontForHeroStatsLabels]];
    [baseTurnRateBackgroundView addSubview:self.turnRateLabel];
    [self.turnRateLabel.centerYAnchor constraintEqualToAnchor:baseTurnRateBackgroundView.centerYAnchor].active = YES;
    [self.turnRateLabel.leftAnchor constraintEqualToAnchor:baseTurnRateNameLabel.rightAnchor constant:4].active = YES;
    [self.turnRateLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.turnRateLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    
    UIView *legsBackgroundView = [self createLightViewForStats];
    [self.view addSubview:legsBackgroundView];
    [legsBackgroundView.topAnchor constraintEqualToAnchor:baseMoveSpeedBackgroundView.bottomAnchor].active = YES;
    [legsBackgroundView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [legsBackgroundView.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [legsBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *legsBackgroundViewRightBorder = [self createRightBorderWithViewFrame:legsBackgroundView.frame width:1];
    [legsBackgroundView addSubview:legsBackgroundViewRightBorder];
    UIView *legsBackgroundViewTopBorder = [self createTopBorderWithViewFrame:legsBackgroundView.frame width:1];
    [legsBackgroundView addSubview:legsBackgroundViewTopBorder];
    
    UILabel *legsNameLabel = [UILabel new];
    legsNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [legsNameLabel setText:@"КОЛИЧЕСТВО НОГ:"];
    [legsNameLabel setFont:[self fontForStatsNames]];
    [legsNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [legsBackgroundView addSubview:legsNameLabel];
    [legsNameLabel.centerYAnchor constraintEqualToAnchor:legsBackgroundView.centerYAnchor].active = YES;
    [legsNameLabel.leftAnchor constraintEqualToAnchor:legsBackgroundView.leftAnchor constant:10].active = YES;
    [legsNameLabel.widthAnchor constraintEqualToConstant:150];
    [legsNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.legsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.legsLabel.adjustsFontSizeToFitWidth = NO;
    [self.legsLabel setTextColor:UIColor.whiteColor];
    [self.legsLabel setFont:[self fontForHeroStatsLabels]];
    [legsBackgroundView addSubview:self.legsLabel];
    [self.legsLabel.centerYAnchor constraintEqualToAnchor:legsNameLabel.centerYAnchor].active = YES;
    [self.legsLabel.leftAnchor constraintEqualToAnchor:legsNameLabel.rightAnchor constant:4].active = YES;
    [self.legsLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.legsLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UIView *capitanModeEnabledBackgroundView = [self createLightViewForStats];
    [self.view addSubview:capitanModeEnabledBackgroundView];
    [capitanModeEnabledBackgroundView.topAnchor constraintEqualToAnchor:legsBackgroundView.topAnchor].active = YES;
    [capitanModeEnabledBackgroundView.leftAnchor constraintEqualToAnchor:legsBackgroundView.rightAnchor].active = YES;
    [capitanModeEnabledBackgroundView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [capitanModeEnabledBackgroundView.heightAnchor constraintEqualToConstant:40].active = YES;
    UIView *capitanModeEnabledBackgroundViewLeftBorder = [self createLeftBorderWithViewFrame:capitanModeEnabledBackgroundView.frame width:1];
    [capitanModeEnabledBackgroundView addSubview:capitanModeEnabledBackgroundViewLeftBorder];
    UIView *capitanModeEnabledBackgroundViewTopBorder = [self createTopBorderWithViewFrame:capitanModeEnabledBackgroundView.frame width:1];
    [capitanModeEnabledBackgroundView addSubview:capitanModeEnabledBackgroundViewTopBorder];
    
    UILabel *capitanModeEnabledNameLabel = [UILabel new];
    capitanModeEnabledNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [capitanModeEnabledNameLabel setText:@"ДОСТУПНО В CM:"];
    [capitanModeEnabledNameLabel setFont:[self fontForStatsNames]];
    [capitanModeEnabledNameLabel setTextColor:[self colorOfFontForHeroStatsLabel]];
    [capitanModeEnabledBackgroundView addSubview:capitanModeEnabledNameLabel];
    [capitanModeEnabledNameLabel.centerYAnchor constraintEqualToAnchor:capitanModeEnabledBackgroundView.centerYAnchor].active = YES;
    [capitanModeEnabledNameLabel.leftAnchor constraintEqualToAnchor:capitanModeEnabledBackgroundView.leftAnchor constant:5].active = YES;
    [capitanModeEnabledNameLabel.widthAnchor constraintEqualToConstant:150];
    [capitanModeEnabledNameLabel.heightAnchor constraintEqualToConstant:20];
    
    self.capitanModeEnabledLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.capitanModeEnabledLabel.adjustsFontSizeToFitWidth = NO;
    [self.capitanModeEnabledLabel setTextColor:UIColor.whiteColor];
    [self.capitanModeEnabledLabel setFont:[self fontForHeroStatsLabels]];
    [capitanModeEnabledBackgroundView addSubview:self.capitanModeEnabledLabel];
    [self.capitanModeEnabledLabel.centerYAnchor constraintEqualToAnchor:capitanModeEnabledNameLabel.centerYAnchor].active = YES;
    [self.capitanModeEnabledLabel.leftAnchor constraintEqualToAnchor:capitanModeEnabledNameLabel.rightAnchor constant:4].active = YES;
    [self.capitanModeEnabledLabel.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.capitanModeEnabledLabel.heightAnchor constraintEqualToConstant:20].active = YES;
}

# pragma mark - Custom Fonts
- (UIFont *)fontForStatsNames
{
    return [UIFont fontWithName:@"Helvetica" size:13];
}

- (UIFont *)fontForStrenghtAgilityAndIntelligenceStats
{
    return [UIFont fontWithName:@"Helvetica" size:15];
}

- (UIFont *)fontForHeroStatsLabels
{
    return [UIFont fontWithName:@"Helvetica" size:15];
}

#pragma mark - Custom Colors
- (UIColor *)colorOfFontForHeroStatsLabel
{
    return [UIColor colorWithRed:191.0f/255.0f green:185.0f/255.0f blue:197.0f/255.0f alpha:1];
}

#pragma mark - Views For Heroes Stats
- (UIView *)createLightViewForStats
{
    UIView *lightView = [UIView new];
    lightView.translatesAutoresizingMaskIntoConstraints = NO;
    lightView.backgroundColor = [UIColor colorWithRed:43.0f/255.0f green:41.0f/255.0f blue:63.0f/255.0f alpha:1];
    return lightView;
}

- (UIView *)createDarkViewForStats
{
    UIView *darkView = [UIView new];
    darkView.translatesAutoresizingMaskIntoConstraints = NO;
    darkView.backgroundColor = [UIColor colorWithRed:38.0f/255.0f green:36.0f/255.0f blue:57.0f/255.0f alpha:1];
    return darkView;
}


# pragma mark - Borders for Views
- (UIView *)createLeftBorderWithViewFrame:(CGRect)viewFrame width:(NSInteger)borderWidth
{
    UIView *leftBorder = [UIView new];
    leftBorder.backgroundColor = UIColor.grayColor;
    leftBorder.frame = CGRectMake(0, 0, borderWidth, viewFrame.size.height);
    [leftBorder setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin];
    
    return leftBorder;
}

- (UIView *)createRightBorderWithViewFrame:(CGRect)viewFrame width:(NSInteger)borderWidth
{
    UIView *rightBorder = [UIView new];
    rightBorder.backgroundColor = UIColor.grayColor;
    [rightBorder setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin];
    rightBorder.frame = CGRectMake(viewFrame.size.width - borderWidth, 0, borderWidth, viewFrame.size.height);
    
    return rightBorder;
}

- (UIView *)createTopBorderWithViewFrame:(CGRect)viewFrame width:(NSInteger)borderWidth
{
    UIView *topBorder = [UIView new];
    topBorder.backgroundColor = UIColor.grayColor;
    [topBorder setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    topBorder.frame = CGRectMake(0, 0, viewFrame.size.width, borderWidth);
    
    return topBorder;
}

- (UIView *)createBottomBorderWithViewFrame:(CGRect)viewFrame width:(NSInteger)borderWidth
{
    UIView *bottomBorder = [UIView new];
    bottomBorder.backgroundColor = UIColor.grayColor;
    [bottomBorder setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    bottomBorder.frame = CGRectMake(0, viewFrame.size.height - borderWidth, viewFrame.size.width, borderWidth);
    
    return bottomBorder;
}

@end
