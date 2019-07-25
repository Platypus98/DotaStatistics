//
//  DTSGeneralMatchStats.h
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface DTSGeneralMatchStats : NSObject

@property (nonatomic, strong) NSNumber *matchId; /**< Идентификационный номер матча */
@property (nonatomic, assign) BOOL radiantWin; /**< Флаг победы Сил Света */
@property (nonatomic, strong) NSNumber *durationInSeconds; /**< Длительность мата в секундах */
@property (nonatomic, strong) NSNumber *direScore; /**< Количество очков Сил Тьмы */
@property (nonatomic, strong) NSNumber *radiantScore; /**< Количество очков Сил Света */
@property (nonatomic, strong) NSNumber *startTime; /**< Время начала матча */

/**
 Представление длительности матча в виде строки

 @param matchDurationInSeconds длительность матча в секундах
 @return строка длительности матча
 */
+ (NSString *)convertMatchDurationToString:(NSNumber *)matchDurationInSeconds;

/**
 Представление времени начала матча в виде строки

 @param startTime время начала матча
 @return строка времени начала матча
 */
+ (NSString *)convertStartTimeToString:(NSNumber *)startTime;

@end

NS_ASSUME_NONNULL_END
