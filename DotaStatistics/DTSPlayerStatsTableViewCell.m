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

@property (nonatomic, strong) UILabel *deniesNameLabel;

@property (nonatomic, strong) UILabel *totalGoldNameLabel;

@property (nonatomic, strong) UILabel *levelNameLabel;

@property (nonatomic, strong) UILabel *heroDamageNameLabel;

@property (nonatomic, strong) UILabel *heroHealingNameLabel;

@property (nonatomic, strong) UILabel *towerDamageNameLabel;

@property (nonatomic, strong) UILabel *damageTakenNameLabel;

@end

@implementation DTSPlayerStatsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
        
        NSInteger itemPropertySizeWidth = ([UIScreen mainScreen].bounds.size.width - 20)/5;
        _heroImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, itemPropertySizeWidth - 10, 40)];
        _heroImageView.contentMode = UIViewContentModeScaleAspectFill;
        _heroImageView.layer.cornerRadius = 20;
        _heroImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_heroImageView];
        
        _playerNameLabel = [UILabel new];
        _playerNameLabel.adjustsFontSizeToFitWidth = YES;
        _playerNameLabel.textAlignment = NSTextAlignmentCenter;
        _playerNameLabel.numberOfLines = 0;
        _playerNameLabel.textColor = UIColor.whiteColor;
        _playerNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_playerNameLabel];
        [_playerNameLabel.leftAnchor constraintEqualToAnchor:_heroImageView.rightAnchor constant:5].active = YES;
        [_playerNameLabel.topAnchor constraintEqualToAnchor:_heroImageView.topAnchor].active = YES;
        [_playerNameLabel.widthAnchor constraintEqualToConstant:itemPropertySizeWidth-5].active = YES;
        [_playerNameLabel.heightAnchor constraintEqualToAnchor:_heroImageView.heightAnchor].active = YES;
        
        _kdaLabel = [UILabel new];
        _kdaLabel.adjustsFontSizeToFitWidth = YES;
        _kdaLabel.textAlignment = NSTextAlignmentCenter;
        _kdaLabel.numberOfLines = 0;
        _kdaLabel.textColor = UIColor.whiteColor;
        _kdaLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_kdaLabel];
        [_kdaLabel.leftAnchor constraintEqualToAnchor:_playerNameLabel.rightAnchor constant:5].active = YES;
        [_kdaLabel.topAnchor constraintEqualToAnchor:_playerNameLabel.topAnchor].active = YES;
        [_kdaLabel.widthAnchor constraintEqualToConstant:itemPropertySizeWidth].active = YES;
        [_kdaLabel.heightAnchor constraintEqualToAnchor:_playerNameLabel.heightAnchor].active = YES;
        
        _gPMLabel = [UILabel new];
        _gPMLabel.adjustsFontSizeToFitWidth = YES;
        _gPMLabel.textAlignment = NSTextAlignmentCenter;
        _gPMLabel.numberOfLines = 0;
        _gPMLabel.textColor = UIColor.whiteColor;
        _gPMLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_gPMLabel];
        [_gPMLabel.leftAnchor constraintEqualToAnchor:_kdaLabel.rightAnchor].active = YES;
        [_gPMLabel.topAnchor constraintEqualToAnchor:_kdaLabel.topAnchor].active = YES;
        [_gPMLabel.widthAnchor constraintEqualToAnchor:_kdaLabel.widthAnchor].active = YES;
        [_gPMLabel.heightAnchor constraintEqualToAnchor:_kdaLabel.heightAnchor].active = YES;
        
        _xPMLabel = [UILabel new];
        _xPMLabel.adjustsFontSizeToFitWidth = YES;
        _xPMLabel.textAlignment = NSTextAlignmentCenter;
        _xPMLabel.numberOfLines = 0;
        _xPMLabel.textColor = UIColor.whiteColor;
        _xPMLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_xPMLabel];
        [_xPMLabel.leftAnchor constraintEqualToAnchor:_gPMLabel.rightAnchor].active = YES;
        [_xPMLabel.topAnchor constraintEqualToAnchor:_gPMLabel.topAnchor].active = YES;
        [_xPMLabel.widthAnchor constraintEqualToAnchor:_gPMLabel.widthAnchor].active = YES;
        [_xPMLabel.heightAnchor constraintEqualToAnchor:_gPMLabel.heightAnchor].active = YES;
        
        _lastHistNameLabel = [UILabel new];
        [_lastHistNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_lastHistNameLabel setText:@"Добито крипов: -"];
        _lastHistNameLabel.textColor = UIColor.whiteColor;
        _lastHistNameLabel.adjustsFontSizeToFitWidth = YES;
        _lastHistNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_lastHistNameLabel];
        [_lastHistNameLabel.topAnchor constraintEqualToAnchor:_heroImageView.bottomAnchor constant:10].active = YES;
        [_lastHistNameLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:10].active = YES;
        [_lastHistNameLabel.rightAnchor constraintEqualToAnchor:self.contentView.centerXAnchor constant:5].active = YES;
        [_lastHistNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _deniesNameLabel = [UILabel new];
        [_deniesNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_deniesNameLabel setText:@"Не отдано крипов: - "];
        _deniesNameLabel.textColor = UIColor.whiteColor;
        _deniesNameLabel.adjustsFontSizeToFitWidth = YES;
        _deniesNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_deniesNameLabel];
        [_deniesNameLabel.topAnchor constraintEqualToAnchor:_lastHistNameLabel.bottomAnchor constant:5].active = YES;
        [_deniesNameLabel.leftAnchor constraintEqualToAnchor:_lastHistNameLabel.leftAnchor].active = YES;
        [_deniesNameLabel.rightAnchor constraintEqualToAnchor:_lastHistNameLabel.rightAnchor].active = YES;
        [_deniesNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _totalGoldNameLabel = [UILabel new];
        [_totalGoldNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_totalGoldNameLabel setText:@"Золота всего: -"];
        _totalGoldNameLabel.textColor = UIColor.whiteColor;
        _totalGoldNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _totalGoldNameLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_totalGoldNameLabel];
        [_totalGoldNameLabel.topAnchor constraintEqualToAnchor:_deniesNameLabel.bottomAnchor constant:5].active = YES;
        [_totalGoldNameLabel.leftAnchor constraintEqualToAnchor:_deniesNameLabel.leftAnchor].active = YES;
        [_totalGoldNameLabel.rightAnchor constraintEqualToAnchor:_deniesNameLabel.rightAnchor].active = YES;
        [_totalGoldNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _levelNameLabel = [UILabel new];
        [_levelNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_levelNameLabel setText:@"Уровень: - "];
        _levelNameLabel.textColor = UIColor.whiteColor;
        _levelNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _levelNameLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_levelNameLabel];
        [_levelNameLabel.topAnchor constraintEqualToAnchor:_totalGoldNameLabel.bottomAnchor constant:5].active = YES;
        [_levelNameLabel.leftAnchor constraintEqualToAnchor:_totalGoldNameLabel.leftAnchor].active = YES;
        [_levelNameLabel.rightAnchor constraintEqualToAnchor:_totalGoldNameLabel.rightAnchor].active = YES;
        [_levelNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _heroDamageNameLabel = [UILabel new];
        [_heroDamageNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_heroDamageNameLabel setText:@"Нанесено урона: -"];
        _heroDamageNameLabel.textColor = UIColor.whiteColor;
        _heroDamageNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _heroDamageNameLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_heroDamageNameLabel];
        [_heroDamageNameLabel.topAnchor constraintEqualToAnchor:_lastHistNameLabel.topAnchor].active = YES;
        [_heroDamageNameLabel.leftAnchor constraintEqualToAnchor:self.contentView.centerXAnchor constant:10].active = YES;
        [_heroDamageNameLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-5].active = YES;
        [_heroDamageNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _heroHealingNameLabel = [UILabel new];
        [_heroHealingNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_heroHealingNameLabel setText:@"Лечение героев: -"];
        _heroHealingNameLabel.textColor = UIColor.whiteColor;
        _heroHealingNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _heroHealingNameLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_heroHealingNameLabel];
        [_heroHealingNameLabel.topAnchor constraintEqualToAnchor:_heroDamageNameLabel.bottomAnchor constant:5].active = YES;
        [_heroHealingNameLabel.leftAnchor constraintEqualToAnchor:_heroDamageNameLabel.leftAnchor].active = YES;
        [_heroHealingNameLabel.rightAnchor constraintEqualToAnchor:_heroDamageNameLabel.rightAnchor].active = YES;
        [_heroHealingNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _towerDamageNameLabel = [UILabel new];
        [_towerDamageNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_towerDamageNameLabel setText:@"Урона по башням: -"];
        _towerDamageNameLabel.textColor = UIColor.whiteColor;
        _towerDamageNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _towerDamageNameLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_towerDamageNameLabel];
        [_towerDamageNameLabel.topAnchor constraintEqualToAnchor:_heroHealingNameLabel.bottomAnchor constant:5].active = YES;
        [_towerDamageNameLabel.leftAnchor constraintEqualToAnchor:_heroHealingNameLabel.leftAnchor].active = YES;
        [_towerDamageNameLabel.rightAnchor constraintEqualToAnchor:_heroHealingNameLabel.rightAnchor].active = YES;
        [_towerDamageNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
        
        _damageTakenNameLabel = [UILabel new];
        [_damageTakenNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_damageTakenNameLabel setText:@"Урона получено: -"];
        _damageTakenNameLabel.textColor = UIColor.whiteColor;
        _damageTakenNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _damageTakenNameLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_damageTakenNameLabel];
        [_damageTakenNameLabel.topAnchor constraintEqualToAnchor:_towerDamageNameLabel.bottomAnchor constant:5].active = YES;
        [_damageTakenNameLabel.leftAnchor constraintEqualToAnchor:_towerDamageNameLabel.leftAnchor].active = YES;
        [_damageTakenNameLabel.rightAnchor constraintEqualToAnchor:_towerDamageNameLabel.rightAnchor].active = YES;
        [_damageTakenNameLabel.heightAnchor constraintEqualToConstant:20].active = YES;
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
            [self.deniesNameLabel setHidden:NO];
            [self.totalGoldNameLabel setHidden:NO];
            [self.levelNameLabel setHidden:NO];
            [self.heroDamageNameLabel setHidden:NO];
            [self.heroHealingNameLabel setHidden:NO];
            [self.towerDamageNameLabel setHidden:NO];
            [self.damageTakenNameLabel setHidden:NO];
        });
    }
    else
    {
        [self.lastHistNameLabel setHidden:YES];
        [self.deniesNameLabel setHidden:YES];
        [self.totalGoldNameLabel setHidden:YES];
        [self.levelNameLabel setHidden:YES];
        [self.heroDamageNameLabel setHidden:YES];
        [self.heroHealingNameLabel setHidden:YES];
        [self.towerDamageNameLabel setHidden:YES];
        [self.damageTakenNameLabel setHidden:YES];
    }
}

@end
