//
//  DrawLine.m
//  DrawLine
//
//  Created by Test on 11/6/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine
@synthesize ageDistance, context;
@synthesize heightData, weightData, headSizeData, age, type;

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self setBackgroundColor:[UIColor clearColor]];
        ageDistance = [[NSMutableDictionary alloc] init];
        [ageDistance addEntriesFromDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                             @"30", @"BIRTH",
                                             @"101", @"6 WEEKS",
                                             @"179", @"10 WEEKS",
                                             @"260", @"14 WEEKS",
                                             @"339", @"9-12 MONTHS",
                                             @"426", @"15-18 MONTHS",
                                             @"505", @"2-19 YEARS",
                                             nil]];

	}
	return self;
}

-(void)drawLineByData:(NSMutableArray *)data andColor: (UIColor *) color
{
    if([data count] > 0)
    {
        float dotSize = 8.0;
        context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1.5);
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        for(int i = 0; i <[data count]; ++i)
        {
            //draw circle point
            CGRect r1 = CGRectMake([[ageDistance valueForKey:[age objectAtIndex:i]] floatValue] - dotSize/2, (495 - [[data objectAtIndex:i] floatValue]*9) - dotSize/2 ,dotSize, dotSize);
            CGContextSetFillColorWithColor(context, color.CGColor);
            CGContextFillRect(context, r1);
        }
        CGContextMoveToPoint(context, [[ageDistance valueForKey:[age objectAtIndex:0]] floatValue], (495 - [[data objectAtIndex:0] floatValue]*9));
        for(int i = 1; i <[data count]; ++i)
        {
            CGContextAddLineToPoint(context, [[ageDistance valueForKey:[age objectAtIndex:i]] floatValue], (495 - [[data objectAtIndex:i] floatValue]*9));
        }
    
        CGContextStrokePath(context);
    }
}

- (void)drawRect:(CGRect)rect {
    //NSLog(@"Height: %@", heightData);
    //NSLog(@"Weight: %@", weightData);
    //NSLog(@"Head: %@", headSizeData);
    //NSLog(@"Age: %@", age);
    if([type isEqualToString:@"1"])
    {
        [self drawLineByData:heightData andColor:[UIColor colorWithRed:240.0f/255.0f green:67.0f/255.0f blue:33.0f/255.0f alpha:1]];
        [self drawLineByData:weightData andColor:[UIColor colorWithRed:226.0f/255.0f green:189.0f/255.0f blue:59.0f/255.0f alpha:1]];
        [self drawLineByData:headSizeData andColor:[UIColor colorWithRed:124.0f/255.0f green:87.0f/255.0f blue:154.0f/255.0f alpha:1]];
    }
    else if([type isEqualToString:@"2"])
    {
        [self drawLineByData:heightData andColor:[UIColor colorWithRed:240.0f/255.0f green:67.0f/255.0f blue:33.0f/255.0f alpha:1]];
    }
    else if([type isEqualToString:@"3"])
    {
        [self drawLineByData:weightData andColor:[UIColor colorWithRed:226.0f/255.0f green:189.0f/255.0f blue:59.0f/255.0f alpha:1]];
    }
    else if([type isEqualToString:@"4"])
    {
        [self drawLineByData:headSizeData andColor:[UIColor colorWithRed:124.0f/255.0f green:87.0f/255.0f blue:154.0f/255.0f alpha:1]];
    }

    
}

@end
