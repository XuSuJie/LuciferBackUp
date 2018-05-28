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
+(Database*)defaultDB;
-(BOOL)openDB:(NSString*)sqlName;
-(BOOL)closeDB;
-(BOOL)createTableWithColumnsType:(NSString*)columns tableName:(NSString*)tableName;
-(BOOL)createColumn:(NSString*)column tableName:(NSString*)tableName;
-(BOOL)insertSQLWithColumnName:(NSString *)columnName columnValue:(NSString *)columnValue tableName:(NSString *)tableName;
-(BOOL)insertSQLWithQuestion:(NSString*)question Trueanswer:(NSString*)trueanswer
                    UserAnswer:(NSString*)userAnswer Array:(NSArray*)array;
-(BOOL)deleteSQLWithWhere:(NSString*)where tableName:(NSString*)tableName;
-(BOOL)updateSQLWithColumnValue:(NSString*)columnvalue where:(NSString*)where tableName:(NSString*)tablename;
-(sqlite3_stmt*)selectSQLWithColumns:(NSString*)columns where:(NSString*)where limit:(int)limit tableName:(NSString*)tableName;
@end
