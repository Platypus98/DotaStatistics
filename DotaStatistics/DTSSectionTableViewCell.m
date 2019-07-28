//
//  SectionTableViewCell.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSSectionTableViewCell.h"


@interface DTSSectionTableViewCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *rightArrowImageView;

@end


@implementation DTSSectionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.contentView.backgroundColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        _label = [UILabel new];
        [_label setFont:[UIFont fontWithName:@"Helvetica" size:20]];
        _label.textColor = UIColor.whiteColor;
        _label.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_label];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        [_label.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [_label.leftAnchor constraintEqualToAnchor:self.imageView.rightAnchor constant:10].active = YES;
        [_label.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-50].active = YES;
        [_label.heightAnchor constraintEqualToConstant:40].active = YES;
        
        _rightArrowImageView = [UIImageView new];
        [_rightArrowImageView setImage:[UIImage imageNamed:@"right_arrow"]];
        _rightArrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_rightArrowImageView];
        [_rightArrowImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [_rightArrowImageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-5].active = YES;
        [_rightArrowImageView.widthAnchor constraintEqualToConstant:20].active = YES;
        [_rightArrowImageView.heightAnchor constraintEqualToConstant:20].active = YES;
    }
    return self;
}

@end
