//
//  DrawLine.h
//  DrawLine
//
//  Created by Test on 11/6/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawLine : UIView


@property (strong, nonatomic)NSMutableDictionary *ageDistance;
@property (strong, nonatomic)NSMutableArray *heightData;
@property (strong, nonatomic)NSMutableArray *weightData;
@property (strong, nonatomic)NSMutableArray *headSizeData;
@property (strong, nonatomic)NSMutableArray *age;

@property(strong, nonatomic)NSString *type;

@property(nonatomic)CGContextRef context;

-(void)drawLineByData:(NSMutableArray *)data andColor: (UIColor *) color;

@end
