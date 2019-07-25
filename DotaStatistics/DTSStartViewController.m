//
//  ViewController.m
//  DotaStatistics
//
//  Created by Ilya on 05/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSStartViewController.h"
#import "DTSMainStatsViewController.h"


@interface DTSStartViewController ()

@property (nonatomic, strong) UILabel *welcomeTitleLabel;
@property (nonatomic, strong) UILabel *welcomeMessageLabel;

@property (nonatomic, strong) UILabel *steamIdLabel;
@property (nonatomic, strong) UITextField *steamIdTextField;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UILabel *infoSaveLabel;
@property (nonatomic, strong) UILabel *exampleLabel;

@end


@implementation DTSStartViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _welcomeTitleLabel = [UILabel new];
        _welcomeMessageLabel = [UILabel new];
        
        _steamIdLabel = [UILabel new];
        _steamIdTextField = [UITextField new];
        _saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _infoSaveLabel = [UILabel new];
        _exampleLabel = [UILabel new];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:27.0f/255.0f green:28.0f/255.0f blue:32.0f/255.0f alpha:1];
    [self setupWelcomeTitleLabel];
    [self setupWelcomeMessageLabel];
    [self setupSteamIdLabel];
    [self setupSteamIdTextField];
    [self setupSaveButton];
    [self setupInfoSaveLabel];
    [self setupExampleLabel];
    [self setupTapGesture];

}
     
