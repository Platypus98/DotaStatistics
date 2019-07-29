//
//  DTSSectionModel.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSSectionModel.h"


@interface DTSSectionModel ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIImage *image;

@end


@implementation DTSSectionModel

- (instancetype)initWithName:(NSString *)name image:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        _name = [name copy];
        _image = image;
    }
    return self;
}

@end
