//
//  main.m
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
        NSString *targetPath = [libraryPath stringByAppendingPathComponent:@"Team8DB.sqlite"];
        NSError *error = nil;
        if (![[NSFileManager defaultManager] fileExistsAtPath:targetPath])
        {
            NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"Team8DB" ofType:@"sqlite"];
            if (![[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:targetPath error:&error]) {
                NSLog(@"Error: %@", error);
            }
        }
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
