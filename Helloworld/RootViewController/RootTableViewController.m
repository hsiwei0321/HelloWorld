//
//  RootTableViewController.m
//  Helloworld
//
//  Created by zhiyunyu on 2018/2/3.
//  Copyright © 2018年 zhiyunyu. All rights reserved.
//

#import "RootTableViewController.h"
#import "NewsListTableViewController.h"
#import "LearnAVFundationViewController.h"
#import "GetAlbumPictureViewController.h"
#import "YunPopViewController.h"
#import "WKWebViewViewController.h"
#import "AFNetworkingViewController.h"
#import "DownLoadImageViewController.h"
#import "MultiThreadViewController.h"
#import "AppOpenURLViewController.h"
#import "NotificationViewController.h"
#import "LottieViewController.h"
#import "YunSDWebImageViewController.h"
#import "YunDrawRectViewController.h"
//#import <AspectsV1.4.2/Aspects.h>
#import <Aspects.h>
#import "YunMethodSwizzlingViewController.h"
#import "TestBridgeViewController.h"
#import "YunTestViewController.h"
#import "YUNWechatLoginViewController.h"
#import "YUNHashViewController.h"
#import "ThreadSafetyViewController.h"
#import "BackgroundTaskViewController.h"
#import "StrongWeakBlcokViewController.h"
#import "YUNRunloopViewController.h"
#import "FLAnimatedViewController.h"
#import "ContentOfLayerViewController.h"
#import "YUNGestureViewController.h"

@interface RootTableViewController ()

@property(nonatomic, strong) NSMutableArray *array;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    }) ;
    NSLog(@"3");
    
    // 去除多余cell分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.array = [NSMutableArray array];
    [self.array addObjectsFromArray:@[@"下拉刷新", @"学习AVFundation", @"获取相册中的图片", @"弹出自定义窗口", @"WKWebView",
                                      @"AFNetworking", @"NSURLSession下载图片", @"多线程", @"应用间跳转", @"push通知",
                                      @"lottie动画", @"SDWebImage", @"DrawRect", @"Method Swizzling", @"JSBridge", @"零碎test代码合集", @"微信SDK",
                                      @"关于hash函数", @"线程安全", @"BackgroundTaskViewController", @"StrongWeakBlcokViewController",
                                      @"YUNRunloopViewController", @"FLAnimatedViewController", @"ContentOfLayerViewController",
                                      @"YUNGestureViewController"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *nextPage = nil;
    switch (indexPath.row) {
        case 0:
            nextPage = [[NewsListTableViewController alloc] init];
            break;
        case 1:
            nextPage= [[LearnAVFundationViewController alloc] init];
            break;
        case 2:
            
            nextPage = [[GetAlbumPictureViewController alloc] init];
            [nextPage aspect_hookSelector:@selector(avatarDidTapped:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
                NSLog(@"%@: %@", [aspectInfo.instance class], aspectInfo.arguments);
            } error:nil];
            break;
        case 3:
            nextPage = [[YunPopViewController alloc] init];
            break;
        case 4:
            nextPage = [[WKWebViewViewController alloc] init];
            break;
        case 5:
            nextPage = [[AFNetworkingViewController alloc] init];
            break;
        case 6:
            nextPage = [[DownLoadImageViewController alloc] init];
            break;
        case 7:
            nextPage = [[MultiThreadViewController alloc] init];
            break;
        case 8:
            nextPage = [[AppOpenURLViewController alloc] init];
            break;
        case 9:
            nextPage = [[NotificationViewController alloc] init];
            break;
        case 10:
            nextPage = [[LottieViewController alloc] init];
            break;
        case 11:
            nextPage = [[YunSDWebImageViewController alloc] init];
            break;
        case 12:
            nextPage = [[YunDrawRectViewController alloc] init];
            break;
        case 13:
            nextPage = [[YunMethodSwizzlingViewController alloc] init];
            break;
        case 14:
            nextPage = [[TestBridgeViewController alloc] init];
            break;
        case 15:
            nextPage = [[YunTestViewController alloc] init];
            break;
        case 16:
            nextPage = [[YUNWechatLoginViewController alloc] init];
            break;
        case 17:
            nextPage = [[YUNHashViewController alloc] init];
            break;
        case 18:
            nextPage = [[ThreadSafetyViewController alloc] init];
            break;
        case 19:
            nextPage = [[BackgroundTaskViewController alloc] init];
            break;
        case 20:
            nextPage = [[StrongWeakBlcokViewController alloc] init];
            break;
        case 21:
            nextPage = [[YUNRunloopViewController alloc] init];
            break;
        case 22:
            nextPage = [[FLAnimatedViewController alloc] init];
            break;
        case 23:
            nextPage = [[ContentOfLayerViewController alloc] init];
            break;
        case 24:
            nextPage = [[YUNGestureViewController alloc] init];
            break;
            
        default:
            break;
    }
    if (nextPage != nil) {
        [self.navigationController pushViewController:nextPage animated:YES];
    }
}

@end
