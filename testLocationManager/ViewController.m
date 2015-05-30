//
//  ViewController.m
//  testLocationManager
//
//  Created by 朱红轻飞溅 on 14/12/1.
//  Copyright (c) 2014年 zw. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "AppDelegate.h"
@interface ViewController ()<CLLocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;//or whatever class you have for managing location
//    [locationManager startUpdatingLocation];
//    
//    //响应后台
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

////吏新定位
//- (void)locationManager:(CLLocationManager *)manager
//    didUpdateToLocation:(CLLocation *)newLocation
//           fromLocation:(CLLocation *)oldLocation
//{
//    
//    
//    
//    NSLog(@"--------newLocation:%@----------oldLocation:%@",newLocation,oldLocation);
//    
//    
//    NSDate *newLocationTimestamp = newLocation.timestamp;
//    NSDate *lastLocationUpdateTiemstamp;
//    
//    int locationUpdateInterval = 3;//5 mins
//    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    if (userDefaults) {
//        
//        lastLocationUpdateTiemstamp = [userDefaults objectForKey:@"kkk"];
//        
//        if (!([newLocationTimestamp timeIntervalSinceDate:lastLocationUpdateTiemstamp] < locationUpdateInterval)) {
//            //NSLog(@"New Location: %@", newLocation);
//            [(AppDelegate*)[UIApplication sharedApplication].delegate didUpdateToLocation:newLocation];
//            [userDefaults setObject:newLocationTimestamp forKey:@"kkk"];
//        }
//    }
//}
//
//
//
//-(void)applicationDidEnterBackground:(NSNotificationCenter *)notication{
//    
//    
//    
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
