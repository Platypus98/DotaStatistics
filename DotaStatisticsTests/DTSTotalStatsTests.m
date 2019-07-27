//
//  DotaStatisticsTests.m
//  DotaStatisticsTests
//
//  Created by Ilya on 26/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../DotaStatistics/DTSTotalStats.h"


@interface DTSTotalStatsTests : XCTestCase

@property (nonatomic, strong) DTSTotalStats *testTotalStats;

@end


@implementation DTSTotalStatsTests

- (void)setUp
{
    [super setUp];
    self.testTotalStats = [DTSTotalStats new];
}

- (void)tearDown
{
    self.testTotalStats = nil;
    [super tearDown];
}

- (void)testTotalDurationStringCorrect
{
    //Arrange
    self.testTotalStats.durationInSeconds = [[NSNumber alloc] initWithInt:(int)1617222];
    
    //Act
    NSString *totalDurationResultString = [DTSTotalStats convertTotalDurationToString:self.testTotalStats.durationInSeconds];
    
    //Assert
    XCTAssertTrue([totalDurationResultString isEqualToString:@"18д 17ч 13м 42с"]);
}

@end
