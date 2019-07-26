//
//  DTSSectionsOfStatiscticsTableViewController.m
//  DotaStatistics
//
//  Created by Ilya on 21/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSSectionsOfStatiscticsTableViewController.h"
#import "DTSSectionTableViewCell.h"
#import "DTSSectionModel.h"
#import "DTSSectionFabric.h"
#import "DTSTotalStatsViewController.h"
#import "DTSLastMatchViewController.h"


@interface DTSSectionsOfStatiscticsTableViewController ()

@property (nonatomic, strong) NSArray<DTSSectionModel *> *sections;
@property (nonatomic, strong) DTSSectionFabric *fabric;

@end


@implementation DTSSectionsOfStatiscticsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.backgroundColor = [UIColor colorWithRed:27.0f/255.0f green:28.0f/255.0f blue:32.0f/255.0f alpha:1];
    [self.tableView registerClass:[DTSSectionTableViewCell class] forCellReuseIdentifier:@"reuseID"];
    self.tableView.tableFooterView = [UIView new];
    self.fabric = [DTSSectionFabric new];
    self.sections = @[
                     [self.fabric createTotalSection],
                     [self.fabric createLastMatchSection]
                     ];
}

- (void)infrormationIsntFind
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Упс ..." message:@"По данному Steam32 ID не найдено данных 😢. Измените его в разделе 'Настройки' и повторите попытку" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)checkInternetConnection
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Интеренет соединение" message:@"Для получения данных необходимо наличие интеренет соединения.😎 Проверьте его и повторите попытку. \n \n P.S. Также, наше API может быть временно недоступно. Повторите попытку позднее" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTSSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID" forIndexPath:indexPath];
    DTSSectionModel *section = [self.sections objectAtIndex:indexPath.row];
    [cell.label setText:section.name];
    [cell.imageView setImage:section.image];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (self.isInformationFind)
    {
        NSString *sectionName = [self.sections objectAtIndex:indexPath.row].name;
        if ([sectionName isEqualToString:@"Суммарная статистика"])
        {
            DTSTotalStatsViewController *totalStatsViewController = [DTSTotalStatsViewController new];
            [self.parentViewController.navigationController pushViewController:totalStatsViewController animated:YES];
        }
        else if ([sectionName isEqualToString:@"Последний матч"])
        {
            DTSLastMatchViewController *lastMatchViewController = [DTSLastMatchViewController new];
            [self.parentViewController.navigationController pushViewController:lastMatchViewController animated:YES];
        }
    }
    else
    {
        [self infrormationIsntFind];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}

@end
