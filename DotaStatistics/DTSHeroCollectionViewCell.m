//
//  HeroCollectionViewCell.m
//  DotaStatistics
//
//  Created by Ilya on 11/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSHeroCollectionViewCell.h"


@interface DTSHeroCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end


@implementation DTSHeroCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        [self.contentView addSubview:_imageView];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height - 25, self.contentView.frame.size.width, 25)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = UIColor.whiteColor;
        _label.adjustsFontSizeToFitWidth = YES;
        [_label setFont:[UIFont systemFontOfSize:17]];
        _label.backgroundColor = [UIColor colorWithRed:43.0f/255.0f green:43.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
        [self.contentView addSubview:_label];
        
        self.contentView.backgroundColor = [UIColor colorWithRed:3.0f/255.0f green:36.0f/255.0f blue:51.0f/255.0f alpha:1];
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
    }
    
    return self;
}

@end
