//
//  DTSPlayerStatsTableViewCell.m
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSPlayerStatsTableViewCell.h"


@interface DTSPlayerStatsTableViewCell ()

@property (nonatomic, strong) UIImageView *heroImageView;
@property (nonatomic, strong) UILabel *playerNameLabel;
@property (nonatomic, strong) UILabel *kdaLabel;
@property (nonatomic, strong) UILabel *gPMLabel;
@property (nonatomic, strong) UILabel *xPMLabel;

@property (nonatomic, strong) UILabel *lastHistNameLabel;
@property (nonatomic, strong) UILabel *lastHitsLabel;

@property (nonatomic, strong) UILabel *deniesNameLabel;
@property (nonatomic, strong) UILabel *deniesLabel;

@property (nonatomic, strong) UILabel *totalGoldNameLabel;
@property (nonatomic, strong) UILabel *totalGoldLabel;

@property (nonatomic, strong) UILabel *heroDamageNameLabel;
@property (nonatomic, strong) UILabel *heroDamageLabel;

@property (nonatomic, strong) UILabel *heroHealingNameLabel;
@property (nonatomic, strong) UILabel *heroHealingLabel;

@property (nonatomic, strong) UILabel *towerDamageNameLabel;
@property (nonatomic, strong) UILabel *towerDamageLabel;

@property (nonatomic, strong) UILabel *levelNameLabel;
@property (nonatomic, strong) UILabel *levelLabel;

@property (nonatomic, strong) UILabel *damageTakenNameLabel;
@property (nonatomic, strong) UILabel *damageTakenLabel;

@end

