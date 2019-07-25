//
//  DTSLastMatchViewController.m
//  DotaStatistics
//
//  Created by Ilya on 23/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSLastMatchViewController.h"
#import "DTSLastMatchNetworkService.h"
#import "DTSGeneralMatchStats.h"
#import "DTSPlayerMatchStats.h"
#import "DTSPlayerStatsTableViewCell.h"
#import "CoreDataStack.h"
#import "MOHero.h"


@interface DTSLastMatchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DTSLastMatchNetworkService *networkService;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *winnerLabel;
@property (nonatomic, strong) UILabel *radiantScore;
@property (nonatomic, strong) UILabel *direScore;
@property (nonatomic, strong) UILabel *matchDuration;
@property (nonatomic, strong) UILabel *startTime;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *sectionsTitles;
@property (nonatomic, copy) NSArray<DTSPlayerMatchStats *> *playersMatchStats;
@property (nonatomic, assign) NSInteger currentSelectionRow;
@property (nonatomic, assign) NSInteger currentSelectionSection;

@property (nonatomic, strong) UILabel *availabilityOfHeroesImagesLabel;

@end


@implementation DTSLastMatchViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _networkService = [DTSLastMatchNetworkService new];
        _networkService.DTSLastMatchViewConstrollerDelegate = self;
        
        _headerView = [UIView new];
        _winnerLabel = [UILabel new];
        _radiantScore = [UILabel new];
        _direScore = [UILabel new];
        _matchDuration = [UILabel new];
        _startTime = [UILabel new];
        
        _tableView = [UITableView new];
        _sectionsTitles = @[@"Силы Света", @"Силы Тьмы"];
        _currentSelectionRow = -1;
        _currentSelectionSection = -1;
        
        _availabilityOfHeroesImagesLabel = [UILabel new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:27.0f/255.0f green:28.0f/255.0f blue:32.0f/255.0f alpha:1];
    [self setupNavigationBar];
    [self setupHeaderView];
    [self setupTableView];
    [self.networkService getLatestMatchStatsWithSteam32Id:[[NSUserDefaults standardUserDefaults] stringForKey:@"Steam32Id"]];
}

