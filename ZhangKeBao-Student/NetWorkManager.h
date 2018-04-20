//
//  AfnRequestDemo.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/11.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <AFNetworking.h>
@interface NetWorkManager : AFHTTPSessionManager
+(NetWorkManager*)sharedManager;
@end
