//
//  ConnectionDB.h
//  TestDatabase
//
//  Created by Test on 10/18/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ConnectionDB : NSObject

+ (sqlite3 *)Connection;

@end
