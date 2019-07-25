//
//  HeroCollectionViewCell.h
//  DotaStatistics
//
//  Created by Ilya on 11/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSHeroCollectionViewCell : UICollectionViewCell

@property (nonatomic, readonly) UIImageView *imageView; /**< Картинка героя */
@property (nonatomic, readonly) UILabel *label; /**< Имя героя */

@end

NS_ASSUME_NONNULL_END
