//
//  DTSSectionModel.h
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSSectionModel : NSObject

@property (nonatomic, readonly) NSString *name; /**< Название раздела */
@property (nonatomic, readonly) UIImage *image; /**< Картинка раздела */

/**
 Создание модели раздела

 @param name название раздела
 @param image картинка раздела
 @return модель раздела
 */
- (instancetype)initWithName:(NSString *)name image:(UIImage *)image;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
