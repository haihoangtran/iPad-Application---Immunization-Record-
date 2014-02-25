//
//  AddGrowthPopoverViewController.h
//  immunization
//
//  Created by Test on 11/5/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopViewControllerDelegate1;    // Declare a protocol name

@interface AddGrowthPopoverViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property(nonatomic, strong)NSString *cID;

@property (weak, nonatomic) IBOutlet UITextField *heightTF;
@property (weak, nonatomic) IBOutlet UITextField *weightTF;
@property (weak, nonatomic) IBOutlet UITextField *headTF;

- (IBAction)addBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *agePicker;
@property(strong, nonatomic)NSString *age;
@property(strong, nonatomic)NSArray *ageArray;


// Declare a property for the delegate
@property (weak) id <PopViewControllerDelegate1> delegate;

@end

// Protocol Header
@protocol PopViewControllerDelegate1 <NSObject>
@required
- (void)dismissAddGrowthPop:(NSString *)value;

@end