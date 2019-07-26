//
//  HeroesViewController.m
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//


#import "DTSAllHeroesViewController.h"
#import "DTSHeroesNerworkService.h"
#import "DTSHeroCollectionViewCell.h"
#import "DTSHeroViewController.h"
#import "DTSHero.h"
#import "AudioToolbox/AudioServices.h"
#import "CoreDataStack.h"
#import "MOHero.h"


@interface DTSAllHeroesViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) DTSHeroesNerworkService *networkService;
@property (nonatomic, copy) NSArray<DTSHero *> *heroesData;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, assign) BOOL shouldUpdateInformation;
@property (nonatomic, assign) BOOL collectionViewInformationCanBeUpdated;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, assign) NSInteger countOfHeroes;

@end


@implementation DTSAllHeroesViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _countOfHeroes = 0;
        _shouldUpdateInformation = NO;
        _collectionViewInformationCanBeUpdated = YES;
        _networkService = [DTSHeroesNerworkService new];
        _networkService.DTSAllHeroesViewControllerDelegate = self;
        _backgroundImageView = [UIImageView new];
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupBackgroundImage];
    [self.view addSubview:self.activityIndicatorView];
    [self setupCollectionView];
    [self setupActivityIndicatorView];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self getHeroesInformation];
    });
}

- (void)setupNavigationBar
{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"Герои";
}

- (void)setupBackgroundImage
{
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.backgroundImageView setImage:[UIImage imageNamed:@"dota_back_2"]];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.backgroundImageView];
}

- (void)setupCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(114, 80);
    layout.minimumLineSpacing = 25;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:UIScreen.mainScreen.bounds collectionViewLayout:layout];
    [self.collectionView setCollectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    self.collectionView.frame = CGRectMake(5, UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + self.navigationController.navigationBar.frame.size.height + 5, self.view.frame.size.width - 10, self.view.frame.size.height - ( UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + self.navigationController.navigationBar.frame.size.height + self.tabBarController.tabBar.frame.size.height));
    [self.collectionView registerClass:[DTSHeroCollectionViewCell class] forCellWithReuseIdentifier:@"Hero"];
    [self.view addSubview:self.collectionView];
}

- (void)setupActivityIndicatorView
{
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.activityIndicatorView.topAnchor constraintEqualToAnchor:self.collectionView.topAnchor constant:10].active = YES;
    [self.activityIndicatorView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.activityIndicatorView.widthAnchor constraintEqualToConstant:20].active = YES;
    [self.activityIndicatorView.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)getHeroesInformation
{
    NSManagedObjectContext *viewContext = [CoreDataStack shared].viewContext;
    [viewContext performBlock:^{
        
        NSError *error;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Hero"];
        NSArray *result = [request execute:&error];
        
        if (result.count != 0)
        {
            [self updateCountOfHeroes:result.count];
            self.collectionViewInformationCanBeUpdated = NO;
            
            for (MOHero *element in result)
            {
                DTSHero *currentHero = [DTSHero new];
                currentHero.heroId = [[NSNumber alloc] initWithInteger:element.heroId];
                currentHero.name = element.name;
                currentHero.image = [[UIImage alloc] initWithData:element.image];
                currentHero.attackType = element.attackType;
                currentHero.roles = element.roles;
                currentHero.baseHealth = [[NSNumber alloc] initWithFloat:element.baseHealth];
                currentHero.baseHealthRegen = [[NSNumber alloc] initWithFloat:element.baseHealthRegen];
                currentHero.baseMana = [[NSNumber alloc] initWithFloat:element.baseMana];
                currentHero.baseManaRegen = [[NSNumber alloc] initWithFloat:element.baseManaRegen];
                currentHero.baseArmor = [[NSNumber alloc] initWithFloat:element.baseArmor];
                currentHero.baseMagicResistance = [[NSNumber alloc] initWithFloat:element.baseMagicResistance];
                currentHero.baseAttackMinDamage = [[NSNumber alloc] initWithInteger:element.baseAttackMinDamage];
                currentHero.baseAttackMaxDamage = [[NSNumber alloc] initWithInteger:element.baseAttackMaxDamage];
                
                currentHero.baseStrenght = [[NSNumber alloc] initWithInteger:element.baseStrenght];
                currentHero.baseAgility = [[NSNumber alloc] initWithInteger:element.baseAgility];
                currentHero.baseIntelligence = [[NSNumber alloc] initWithInteger:element.baseIntelligence];
                currentHero.strenghtGain = [[NSNumber alloc] initWithFloat:element.strenghtGain];
                currentHero.agilityGain = [[NSNumber alloc] initWithFloat:element.agilityGain];
                currentHero.intelligenceGain = [[NSNumber alloc] initWithFloat:element.intelligenceGain];
                
                currentHero.attackRange = [[NSNumber alloc] initWithInteger:element.attackRange];
                currentHero.attackRate = [[NSNumber alloc] initWithFloat:element.attackRate];
                currentHero.moveSpeed = [[NSNumber alloc] initWithInteger:element.moveSpeed];
                currentHero.turnRate = [[NSNumber alloc] initWithFloat:element.turnRate];
                currentHero.capitanModeEnabled = element.capitanModeEnabled;
                currentHero.legs = [[NSNumber alloc] initWithInteger:element.legs];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self addHeroToArray:currentHero];
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.heroesData.count-1 inSection:0];
                    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
                });
            }
            self.collectionViewInformationCanBeUpdated = YES;
        }
        else
        {
           [self.networkService updateHeroes];
        }
    }];
}

