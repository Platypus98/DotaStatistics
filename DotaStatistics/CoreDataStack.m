//
//  CoreDataStack.m
//  DotaStatistics
//
//  Created by Ilya on 17/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "CoreDataStack.h"
#import "MOHero.h"

@interface CoreDataStack ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, strong) NSManagedObjectModel *objectModel;

@end

@implementation CoreDataStack

+ (instancetype)shared
{
    static dispatch_once_t once;
    static CoreDataStack *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [CoreDataStack new];
    });
    return sharedInstance;
}

- (NSManagedObjectContext *)writeContext
{
    if (_writeContext)
    {
        return _writeContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self coordinator];
    if (coordinator)
    {
        _writeContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    }
    _writeContext.parentContext = [self viewContext];
    return _writeContext;
}

- (NSManagedObjectContext *)viewContext
{
    if (_viewContext)
    {
        return _viewContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self coordinator];
    if (coordinator)
    {
        _viewContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    }
    [_viewContext setPersistentStoreCoordinator:coordinator];
    return _viewContext;
}

- (NSPersistentStoreCoordinator *)coordinator
{
    if (_coordinator)
    {
        return _coordinator;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *urlDirectory = [[[NSURL URLWithString:documentsDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"] absoluteString];
    NSError *error;
    NSURL *url = [NSURL fileURLWithPath:urlDirectory isDirectory:NO];
    
    _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self objectModel]];
    
    if (![_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:@{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES} error:&error])
    {
        NSLog(@"%@", [error localizedFailureReason]);
        abort();
    }
    
    return _coordinator;
}

- (NSManagedObjectModel *)objectModel
{
    if (_objectModel)
    {
        return _objectModel;
    }
    
    NSURL *objectModelDirectory = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
    _objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:objectModelDirectory];
    return _objectModel;
}

+ (void)addHeroRecord:(DTSHero *)newHero
{
    NSManagedObjectContext *writeContext = [CoreDataStack shared].writeContext;

    [writeContext performBlock:^{
        MOHero *hero = [[MOHero alloc] initWithContext:writeContext];
        hero.heroId = newHero.heroId.integerValue;
        hero.name = newHero.name;
        hero.image = UIImagePNGRepresentation(newHero.image);
        hero.attackType = newHero.attackType;
        hero.roles = newHero.roles;
        
        if (![newHero.baseHealth isKindOfClass:[NSNull class]])
        {
            hero.baseHealth = newHero.baseHealth.floatValue;
        }
        
        if (![newHero.baseHealthRegen isKindOfClass:[NSNull class]])
        {
            hero.baseHealthRegen = newHero.baseHealthRegen.floatValue;
        }
        
        hero.baseMana = newHero.baseMana.floatValue;
        hero.baseManaRegen = newHero.baseManaRegen.floatValue;
        hero.baseArmor = newHero.baseArmor.floatValue;
        hero.baseMagicResistance = newHero.baseMagicResistance.floatValue;
        hero.baseAttackMinDamage = newHero.baseAttackMinDamage.integerValue;
        hero.baseAttackMaxDamage = newHero.baseAttackMaxDamage.integerValue;
        hero.baseStrenght = newHero.baseStrenght.integerValue;
        hero.baseAgility = newHero.baseAgility.integerValue;
        hero.baseIntelligence = newHero.baseIntelligence.integerValue;
        hero.strenghtGain = newHero.strenghtGain.floatValue;
        hero.agilityGain = newHero.agilityGain.floatValue;
        hero.intelligenceGain = newHero.intelligenceGain.floatValue;
        hero.attackRange = newHero.attackRange.integerValue;
        hero.attackRate = newHero.attackRate.floatValue;
        hero.moveSpeed = newHero.moveSpeed.integerValue;
        hero.turnRate = newHero.turnRate.floatValue;
        hero.capitanModeEnabled = newHero.capitanModeEnabled;
        hero.legs = newHero.legs.integerValue;
        
        [writeContext save:nil];
        [writeContext.parentContext performBlock:^{
            [writeContext.parentContext save:nil];
        }];
    }];
}

+ (void)clearHeroTable
{
    NSError *error;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Hero"];
    NSBatchDeleteRequest *batchDeleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    @try
    {
        [[CoreDataStack shared].writeContext executeRequest:batchDeleteRequest error:&error];
    }
    @catch (NSException *exception)
    {
    } @finally
    {
    }
}

+ (NSData *)getHeroImageByHeroId:(NSInteger )heroId
{
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;

    __block NSData *imageData = nil;
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [viewContext performBlock:^{
        NSError *error;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Hero"];
        request.predicate = [NSPredicate predicateWithFormat:@"heroId = %d", heroId];
        NSArray *result = [request execute:&error];
        
        if (result.count != 0)
        {
            for (MOHero *element in result)
            {
                imageData = element.image;
            }
        }
        dispatch_semaphore_signal(sema);
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    return imageData;
}


@end
