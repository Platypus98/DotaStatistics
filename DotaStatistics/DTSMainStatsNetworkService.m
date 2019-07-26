//
//  DTSMainStatsNetworkService.m
//  DotaStatistics
//
//  Created by Ilya on 18/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "DTSMainStatsNetworkService.h"
#import "DTSMainStatsViewController.h"
#import "NetworkHelper.h"


@implementation DTSMainStatsNetworkService

- (void)getGeneralUserInfromationWithSteam32Id:(NSString *)steam32Id
{
    NSString *urlString = [NetworkHelper URLForGeneralUserInformationWithSteam32Id:steam32Id];
        
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
        
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        dispatch_queue_t serialQueue = dispatch_queue_create("serial queue", nil);
        
        if (data != nil)
        {
            NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSDictionary *profileInfo = [temp valueForKey:@"profile"];
            
            NSString *personalName = [profileInfo valueForKey:@"personaname"];
            
            if (personalName == nil)
            {
                [self.DTSMainStatsViewConstrollerDelegate infrormationIsntFind];
            }
            else
            {
                NSString *estimateMMR = [temp valueForKeyPath:@"mmr_estimate.estimate"];
                NSString *urlForUserImage = [profileInfo valueForKey:@"avatarfull"];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.DTSMainStatsViewConstrollerDelegate setGeneralUserInformationWithPersonalName:personalName estimateMMR:estimateMMR];
                });
                
                dispatch_async(serialQueue, ^{
                    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlForUserImage]];
                    UIImage *image = [[UIImage alloc] initWithData:imageData];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.DTSMainStatsViewConstrollerDelegate setUserImage:image];
                    });
                });
            }
        }
        else
        {
            [self.DTSMainStatsViewConstrollerDelegate checkInternetConnection];
        }
    }];
    [sessionDataTask resume];
}

- (void)getWinAndLosesWithSteam32Id:(NSString *)steam32Id
{
    NSString *urlString = [NetworkHelper URLForWinsAndLosesWithSteam32Id:steam32Id];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        if (data != nil)
        {
            NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            NSNumber *wins = [temp valueForKey:@"win"];
            NSNumber *loses = [temp valueForKey:@"lose"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.DTSMainStatsViewConstrollerDelegate setWins:wins loses:loses];
            });
        }
        else
        {
            [self.DTSMainStatsViewConstrollerDelegate checkInternetConnection];
        }
    }];
    [sessionDataTask resume];
}


@end
