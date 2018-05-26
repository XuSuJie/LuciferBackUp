//
//  Database.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/26.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "Database.h"
static Database* db;
@implementation Database
+(Database*)defaultDB{
    if (!db) {
        db=[[Database alloc]init];
    }
    return db;
}
//打开数据库文件，没有则自动创建
-(BOOL)openDB:(NSString*)sqlName{
    NSString* sqlPath=@"";
    int result=sqlite3_open([sqlPath UTF8String], &sqlite);
    if (result == SQLITE_OK) {
        return YES;
    }
    else
        return NO;
}
-(BOOL)closeDB{
    int result = sqlite3_close(sqlite);
    if (result == SQLITE_OK) {
        return YES;
    } else {
        return NO;
    }
}
-(BOOL)createTable:(NSString*)tableName{
    char* error;
    NSString* sql;
    sql= [NSString stringWithFormat:@"create table %@(page,type,message,create_time)",tableName];
    NSLog(@"[Create SQL]:%@",sql);
    int result=sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, &error);
    if (result == SQLITE_OK) {
        return YES;
    } else {
        NSLog(@"Create Table Fail");
        NSLog(@"error = %s",error);
        return NO;
    }
}
-(BOOL)createColumn:(NSString*)column tableName:(NSString*)tableName{
    char* error;
    NSString *sql = [NSString stringWithFormat:@"alter table %@ add %@",tableName,column];
    NSLog(@"[Create SQL] : %@",sql);
    
    int result = sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, &error);
    
    if (result == SQLITE_OK) {
        NSLog(@"[Create SQL] : OK");
        return YES;
    }else {
        NSLog(@"[Create SQL] : Fail");
        NSLog(@"error = %s",error);
        return NO;
    }
}
@end