- (void)setupWelcomeTitleLabel
{
    [self.welcomeTitleLabel setText:@"Добро пожаловать в Dota Statistics!"];
    self.welcomeTitleLabel.textColor = UIColor.whiteColor;
    self.welcomeTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.welcomeTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.welcomeTitleLabel.numberOfLines = 0;
    [self.welcomeTitleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:25]];
    [self.view addSubview:self.welcomeTitleLabel];
    [self.welcomeTitleLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + 20].active = YES;
    [self.welcomeTitleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.welcomeTitleLabel.widthAnchor constraintEqualToConstant:self.view.frame.size.width/2].active = YES;
    [self.welcomeTitleLabel.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)setupWelcomeMessageLabel
{
    [self.welcomeMessageLabel setText:@"В этом приложениие можно посмотреть свою общую статистику и статистику по последнему матчу. Также доступны все базовые показатели героев. \n \n В будущем планируется добавить описание способностей каждого героя, статистику по нескольким последним матчам и много всего интересного! 😋 \n \n Чтобы начать пользоваться приложением необходимо указать свой Steam32 ID. \n Узнать его можно на странице: \n https://steamid.xyz."];
    self.welcomeMessageLabel.textColor = UIColor.whiteColor;
    self.welcomeMessageLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeMessageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.welcomeMessageLabel.adjustsFontSizeToFitWidth = YES;
    self.welcomeMessageLabel.numberOfLines = 0;
    [self.welcomeMessageLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:17]];
    [self.view addSubview:self.welcomeMessageLabel];
    [self.welcomeMessageLabel.topAnchor constraintEqualToAnchor:self.welcomeTitleLabel.bottomAnchor constant:20].active = YES;
    [self.welcomeMessageLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = YES;
    [self.welcomeMessageLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    [self.welcomeMessageLabel.heightAnchor constraintEqualToConstant:270].active = YES;
}

- (void)setupSteamIdLabel
{
    [self.steamIdLabel setText:@"Steam32 ID:"];
    [self.steamIdLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    self.steamIdLabel.textColor = UIColor.whiteColor;
    self.steamIdLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.steamIdLabel];
    [self.steamIdLabel.topAnchor constraintEqualToAnchor:self.welcomeMessageLabel.bottomAnchor constant:40].active = YES;
    [self.steamIdLabel.leftAnchor constraintEqualToAnchor:self.welcomeMessageLabel.leftAnchor].active = YES;
    [self.steamIdLabel.widthAnchor constraintEqualToConstant:100].active = YES;
    [self.steamIdLabel.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)setupSteamIdTextField
{
    self.steamIdTextField.textColor = UIColor.whiteColor;
    self.steamIdTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.steamIdTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.steamIdTextField];
    [self.steamIdTextField.topAnchor constraintEqualToAnchor:self.steamIdLabel.topAnchor].active = YES;
    [self.steamIdTextField.leftAnchor constraintEqualToAnchor:self.steamIdLabel.rightAnchor constant:10].active = YES;
    [self.steamIdTextField.widthAnchor constraintEqualToConstant:200].active = YES;
    [self.steamIdTextField.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UIView *steamIdTextFieldBottomBorder = [self createBottomBorderWithViewFrame:self.steamIdTextField.frame width:1];
    [self.steamIdTextField addSubview:steamIdTextFieldBottomBorder];
}

- (void)setupSaveButton
{
    self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.saveButton.backgroundColor = [UIColor colorWithRed:10.0f/255.0f green:132.0f/255.0f blue:255.0f/255.0f alpha:1];
    self.saveButton.layer.cornerRadius = 10;
    self.saveButton.layer.masksToBounds = YES;
    self.saveButton.tintColor = UIColor.whiteColor;
    [self.saveButton addTarget:self action:@selector(saveInformation) forControlEvents:UIControlEventTouchUpInside];
    [self.saveButton setTitle:@"Сохранить" forState:UIControlStateNormal];
    [self.view addSubview:self.saveButton];
    [self.saveButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30].active = YES;
    [self.saveButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30].active = YES;
    [self.saveButton.widthAnchor constraintEqualToConstant:100].active = YES;
    [self.saveButton.heightAnchor constraintEqualToConstant:40].active = YES;
}

- (void)setupInfoSaveLabel
{
    self.infoSaveLabel.textAlignment = NSTextAlignmentCenter;
    self.infoSaveLabel.numberOfLines = 0;
    self.infoSaveLabel.textColor = UIColor.whiteColor;
    self.infoSaveLabel.layer.cornerRadius = 10;
    self.infoSaveLabel.layer.masksToBounds = YES;
    [self.infoSaveLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [self.view addSubview:self.infoSaveLabel];
}

- (void)setupExampleLabel
{
    [self.exampleLabel setText:@"Пример: 103854982"];
    self.exampleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.exampleLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:self.exampleLabel];
    [self.exampleLabel.topAnchor constraintEqualToAnchor:self.steamIdLabel.bottomAnchor constant:10].active = YES;
    [self.exampleLabel.leftAnchor constraintEqualToAnchor:self.steamIdLabel.leftAnchor].active = YES;
    [self.exampleLabel.widthAnchor constraintEqualToConstant:200].active = YES;
    [self.exampleLabel.heightAnchor constraintEqualToConstant:40].active = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)setupTapGesture
{
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)saveInformation
{
    NSString *steam32IdValue = self.steamIdTextField.text;
    if (steam32IdValue.length == 9)
    {
        [[NSUserDefaults standardUserDefaults] setValue:steam32IdValue forKey:@"Steam32Id"];
        [self.infoSaveLabel setText:@"Информация сохранена"];
        [self.mainStatsViewControllerDelegate steam32IDRecived];
        self.infoSaveLabel.backgroundColor = [UIColor colorWithRed:48.0f/255.0f green:209.0f/255.0f blue:88.0f/255.0f alpha:1];
        self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 10, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 0);
        
        [UILabel animateWithDuration:0.5 animations:^{
            self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 5, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 30);
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
    else
    {
        [self.infoSaveLabel setText:@"Steam32 ID должен содержать 9 символов"];
        self.infoSaveLabel.backgroundColor = UIColor.redColor;
        self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 0);
        
        [UILabel animateWithDuration:0.5 animations:^{
            self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 5, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 40);
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 10, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 0);
            }];
        });
    }
}

- (UIView *)createBottomBorderWithViewFrame:(CGRect)viewFrame width:(NSInteger)borderWidth
{
    UIView *bottomBorder = [UIView new];
    bottomBorder.backgroundColor = UIColor.grayColor;
    [bottomBorder setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    bottomBorder.frame = CGRectMake(0, viewFrame.size.height - borderWidth, viewFrame.size.width, borderWidth);
    
    return bottomBorder;
}

- (void)dismissKeyboard
{
    [self.steamIdTextField resignFirstResponder];
}

@end
