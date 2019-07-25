//
//  DTSSectionFabric.h
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTSSectionModel;

NS_ASSUME_NONNULL_BEGIN


@interface DTSSectionFabric : NSObject

/**
 Создание модели раздела 'Общее'

 @return модель раздела 'Общее'
 */
- (DTSSectionModel *)createTotalSection;

/**
 Создание модели раздела 'Последний матч'
 
 @return модель раздела 'Последний матч'
 */
- (DTSSectionModel *)createLastMatchSection;

@end

NS_ASSUME_NONNULL_END