@implementation DTSPlayerStatsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _heroImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        _heroImageView.contentMode = UIViewContentModeScaleAspectFill;
        _heroImageView.layer.cornerRadius = 20;
        _heroImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_heroImageView];
        self.contentView.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
        
        _playerNameLabel = [UILabel new];
        _playerNameLabel.adjustsFontSizeToFitWidth = YES;
        _playerNameLabel.textAlignment = NSTextAlignmentCenter;
        _playerNameLabel.numberOfLines = 0;
        _playerNameLabel.textColor = UIColor.whiteColor;
        _playerNameLabel.frame = CGRectMake(70, 10, 70, 40);
        [self.contentView addSubview:_playerNameLabel];
        
        _kdaLabel = [UILabel new];
        _kdaLabel.adjustsFontSizeToFitWidth = YES;
        _kdaLabel.textAlignment = NSTextAlignmentCenter;
        _kdaLabel.numberOfLines = 0;
        _kdaLabel.textColor = UIColor.whiteColor;
        _kdaLabel.frame = CGRectMake(155, 20, 70, 20);
        [self.contentView addSubview:_kdaLabel];
        
        _gPMLabel = [UILabel new];
        _gPMLabel.adjustsFontSizeToFitWidth = YES;
        _gPMLabel.textAlignment = NSTextAlignmentCenter;
        _gPMLabel.numberOfLines = 0;
        _gPMLabel.textColor = UIColor.whiteColor;
        _gPMLabel.frame = CGRectMake(240, 20, 50, 20);
        [self.contentView addSubview:_gPMLabel];
        
        _xPMLabel = [UILabel new];
        _xPMLabel.adjustsFontSizeToFitWidth = YES;
        _xPMLabel.textAlignment = NSTextAlignmentCenter;
        _xPMLabel.numberOfLines = 0;
        _xPMLabel.textColor = UIColor.whiteColor;
        _xPMLabel.frame = CGRectMake(305, 20, 50, 20);
        [self.contentView addSubview:_xPMLabel];
        
        _lastHistNameLabel = [UILabel new];
        [_lastHistNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_lastHistNameLabel setText:@"Добито крипов:"];
        _lastHistNameLabel.textColor = UIColor.whiteColor;
        _lastHistNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_lastHistNameLabel];
        [_lastHistNameLabel.topAnchor constraintEqualToAnchor:_heroImageView.bottomAnchor constant:10].active = YES;
        [_lastHistNameLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:10].active = YES;
        [_lastHistNameLabel.widthAnchor constraintEqualToConstant:115].active = YES;
        [_lastHistNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _lastHitsLabel = [UILabel new];
        _lastHitsLabel.adjustsFontSizeToFitWidth = YES;
        [_lastHitsLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _lastHitsLabel.textColor = UIColor.whiteColor;
        _lastHitsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_lastHitsLabel];
        [_lastHitsLabel.topAnchor constraintEqualToAnchor:_lastHistNameLabel.topAnchor constant:2].active = YES;
        [_lastHitsLabel.leftAnchor constraintEqualToAnchor:_lastHistNameLabel.rightAnchor].active = YES;
        [_lastHitsLabel.widthAnchor constraintEqualToConstant:30].active = YES;
        [_lastHistNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _deniesNameLabel = [UILabel new];
        [_deniesNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_deniesNameLabel setText:@"Не отдано крипов:"];
        _deniesNameLabel.textColor = UIColor.whiteColor;
        _deniesNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_deniesNameLabel];
        [_deniesNameLabel.topAnchor constraintEqualToAnchor:_lastHistNameLabel.bottomAnchor constant:5].active = YES;
        [_deniesNameLabel.leftAnchor constraintEqualToAnchor:_lastHistNameLabel.leftAnchor].active = YES;
        [_deniesNameLabel.widthAnchor constraintEqualToConstant:135].active = YES;
        [_deniesNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _deniesLabel = [UILabel new];
        _deniesLabel.adjustsFontSizeToFitWidth = YES;
        [_deniesLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _deniesLabel.textColor = UIColor.whiteColor;
        _deniesLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_deniesLabel];
        [_deniesLabel.topAnchor constraintEqualToAnchor:_deniesNameLabel.topAnchor constant:2].active = YES;
        [_deniesLabel.leftAnchor constraintEqualToAnchor:_deniesNameLabel.rightAnchor].active = YES;
        [_deniesLabel.widthAnchor constraintEqualToConstant:20].active = YES;
        [_deniesLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _totalGoldNameLabel = [UILabel new];
        [_totalGoldNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_totalGoldNameLabel setText:@"Золота всего:"];
        _totalGoldNameLabel.textColor = UIColor.whiteColor;
        _totalGoldNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_totalGoldNameLabel];
        [_totalGoldNameLabel.topAnchor constraintEqualToAnchor:_deniesNameLabel.bottomAnchor constant:5].active = YES;
        [_totalGoldNameLabel.leftAnchor constraintEqualToAnchor:_lastHistNameLabel.leftAnchor ].active = YES;
        [_totalGoldNameLabel.widthAnchor constraintEqualToConstant:105].active = YES;
        [_totalGoldNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _totalGoldLabel = [UILabel new];
        _totalGoldLabel.adjustsFontSizeToFitWidth = YES;
        [_totalGoldLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _totalGoldLabel.textColor = UIColor.whiteColor;
        _totalGoldLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_totalGoldLabel];
        [_totalGoldLabel.topAnchor constraintEqualToAnchor:_totalGoldNameLabel.topAnchor constant:2].active = YES;
        [_totalGoldLabel.leftAnchor constraintEqualToAnchor:_totalGoldNameLabel.rightAnchor].active = YES;
        [_totalGoldLabel.widthAnchor constraintEqualToConstant:60].active = YES;
        [_totalGoldLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _heroDamageNameLabel = [UILabel new];
        [_heroDamageNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_heroDamageNameLabel setText:@"Нанесено урона:"];
        _heroDamageNameLabel.textColor = UIColor.whiteColor;
        _heroDamageNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_heroDamageNameLabel];
        [_heroDamageNameLabel.topAnchor constraintEqualToAnchor:_lastHistNameLabel.topAnchor].active = YES;
        [_heroDamageNameLabel.leftAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
        [_heroDamageNameLabel.widthAnchor constraintEqualToConstant:123].active = YES;
        [_heroDamageNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _heroDamageLabel = [UILabel new];
        _heroDamageLabel.adjustsFontSizeToFitWidth = YES;
        [_heroDamageLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _heroDamageLabel.textColor = UIColor.whiteColor;
        _heroDamageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_heroDamageLabel];
        [_heroDamageLabel.topAnchor constraintEqualToAnchor:_heroDamageNameLabel.topAnchor constant:2].active = YES;
        [_heroDamageLabel.leftAnchor constraintEqualToAnchor:_heroDamageNameLabel.rightAnchor].active = YES;
        [_heroDamageLabel.widthAnchor constraintEqualToConstant:60].active = YES;
        [_heroDamageLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _heroHealingNameLabel = [UILabel new];
        [_heroHealingNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_heroHealingNameLabel setText:@"Лечение героев:"];
        _heroHealingNameLabel.textColor = UIColor.whiteColor;
        _heroHealingNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_heroHealingNameLabel];
        [_heroHealingNameLabel.topAnchor constraintEqualToAnchor:_deniesNameLabel.topAnchor].active = YES;
        [_heroHealingNameLabel.leftAnchor constraintEqualToAnchor:_heroDamageNameLabel.leftAnchor].active = YES;
        [_heroHealingNameLabel.widthAnchor constraintEqualToConstant:120].active = YES;
        [_heroHealingNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _heroHealingLabel = [UILabel new];
        _heroHealingLabel.adjustsFontSizeToFitWidth = YES;
        [_heroHealingLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _heroHealingLabel.textColor = UIColor.whiteColor;
        _heroHealingLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_heroHealingLabel];
        [_heroHealingLabel.topAnchor constraintEqualToAnchor:_heroHealingNameLabel.topAnchor constant:2].active = YES;
        [_heroHealingLabel.leftAnchor constraintEqualToAnchor:_heroHealingNameLabel.rightAnchor].active = YES;
        [_heroHealingLabel.widthAnchor constraintEqualToConstant:60].active = YES;
        [_heroHealingLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        
        _towerDamageNameLabel = [UILabel new];
        [_towerDamageNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_towerDamageNameLabel setText:@"Урона по башням:"];
        _towerDamageNameLabel.textColor = UIColor.whiteColor;
        _towerDamageNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_towerDamageNameLabel];
        [_towerDamageNameLabel.topAnchor constraintEqualToAnchor:_totalGoldNameLabel.topAnchor].active = YES;
        [_towerDamageNameLabel.leftAnchor constraintEqualToAnchor:_heroDamageNameLabel.leftAnchor].active = YES;
        [_towerDamageNameLabel.widthAnchor constraintEqualToConstant:133].active = YES;
        [_towerDamageNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _towerDamageLabel = [UILabel new];
        _towerDamageLabel.adjustsFontSizeToFitWidth = YES;
        [_towerDamageLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _towerDamageLabel.textColor = UIColor.whiteColor;
        _towerDamageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_towerDamageLabel];
        [_towerDamageLabel.topAnchor constraintEqualToAnchor:_towerDamageNameLabel.topAnchor constant:2].active = YES;
        [_towerDamageLabel.leftAnchor constraintEqualToAnchor:_towerDamageNameLabel.rightAnchor].active = YES;
        [_towerDamageLabel.widthAnchor constraintEqualToConstant:60].active = YES;
        [_towerDamageLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _levelNameLabel = [UILabel new];
        [_levelNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_levelNameLabel setText:@"Уровень:"];
        _levelNameLabel.textColor = UIColor.whiteColor;
        _levelNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_levelNameLabel];
        [_levelNameLabel.topAnchor constraintEqualToAnchor:_totalGoldNameLabel.bottomAnchor constant:2].active = YES;
        [_levelNameLabel.leftAnchor constraintEqualToAnchor:_lastHistNameLabel.leftAnchor].active = YES;
        [_levelNameLabel.widthAnchor constraintEqualToConstant:70].active = YES;
        [_levelNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _levelLabel = [UILabel new];
        _levelLabel.adjustsFontSizeToFitWidth = YES;
        [_levelLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _levelLabel.textColor = UIColor.whiteColor;
        _levelLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_levelLabel];
        [_levelLabel.topAnchor constraintEqualToAnchor:_levelNameLabel.topAnchor constant:2].active = YES;
        [_levelLabel.leftAnchor constraintEqualToAnchor:_levelNameLabel.rightAnchor].active = YES;
        [_levelLabel.widthAnchor constraintEqualToConstant:60].active = YES;
        [_levelLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _damageTakenNameLabel = [UILabel new];
        [_damageTakenNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_damageTakenNameLabel setText:@"Урона получено:"];
        _damageTakenNameLabel.textColor = UIColor.whiteColor;
        _damageTakenNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_damageTakenNameLabel];
        [_damageTakenNameLabel.topAnchor constraintEqualToAnchor:_levelNameLabel.topAnchor].active = YES;
        [_damageTakenNameLabel.leftAnchor constraintEqualToAnchor:_heroDamageNameLabel.leftAnchor].active = YES;
        [_damageTakenNameLabel.widthAnchor constraintEqualToConstant:125].active = YES;
        [_damageTakenNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _damageTakenLabel = [UILabel new];
        _damageTakenLabel.adjustsFontSizeToFitWidth = YES;
        [_damageTakenLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _damageTakenLabel.textColor = UIColor.whiteColor;
        _damageTakenLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_damageTakenLabel];
        [_damageTakenLabel.topAnchor constraintEqualToAnchor:_damageTakenNameLabel.topAnchor constant:2].active = YES;
        [_damageTakenLabel.leftAnchor constraintEqualToAnchor:_damageTakenNameLabel.rightAnchor].active = YES;
        [_damageTakenLabel.widthAnchor constraintEqualToConstant:60].active = YES;
        [_damageTakenLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.lastHistNameLabel setHidden:NO];
            [self.lastHitsLabel setHidden:NO];
            [self.deniesNameLabel setHidden:NO];
            [self.deniesLabel setHidden:NO];
            [self.totalGoldNameLabel setHidden:NO];
            [self.totalGoldLabel setHidden:NO];
            [self.heroDamageNameLabel setHidden:NO];
            [self.heroDamageLabel setHidden:NO];
            [self.heroHealingNameLabel setHidden:NO];
            [self.heroHealingLabel setHidden:NO];
            [self.towerDamageNameLabel setHidden:NO];
            [self.towerDamageLabel setHidden:NO];
            [self.levelNameLabel setHidden:NO];
            [self.levelLabel setHidden:NO];
            [self.damageTakenNameLabel setHidden:NO];
            [self.damageTakenLabel setHidden:NO];
        });
    }
    else
    {
        [self.lastHistNameLabel setHidden:YES];
        [self.lastHitsLabel setHidden:YES];
        [self.deniesNameLabel setHidden:YES];
        [self.deniesLabel setHidden:YES];
        [self.totalGoldNameLabel setHidden:YES];
        [self.totalGoldLabel setHidden:YES];
        [self.heroDamageNameLabel setHidden:YES];
        [self.heroDamageLabel setHidden:YES];
        [self.heroHealingNameLabel setHidden:YES];
        [self.heroHealingLabel setHidden:YES];
        [self.towerDamageNameLabel setHidden:YES];
        [self.towerDamageLabel setHidden:YES];
        [self.levelNameLabel setHidden:YES];
        [self.levelLabel setHidden:YES];
        [self.damageTakenNameLabel setHidden:YES];
        [self.damageTakenLabel setHidden:YES];
    }
}

@end