- (void)addHero:(DTSHero *)hero
{
    [self addHeroToArray:hero];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.heroesData.count-1 inSection:0];
        [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    });
}

- (void)addHeroToArray:(DTSHero *)hero
{
    NSMutableArray<DTSHero *> *newHeroesData = [[NSMutableArray alloc] initWithArray:self.heroesData.mutableCopy];
    [newHeroesData addObject:hero];
    self.heroesData = newHeroesData.copy;
}

- (void)updateCountOfHeroes:(NSInteger)countOfHeroes
{
    self.countOfHeroes = countOfHeroes;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (void)updateInformationWillBe
{
    self.collectionViewInformationCanBeUpdated = NO;
}

- (void)getInformationDidEnd
{
    self.collectionViewInformationCanBeUpdated = YES;
}

- (void)checkInternetConnection
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Интернет соединение" message:@"Для получения данных необходимо наличие интеренет соединения.😎 Проверьте его и повторите попытку. \n \n P.S. Также, наше API может быть временно недоступно. Повторите попытку позднее" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.countOfHeroes;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DTSHeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Hero" forIndexPath:indexPath];
    @try
    {
        DTSHero *currentHero = [self.heroesData objectAtIndex:indexPath.row];
        [cell.imageView setImage:currentHero.image];
        [cell.label setText:currentHero.name];
    }
    @catch (NSException *exception)
    {
        [cell.imageView setImage:[UIImage new]];
        [cell.label setText:@""];
    }
    @finally
    {
    }
    return cell;
}

#pragma mark - UICollectionViewDataSource
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.heroesData.count > indexPath.row)
    {
        DTSHeroViewController *heroViewController = [DTSHeroViewController new];
        DTSHero *selectedHero = [self.heroesData objectAtIndex:indexPath.row];
        
        heroViewController.navigationItem.title = selectedHero.name;
        [heroViewController.heroImageView setImage:selectedHero.image];
        [heroViewController.heroNameLabel setText:selectedHero.name];
        [heroViewController.attackTypeLabel setText:selectedHero.attackType];
        
        [heroViewController.rolesLabel setText:selectedHero.roles];
        [heroViewController.rolesLabel sizeToFit];
        
        if (![selectedHero.baseHealth isKindOfClass:[NSNull class]])
        {
           [heroViewController.baseHealthLabel setText:selectedHero.baseHealth.stringValue];
        }
        else
        {
            [heroViewController.baseHealthLabel setText:@"-"];
        }
        
        if (![selectedHero.baseHealthRegen isKindOfClass:[NSNull class]])
        {
            [heroViewController.baseHealthRegenLabel setText:selectedHero.baseHealthRegen.stringValue];
        }
        else
        {
            [heroViewController.baseHealthRegenLabel setText:@"-"];
        }
        
        [heroViewController.baseManaLabel setText:selectedHero.baseMana.stringValue];
        [heroViewController.baseManaRegenLabel setText:selectedHero.baseManaRegen.stringValue];
        [heroViewController.baseArmorLabel setText:selectedHero.baseArmor.stringValue];
        [heroViewController.baseMagicResistanceLabel setText:selectedHero.baseMagicResistance.stringValue];
        [heroViewController.baseAttackMinDamageLabel setText:selectedHero.baseAttackMinDamage.stringValue];
        [heroViewController.baseAttackMaxDamageLabel setText:selectedHero.baseAttackMaxDamage.stringValue];
        [heroViewController.baseStrenghtLabel setText:selectedHero.baseStrenght.stringValue];
        [heroViewController.baseAgilityLabel setText:selectedHero.baseAgility.stringValue];
        [heroViewController.baseIntelligenceLabel setText:selectedHero.baseIntelligence.stringValue];
        [heroViewController.strenghtGainLabel setText:selectedHero.strenghtGain.stringValue];
        [heroViewController.agilityGainLabel setText:selectedHero.agilityGain.stringValue];
        [heroViewController.intelligenceGainLabel setText:selectedHero.intelligenceGain.stringValue];
        
        [heroViewController.attackRangeLabel setText:selectedHero.attackRange.stringValue];
        [heroViewController.attackRateLabel setText:selectedHero.attackRate.stringValue];
        [heroViewController.moveSpeedLabel setText:selectedHero.moveSpeed.stringValue];
        [heroViewController.turnRateLabel setText:selectedHero.turnRate.stringValue];
        NSString *capitanModeString = selectedHero.capitanModeEnabled ? @"да" : @"нет";
        [heroViewController.capitanModeEnabledLabel setText:capitanModeString];
        [heroViewController.legsLabel setText:selectedHero.legs.stringValue];
        
        [self.navigationController pushViewController:heroViewController animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGPoint offset = scrollView.contentOffset;
    CGFloat reloadDistance = -100;
    if (offset.y < reloadDistance && self.collectionViewInformationCanBeUpdated)
    {
        [self.activityIndicatorView startAnimating];
        self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.shouldUpdateInformation = YES;
        UIImpactFeedbackGenerator *mediumImpactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [mediumImpactFeedbackGenerator prepare];
        [mediumImpactFeedbackGenerator impactOccurred];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.shouldUpdateInformation)
    {
        self.shouldUpdateInformation = NO;
        self.heroesData = [NSArray new];
        [self.collectionView reloadData];
        [self.networkService updateHeroes];
        [self.activityIndicatorView stopAnimating];
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

@end
