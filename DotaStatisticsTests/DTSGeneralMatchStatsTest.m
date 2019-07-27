//
//  DTSGeneralMatchStatsTest.m
//  DotaStatisticsTests
//
//  Created by Ilya on 27/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../DotaStatistics/DTSGeneralMatchStats.h"


@interface DTSGeneralMatchStatsTest : XCTestCase

@property (nonatomic, strong) DTSGeneralMatchStats *testGeneralMatchStats;

@end


@implementation DTSGeneralMatchStatsTest

- (void)setUp
{
    [super setUp];
    self.testGeneralMatchStats = [DTSGeneralMatchStats new];
}

- (void)tearDown
{
    self.testGeneralMatchStats = nil;
    [super tearDown];
}

- (void)testMatchDurationStringCorrect
{
    //Arrange
    self.testGeneralMatchStats.durationInSeconds = [[NSNumber alloc] initWithInt:(int)1566];
    
    //Act
    NSString *mathcDurationResultString = [DTSGeneralMatchStats convertMatchDurationToString:self.testGeneralMatchStats.durationInSeconds];
    
    //Assert
    XCTAssertTrue([mathcDurationResultString isEqualToString:@"26:06"]);
}

- (void)testStartTimeStringCorrect
{
    //Arrange
    self.testGeneralMatchStats.startTime = [[NSNumber alloc] initWithInt:(int)1564221010];
    
    //Act
    NSString *startTimeResultString = [DTSGeneralMatchStats convertStartTimeToString:self.testGeneralMatchStats.startTime];
    
    //Assert
    XCTAssertTrue([startTimeResultString isEqualToString:@"27.07 12:50"]);
}

@end
