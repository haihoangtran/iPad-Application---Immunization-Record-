//
//  MileStonePopoverViewController.h
//  immunization
//
//  Created by ubicomp10 on 10/29/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PopViewControllerDelegate;    // Declare a protocol name

@interface MileStonePopoverViewController : UIViewController
- (IBAction)clickBirth:(id)sender;
- (IBAction)click6Weeks:(id)sender;
- (IBAction)click10Weeks:(id)sender;
- (IBAction)click14Weeks:(id)sender;
- (IBAction)click9Months:(id)sender;
- (IBAction)click15Months:(id)sender;
- (IBAction)click2Years:(id)sender;
- (IBAction)clickAdditional:(id)sender;





// Declare a property for the delegate
@property (weak) id <PopViewControllerDelegate> delegate;

@end

// Protocol Header
@protocol PopViewControllerDelegate <NSObject>
@required
- (void)dismissPop:(NSString *)value;

@end
