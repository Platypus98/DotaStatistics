//
//  SettingsViewController.m
//  DotaStatistics
//
//  Created by Ilya on 17/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSSettingsViewController.h"


@interface DTSSettingsViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *steamIdLabel;
@property (nonatomic, strong) UITextField *steamIdTextField;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UILabel *infoSaveLabel;

@end


@implementation DTSSettingsViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _steamIdLabel = [UILabel new];
        _steamIdTextField = [UITextField new];
        _saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _infoSaveLabel = [UILabel new];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:27.0f/255.0f green:28.0f/255.0f blue:32.0f/255.0f alpha:1];
    [self setupNavigationBar];
    [self setupSteamIdLabel];
    [self setupSteamIdTextField];
    [self setupSaveButton];
    [self setupInfoSaveLabel];
    [self setupTapGesture];
}

- (void)setupNavigationBar
{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"Настройки";
}

- (void)setupSteamIdLabel
{
    [self.steamIdLabel setText:@"Steam32 ID:"];
    [self.steamIdLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    self.steamIdLabel.textColor = UIColor.whiteColor;
    self.steamIdLabel.frame = CGRectMake(20, UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + self.navigationController.navigationBar.frame.size.height + 40, 100, 20);
    [self.view addSubview:self.steamIdLabel];
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
    [self.saveButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-(self.tabBarController.tabBar.frame.size.height + 15)].active = YES;
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
    self.infoSaveLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.infoSaveLabel];
}

- (void)setupTapGesture
{
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.steamIdTextField setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"Steam32Id"]];
}

- (void)saveInformation
{
    NSString *steam32IdValue = self.steamIdTextField.text;
    if (steam32IdValue.length == 9)
    {
        [[NSUserDefaults standardUserDefaults] setValue:steam32IdValue forKey:@"Steam32Id"];
        [self.infoSaveLabel setText:@"Информация сохранена"];
        self.infoSaveLabel.backgroundColor = [UIColor colorWithRed:48.0f/255.0f green:209.0f/255.0f blue:88.0f/255.0f alpha:1];
        self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 10, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 0);
        
        [UILabel animateWithDuration:0.5 animations:^{
            self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 5, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 30);
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                self.infoSaveLabel.frame = CGRectMake(10, self.saveButton.frame.origin.y + 10, self.view.frame.size.width - (10 + self.saveButton.frame.size.width + 30 + 20), 0);
            }];
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
