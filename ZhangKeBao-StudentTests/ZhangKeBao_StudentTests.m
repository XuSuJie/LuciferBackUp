//
//  ZhangKeBao_StudentTests.m
//  ZhangKeBao-StudentTests
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ZhangKeBao_StudentTests : XCTestCase

@end

@implementation ZhangKeBao_StudentTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    //添加遮盖屏
    //    _coverwindow=[[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)];
    //    _coverwindow.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    //    _coverwindow.windowLevel=UIWindowLevelNormal;
    //    _coverwindow.hidden=YES;
    //    [[UIApplication sharedApplication].keyWindow addSubview:_coverwindow];
    //[[UIApplication sharedApplication].keyWindow addSubview:_leftViewController.view];

//    - (NSURLSessionDataTask *)POST:(NSString *)URLString
//parameters:(id)parameters
//success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
//failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
//    {
//        return [self POST:URLString parameters:parameters progress:nil success:success failure:failure];
//    }
//    
//    - (NSURLSessionDataTask *)POST:(NSString *)URLString
//parameters:(id)parameters
//progress:(void (^)(NSProgress * _Nonnull))uploadProgress
//success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
//failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
//    {
//        NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"POST" URLString:URLString parameters:parameters uploadProgress:uploadProgress downloadProgress:nil success:success failure:failure];
//        
//        [dataTask resume];
//        
//        return dataTask;
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        //    dispatch_queue_t queue =dispatch_queue_create("getCode", DISPATCH_QUEUE_SERIAL);
        //    //1和2同时进行，1结束后2切换成3
        //    dispatch_async(queue, ^{
        //        //网络请求部分1
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //           //UI部分2
        //        });
        //        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //           //网络请求结束后刷新UI3
        //        });
        //    });
    }
    -(void)test{
        //        LGAlertView *alertView = [[LGAlertView alloc] initWithActivityIndicatorAndTitle:@"Loading"
        //                                                                                message:@"Waiting please"
        //                                                                                  style:LGAlertViewStyleAlert
        //                                                                      progressLabelText:@"Connecting to server..."
        //                                                                           buttonTitles:nil
        //                                                                      cancelButtonTitle:nil
        //                                                                 destructiveButtonTitle:nil
        //                                                                               delegate:self];
        //        [alertView showAnimated:YES completionHandler:nil];
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
        //            if (alertView && alertView.isShowing) {
        //                alertView.progressLabelText = @"Done, will be closed after 3...";
        //
        //                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
        //                    alertView.progressLabelText = @"Done, will be closed after 2...";
        //
        //                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
        //                        alertView.progressLabelText = @"Done, will be closed after 1...";
        //
        //                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void) {
        //                            if (alertView && alertView.isShowing) {
        //                                [alertView dismissAnimated:YES completionHandler:nil];
        //                            }
        //                        });
        //                    });
        //                });
        //            }
        //        });
        //原生版
        //        UIAlertController* alert=[UIAlertController alertControllerWithTitle:nil message:@"验证码获取中" preferredStyle:UIAlertControllerStyleAlert];
        //       //
        //        [alert.view setBackgroundColor:[UIColor grayColor]];
        //        [alert.view setFrame:CGRectMake(SCREEN_SIZE.width/2-75, (SCREEN_SIZE.height-49)/2-50, 150, 100)];
        //        [self presentViewController:alert animated:true completion:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
