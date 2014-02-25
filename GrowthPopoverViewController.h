//
//  GrowthPopoverViewController.h
//  immunization
//
//  Created by Test on 11/5/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddGrowthPopoverViewController.h"

@protocol PopViewControllerDelegate;    // Declare a protocol name

@interface GrowthPopoverViewController : UIViewController

//Child Information
@property (strong, nonatomic)NSString *cID;

//Button Action
- (IBAction)overallClick:(id)sender;
- (IBAction)heightClick:(id)sender;
- (IBAction)weightClick:(id)sender;
- (IBAction)headSizeClick:(id)sender;


// Declare a property for the delegate
@property (weak) id <PopViewControllerDelegate> delegate;

// Properties for accessing the popover and its viewcontroller
@property (strong, nonatomic) UIStoryboardPopoverSegue *currentPopoverSegue;
@property (strong, nonatomic) AddGrowthPopoverViewController *pvc;


@end

// Protocol Header
@protocol PopViewControllerDelegate <NSObject>
@required
- (void)dismissGrowthPop:(NSString *)value;

@end
