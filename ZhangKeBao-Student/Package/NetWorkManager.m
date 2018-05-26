//
//  AfnRequestDemo.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/11.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "NetWorkManager.h"
@implementation NetWorkManager
+(NetWorkManager*)sharedManager{
    NetWorkManager* manager=[NetWorkManager manager];
    //最大请求并发任务数
    manager.operationQueue.maxConcurrentOperationCount = 1;
    // 上传普通格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 3.0;//设置请求超时时间
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    // 设置请求头
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 设置接收的Content-Type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    //返回格式 JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //设置返回C的ontent-type
    manager.responseSerializer.acceptableContentTypes=[[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    return manager;
}
@end
