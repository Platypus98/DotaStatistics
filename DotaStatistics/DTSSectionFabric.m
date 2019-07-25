//
//  DTSSectionFabric.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSSectionFabric.h"
#import "DTSSectionModel.h"


@implementation DTSSectionFabric

- (DTSSectionModel *)createTotalSection
{
    return [[DTSSectionModel alloc] initWithName:@"Общее" image:[UIImage imageNamed:@"general_section"]];
}

- (DTSSectionModel *)createLastMatchSection
{
    return [[DTSSectionModel alloc] initWithName:@"Последний матч" image:[UIImage imageNamed:@"last_match_section"]];
}

@end