- (void)setupHeaderView
{
    self.headerView.frame = CGRectMake(10, self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + 10, self.view.frame.size.width - 20, 100);
    self.headerView.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    self.headerView.layer.cornerRadius = 5;
    self.headerView.layer.masksToBounds = YES;
    [self.view addSubview:self.headerView];
    
    [self.winnerLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
    self.winnerLabel.textColor = UIColor.whiteColor;
    [self.winnerLabel setText:@"-"];
    self.winnerLabel.textAlignment = NSTextAlignmentCenter;
    self.winnerLabel.frame = CGRectMake(10, 10, self.headerView.frame.size.width - 20, 20);
    [self.headerView addSubview:self.winnerLabel];
    
    self.matchDuration.textColor = UIColor.whiteColor;
    self.matchDuration.translatesAutoresizingMaskIntoConstraints = NO;
    [self.matchDuration setText:@"-"];
    [self.matchDuration setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    [self.headerView addSubview:self.matchDuration];
    [self.matchDuration.topAnchor constraintEqualToAnchor:self.winnerLabel.bottomAnchor constant:25].active = YES;
    [self.matchDuration.centerXAnchor constraintEqualToAnchor:self.headerView.centerXAnchor].active = YES;
    [self.matchDuration.widthAnchor constraintEqualToConstant:60].active = YES;
    [self.matchDuration.heightAnchor constraintEqualToConstant:20].active = YES;
    
    self.radiantScore.textColor = [UIColor colorWithRed:86.0f/255.0f green:177.0f/255.0f blue:117.0f/255.0f alpha:1];
    self.radiantScore.translatesAutoresizingMaskIntoConstraints = NO;
    [self.radiantScore setText:@"-"];
    self.radiantScore.textAlignment = NSTextAlignmentCenter;
    [self.radiantScore setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]];
    [self.headerView addSubview:self.radiantScore];
    [self.radiantScore.centerYAnchor constraintEqualToAnchor:self.matchDuration.centerYAnchor].active = YES;
    [self.radiantScore.leftAnchor constraintEqualToAnchor:self.headerView.leftAnchor].active = YES;
    [self.radiantScore.rightAnchor constraintEqualToAnchor:self.matchDuration.leftAnchor].active = YES;
    [self.radiantScore.heightAnchor constraintEqualToConstant:30].active = YES;
    
    self.direScore.textColor = [UIColor colorWithRed:219.0f/255.0f green:56.0f/255.0f blue:86.0f/255.0f alpha:1];
    self.direScore.translatesAutoresizingMaskIntoConstraints = NO;
    [self.direScore setText:@"-"];
    self.direScore.textAlignment = NSTextAlignmentCenter;
    [self.direScore setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]];
    [self.headerView addSubview:self.direScore];
    [self.direScore.centerYAnchor constraintEqualToAnchor:self.matchDuration.centerYAnchor].active = YES;
    [self.direScore.leftAnchor constraintEqualToAnchor:self.matchDuration.rightAnchor].active = YES;
    [self.direScore.rightAnchor constraintEqualToAnchor:self.headerView.rightAnchor].active = YES;
    [self.direScore.heightAnchor constraintEqualToConstant:30].active = YES;
    
    self.startTime.textColor = UIColor.whiteColor;
    self.startTime.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startTime setText:@"-"];
    self.startTime.textAlignment = NSTextAlignmentCenter;
    [self.startTime setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
    [self.headerView addSubview:self.startTime];
    [self.startTime.centerXAnchor constraintEqualToAnchor:self.matchDuration.centerXAnchor].active = YES;
    [self.startTime.topAnchor constraintEqualToAnchor:self.matchDuration.bottomAnchor].active = YES;
    [self.startTime.widthAnchor constraintEqualToConstant:200].active = YES;
    [self.startTime.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)setupTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[DTSPlayerStatsTableViewCell class] forCellReuseIdentifier:@"PlayerStats"];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundView.layer.cornerRadius = 5;
    self.tableView.backgroundView.layer.masksToBounds = YES;
    self.tableView.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:40.0f/255.0f blue:62.0f/255.0f alpha:1];
    [self.view addSubview:self.tableView];
    [self.tableView.topAnchor constraintEqualToAnchor:self.headerView.bottomAnchor constant:15].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (void)setGeneralMatchStats:(DTSGeneralMatchStats *)generalMatchStats
{
    if (generalMatchStats.radiantWin)
    {
        [self.winnerLabel setText:@"Победа Cил Cвета"];
    }
    else
    {
        [self.winnerLabel setText:@"Победа Cил Тьмы"];
    }
    
    [self.matchDuration setText:[DTSGeneralMatchStats convertMatchDurationToString:generalMatchStats.durationInSeconds]];
    [self.radiantScore setText:generalMatchStats.radiantScore.stringValue];
    [self.direScore setText:generalMatchStats.direScore.stringValue];
    [self.startTime setText:[DTSGeneralMatchStats convertStartTimeToString:generalMatchStats.startTime]];
}

