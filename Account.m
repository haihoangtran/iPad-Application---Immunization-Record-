//
//  Account.m
//  TestDatabase
//
//  Created by Test on 10/18/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import "Account.h"
#import <sqlite3.h>
#import "ConnectionDB.h"

@implementation Account

+(NSMutableArray *) logIn:(NSString *)username password:(NSString *)password
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Create From DB
    NSMutableArray *info = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT firstName, lastName, clinic, pID FROM Physicians P WHERE P.username = '%@' and P.password = '%@'", username, password];
    
    sqlite3_stmt *sqlStatement;
    if (sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while(sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            for (int i = 0; i < 4; ++i)
            {
                [info addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    return info;
}
@end
