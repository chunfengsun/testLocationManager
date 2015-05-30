//
//  AppDelegate.h
//  testLocationManager
//
//  Created by 朱红轻飞溅 on 14/12/1.
//  Copyright (c) 2014年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "WebServices.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    WebServices *helper;
}

@property (strong, nonatomic) UIWindow *window;

@end