- (void)setupAvailabilityOfHeroesImagesLabel
{
    [self.availabilityOfHeroesImagesLabel setText:@"*Изображения героев станут доступны после посещения вкладки 'Герои'"];
    self.availabilityOfHeroesImagesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.availabilityOfHeroesImagesLabel.textColor = UIColor.whiteColor;
    self.availabilityOfHeroesImagesLabel.adjustsFontSizeToFitWidth = YES;
    [self.availabilityOfHeroesImagesLabel setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [self.view addSubview:self.availabilityOfHeroesImagesLabel];
    [self.availabilityOfHeroesImagesLabel.topAnchor constraintEqualToAnchor:self.headerView.bottomAnchor].active = YES;
    [self.availabilityOfHeroesImagesLabel.leftAnchor constraintEqualToAnchor:self.headerView.leftAnchor].active = YES;
    [self.availabilityOfHeroesImagesLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.availabilityOfHeroesImagesLabel.heightAnchor constraintEqualToConstant:15].active = YES;
}

- (void)addPlayerMatchStats:(DTSPlayerMatchStats *)playerMatchStats
{
    NSMutableArray<DTSPlayerMatchStats *> *newPlayersMatchStats = [[NSMutableArray alloc] initWithArray:self.playersMatchStats.mutableCopy];
    [newPlayersMatchStats addObject:playerMatchStats];
    self.playersMatchStats = newPlayersMatchStats.copy;
    if (self.playersMatchStats.count == 10)
    {
        if (playerMatchStats.heroImage == nil)
        {
            [self setupAvailabilityOfHeroesImagesLabel];
        }
        [self.tableView reloadData];
    }
}

- (void)setupNavigationBar
{
    self.navigationItem.title = @"Последний матч";
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)infrormationIsntFind
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Упс ..." message:@"По данному Steam32 ID не найдено данных 😢. Измените его в разделе 'Настройки' и повторите попытку" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTSPlayerStatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerStats" forIndexPath:indexPath];
    
    if (self.playersMatchStats.count != 0)
    {
        DTSPlayerMatchStats *playerMatchStats;
        if (indexPath.section == 0)
        {
            playerMatchStats = [self.playersMatchStats objectAtIndex:indexPath.row];
        }
        else
        {
            playerMatchStats = [self.playersMatchStats objectAtIndex:indexPath.row + 5];
        }
        
        [cell.heroImageView setImage:playerMatchStats.heroImage];
        if (playerMatchStats.playerName != nil)
        {
            [cell.playerNameLabel setText:playerMatchStats.playerName];
        }
        else
        {
            [cell.playerNameLabel setText:@"-"];
        }
        [cell.kdaLabel setText:[NSString stringWithFormat:@"%ld/%ld/%ld", playerMatchStats.kills.integerValue, playerMatchStats.deaths.integerValue, playerMatchStats.assists.integerValue]];
        [cell.gPMLabel setText:playerMatchStats.gPM.stringValue];
        [cell.xPMLabel setText:playerMatchStats.xPM.stringValue];
        [cell.lastHitsLabel setText:playerMatchStats.lastHits.stringValue];
        [cell.deniesLabel setText:playerMatchStats.denies.stringValue];
        [cell.totalGoldLabel setText:playerMatchStats.totalGold.stringValue];
        [cell.heroDamageLabel setText:playerMatchStats.heroDamage.stringValue];
        [cell.heroHealingLabel setText:playerMatchStats.heroHealing.stringValue];
        [cell.towerDamageLabel setText:playerMatchStats.towerDamage.stringValue];
        [cell.levelLabel setText:playerMatchStats.level.stringValue];
        [cell.damageTakenLabel setText:playerMatchStats.damageTaken.stringValue];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [tableView beginUpdates];
    [tableView endUpdates];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == self.currentSelectionRow & [indexPath section] == self.currentSelectionSection)
    {
        return 160;
    }
    else
    {
        return 60;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
    view.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:53.0f/255.0f alpha:1];
    
    UILabel *teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, tableView.frame.size.width, 20)];
    [teamLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    teamLabel.textColor = UIColor.whiteColor;
    teamLabel.textAlignment = NSTextAlignmentCenter;
    NSString *sectionTitle = [self.sectionsTitles objectAtIndex:section];
    [teamLabel setText:sectionTitle];
    [view addSubview:teamLabel];
    
    UILabel *heroLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 32, 40, 15)];
    [heroLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    heroLabel.textColor = UIColor.whiteColor;
    heroLabel.textAlignment = NSTextAlignmentCenter;
    [heroLabel setText:@"Герой"];
    [view addSubview:heroLabel];
    
    UILabel *playerLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 32, 70, 15)];
    [playerLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    playerLabel.textColor = UIColor.whiteColor;
    playerLabel.textAlignment = NSTextAlignmentCenter;
    [playerLabel setText:@"Игрок"];
    [view addSubview:playerLabel];
    
    UILabel *kdaLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 32, 70, 15)];
    [kdaLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    kdaLabel.textColor = UIColor.whiteColor;
    kdaLabel.textAlignment = NSTextAlignmentCenter;
    [kdaLabel setText:@"K/D/A"];
    [view addSubview:kdaLabel];
    
    UILabel *gPMLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 32, 50, 15)];
    [gPMLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    gPMLabel.textColor = UIColor.whiteColor;
    gPMLabel.textAlignment = NSTextAlignmentCenter;
    [gPMLabel setText:@"GPM"];
    [view addSubview:gPMLabel];
    
    UILabel *xPMLabel = [[UILabel alloc] initWithFrame:CGRectMake(305, 32, 50, 15)];
    [xPMLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    xPMLabel.textColor = UIColor.whiteColor;
    xPMLabel.textAlignment = NSTextAlignmentCenter;
    [xPMLabel setText:@"XPM"];
    [view addSubview:xPMLabel];
    
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    self.currentSelectionRow = row;
    self.currentSelectionSection = section;
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isSelected])
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.currentSelectionRow = -1;
        self.currentSelectionSection = -1;
        [tableView beginUpdates];
        [tableView endUpdates];
        return nil;
    }
    return indexPath;
}

@end
