//
//  AppDelegate.m
//  testLocationManager
//
//  Created by 朱红轻飞溅 on 14/12/1.
//  Copyright (c) 2014年 zw. All rights reserved.
//

#import "AppDelegate.h"
#import "SoapHelper.h"
#import "AppConfigure.h"

static long steps = 0;
static int stepsk = 0;
int i;

@interface AppDelegate ()<CLLocationManagerDelegate,WebServiceDelegate>
@property (nonatomic, strong) CLLocationManager *myLocationManager;// 定位管理
@property (nonatomic, unsafe_unretained, getter=isExecutingInBackground) BOOL executingInBackground;// 判断程序是否在后台

@property (strong, nonatomic) CADisplayLink *gameTimer;


@property (nonatomic, strong) NSArray * locationArr;
@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *lng;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    helper = [[WebServices alloc] initWithDelegate:self];
    
    // 定位管理
    self.myLocationManager = [[CLLocationManager alloc] init];// 初始化
    [self.myLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];// 设置精度值
    [self.myLocationManager setDelegate:self];// 设置代理

//    [_myLocationManager requestAlwaysAuthorization];
    [self.myLocationManager startUpdatingLocation];
    
    // 判斷是否 iOS 8
    if([self.myLocationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        
        [self.myLocationManager requestAlwaysAuthorization]; // 永久授权
        
        [self.myLocationManager requestWhenInUseAuthorization]; //使用中授权
    }
    [self.myLocationManager startUpdatingLocation];
    
    
    
    // 实例化时钟
    self.gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step:)];
    // 将时钟添加到主运行循环
    [self.gameTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    // 当程序退到后台时，进行定位的重新计算
    self.executingInBackground = YES;
    [self.myLocationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];

    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // 程序进入前台，转化为高精确定位
    self.executingInBackground = NO;
    [self.myLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 判断是否在后台

// 判断是否在后台
- (BOOL) isExecutingInBackground{
    return _executingInBackground;
}


#pragma mark - CLLocationManagerDelegate

// 定位成功时，调用该方法-iOS 5 或者之前版本
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    if ([self isExecutingInBackground]){
        
        NSLog(@"--------manager:%@----------newLocation:%@",manager,newLocation);
        

        // 在后台
    } else {
        
        NSLog(@"--------manager:%@----------newLocation:%@",manager,newLocation);
        

        // 在前台
    }
    NSString *locationData = [NSString stringWithFormat:@"%.6f, %.6f",newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    [self saveCurrentData:locationData];
}

// 定位成功时，调用该方法-iOS 6.0
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    
    
    if ([self isExecutingInBackground]){
        
        NSLog(@"--------manager:%@----------locations:%@",manager,locations);

        
        // 在后台
    } else {
        NSLog(@"--------manager:%@----------locations:%@",manager,locations);
        

        
        // 在前台
    }

    for (CLLocation *location in locations) {
        NSLog(@"----%.6f----%.6f",location.coordinate.latitude, location.coordinate.longitude);
        self.lat = [NSString stringWithFormat:@"%.6f",location.coordinate.latitude];
        self.lng = [NSString stringWithFormat:@"%.6f",location.coordinate.longitude];
    }
    
    _locationArr = [NSArray arrayWithArray:locations];
    
    
    
//    [self step:locations];
}

- (void)step:(NSArray *)locations
{
    steps++;
    NSLog(@"----%ld",steps);
    if (steps % 6000 == 0) {

        
        NSLog(@"----******************************************************\n----******************************************************\n----******************************************************\n----******************************************************\n");
        NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(addUserLocation) object:nil];
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:op1];
        
        NSLog(@"\n\n-----%lu-----%@---%@-----%@=======",(unsigned long)queue.operationCount, queue.operations, queue.name, [NSThread currentThread]);

    }
}


- (void)opAction{
    
//    [self saveCurrentData:_locationArr];
    
}


- (void)saveCurrentData:(NSArray *)newData {
    
    
    //#2
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *savedData = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"kLocationData"]];
    
    for (CLLocation *location in newData) {
        
        NSLog(@"----%.6f----%.6f",location.coordinate.latitude, location.coordinate.longitude);

//        NSDictionary *dict = @{@"latitude" : [NSNumber numberWithFloat:location.coordinate.latitude], @"longitude" : [NSNumber numberWithFloat:location.coordinate.longitude ]};
        
        NSDictionary *dict = @{@"latitude" : [NSString stringWithFormat:@"%f",location.coordinate.latitude], @"longitude" : [NSString stringWithFormat:@"%f",location.coordinate.longitude ]};
        
        [savedData addObject:dict];
    }
    
    [defaults setObject:savedData forKey:@"kLocationData"];
    //    [savedData release];
}

// 当定位失败后，执行该方法
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"无法获得定位信息");
    
}

- (void)addUserLocation
{
    
    NSMutableArray *arr=[NSMutableArray array];
    [arr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"5ab398cb-56d0-4793-9146-6e15e8d544f7",@"u_Id", nil]];
    [arr addObject:[NSDictionary dictionaryWithObjectsAndKeys:self.lat,@"lat", nil]];
    [arr addObject:[NSDictionary dictionaryWithObjectsAndKeys:self.lng,@"lng", nil]];
    
    
    NSString *soapMsg = [SoapHelper arrayToDefaultSoapMessage:arr methodName:AddLocationMethodName];
    //执行同步并取得结果
    NSString *json = [helper syncServiceUrl:LocationWebServiceUrl nameSpace:defaultWebServiceNameSpace methodName:AddLocationMethodName soapMessage:soapMsg];
    
    
    if(![json isEqualToString:@""])
    {
        i++;
        NSLog(@"%@===========>>>>>>>>>>>>>>%d=============>>>>>>>>>>>>>%@========%@",json,i, self.lat
              ,self.lng );
    }
    else
    {
        NSLog(@"网络异常！");
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请求失败，请重试" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
        [alertView show];
    }
    
}


@end
