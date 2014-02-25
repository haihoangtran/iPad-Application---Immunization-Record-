//
//  ConnectionDB.m
//  TestDatabase
//
//  Created by Test on 10/18/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import "ConnectionDB.h"
#import <sqlite3.h>

@implementation ConnectionDB

+ (sqlite3 *) Connection
{
    
    sqlite3 *db;
    NSFileManager *fileMan = [NSFileManager defaultManager];
    NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Team8DB.sqlite"];
    //NSString *dbPath = @"/Users/errant/Desktop/slfsldfjfsd/Immunization/Team8DB.sqlite";
    BOOL success = [fileMan fileExistsAtPath:dbPath];
    if (!success)
    {
        NSLog(@"Cannot locate data file '%@'.", dbPath);
    }
    
    if((sqlite3_open([dbPath UTF8String], &db) != SQLITE_OK))
    {
        NSLog(@"An error has occur: %s", sqlite3_errmsg(db));
    }
    return db;
}

@end
