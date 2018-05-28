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
    //沙盒内的document目录
    NSString* filePath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString* dbPath=[filePath stringByAppendingPathComponent:sqlName];
    int result=sqlite3_open([dbPath UTF8String], &sqlite);
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
-(BOOL)createTableWithColumnsType:(NSString*)columns tableName:(NSString*)tableName{
    char* error;
    NSString* sql;
    sql= [NSString stringWithFormat:@"create table if not exists %@(%@)",tableName,columns];
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
//values要加单引号
- (BOOL)insertSQLWithColumnName:(NSString *)columnName columnValue:(NSString *)columnValue tableName:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"insert into %@(%@) values(%@)",tableName,columnName,columnValue];
    int result = sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, nil);
    if (result == SQLITE_OK) {
        NSLog(@"[DB Insert] : OK");
        return YES;
    }
    return NO;
}
//可用版本,复用性差
-(BOOL)insertSQLWithQuestion:(NSString*)question Trueanswer:(NSString*)trueanswer
                    UserAnswer:(NSString*)userAnswer Array:(NSArray*)array{
        NSString *sql=@"insert into AbilityTestQuestion (question,trueanswer,userAnswer,tkselect) values(?,?,?,?)";
        sqlite3_stmt *stmt=nil;
        NSData* data=[NSKeyedArchiver archivedDataWithRootObject:array];
        int stat=sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, nil);
        if (stat==SQLITE_OK) {
            sqlite3_bind_text(stmt, 1, [question UTF8String], -1, NULL);
            sqlite3_bind_text(stmt, 2, [trueanswer UTF8String], -1, NULL);
            sqlite3_bind_text(stmt, 3, [userAnswer UTF8String], -1, NULL);
            sqlite3_bind_blob(stmt, 4, [data bytes], (int)[data length] , NULL);
            int result = sqlite3_step(stmt);
            if (result==SQLITE_DONE) {
                return YES;
            }
        }
        return NO;
}
//数组转换成NSData，二进制格式存储
- (BOOL)insertSQLWithColumnName:(NSString *)columnName array:(NSArray*)array tableName:(NSString *)tableName
{
    NSData* data=[NSKeyedArchiver archivedDataWithRootObject:array];
    NSString *sql = @"insert into AbilityTestQuestion(tkselect) values(?)";
    NSLog(@"[Insert SQL] : %@",sql);
    sqlite3_stmt* stmt=nil;
    int result = sqlite3_prepare_v2(sqlite,[sql UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK) {
        sqlite3_bind_blob(stmt, 1, [data bytes],(int)[data length], NULL);
        if(sqlite3_step(stmt)==SQLITE_DONE){
            const void *tkselectData = sqlite3_column_blob(stmt,1);
            int size = sqlite3_column_bytes(stmt, 1);
            NSData* data1 = [[NSData alloc]initWithBytes:tkselectData length:size];
            [NSKeyedUnarchiver unarchiveObjectWithData:data1];
            return YES;
        }
    }
    NSLog(@"[DB Insert] : Fail");
    return NO;
}
-(BOOL)deleteSQLWithWhere:(NSString*)where tableName:(NSString*)tableName {
    char* err;
    NSString* sql= [NSString stringWithFormat:@"delete from %@ where %@",tableName,where];
    int result = sqlite3_exec(sqlite,[sql UTF8String], nil, nil, &err);
    if (result == SQLITE_OK) {
        return YES;
    } else {
        NSLog(@"delete err is %s",err);
        return NO;
    }
}
//根据条件更新数据 column = '~~~'
-(BOOL)updateSQLWithColumnValue:(NSString*)columnvalue where:(NSString*)where tableName:(NSString*)tablename{
    char* err;
    NSString* sql=[NSString stringWithFormat:@"update %@ set %@ where %@",tablename,columnvalue,where];
    int result=sqlite3_exec(sqlite, [sql UTF8String], nil, nil, &err);
    if (result==SQLITE_OK) {
        return YES;
    } else {
        NSLog(@"update error : %s",err);
        return NO;
    }
}
//返回结果集
-(sqlite3_stmt*)selectSQLWithColumns:(NSString*)columns where:(NSString*)where limit:(int)limit tableName:(NSString*)tableName{
    if (where==nil) {
        where = @"where 1=1";
    }
    else
        where = [NSString stringWithFormat:@"where 1=1 and %@",where];
    NSString* limitstr=@"";
    if (limit>0) {
        limitstr=[NSString stringWithFormat:@"limit %d",limit];
    }
    NSString* sql=[NSString stringWithFormat:@"select %@ from %@ %@ %@",columns,tableName,where,limitstr];
    sqlite3_stmt* result;
    sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &result, nil);
    return result;
}
@end
