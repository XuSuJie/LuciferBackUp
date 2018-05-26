//
//  Database.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/26.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface Database : NSObject
{
    sqlite3* sqlite;
}
@end
