//
//  CoreDataStack.h
//  DotaStatistics
//
//  Created by Ilya on 17/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTSHero.h"
@import CoreData;

NS_ASSUME_NONNULL_BEGIN


@interface CoreDataStack : NSObject

@property (nonatomic, strong) NSManagedObjectContext *viewContext; /**< Контекст для чтения данных */
@property (nonatomic, strong) NSManagedObjectContext *writeContext; /**< Контекст для записи данных */

/**
 Создание/получение синглтона CoreDataStack
 
 @return CoreDataStack
 */
+ (instancetype)shared;

/**
 Добавление новой записи с информацией о герое

 @param newHero добавляемая модель с информацией о герое
 */
+ (void)addHeroRecord:(DTSHero *)newHero;

/**
 Полная очистка таблицы с героями
 */
+ (void)clearHeroTable;

/**
 Получение данных изображения героя

 @param heroId идентификационный номер героя
 @return NSData изображения героя
 */
+ (NSData *)getHeroImageByHeroId:(NSInteger )heroId;

@end

NS_ASSUME_NONNULL_END
