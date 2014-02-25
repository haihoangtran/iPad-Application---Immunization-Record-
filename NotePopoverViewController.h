//
//  NotePopoverViewController.h
//  immunization
//
//  Created by ubicomp11 on 10/29/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PopViewControllerDelegate;    // Declare a protocol name


@interface NotePopoverViewController : UIViewController
@property (strong, nonatomic)NSString *edit;
@property (strong, nonatomic)NSString *cID;
@property(strong, nonatomic)NSString *ageRange;

@property (weak, nonatomic) IBOutlet UITextView *noteTF;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
- (IBAction)doneClick:(id)sender;

// Declare a property for the delegate
@property (weak) id <PopViewControllerDelegate> delegate;

@end

// Protocol Header
@protocol PopViewControllerDelegate <NSObject>
@required
- (void)dismissNotePop:(NSString *)value;

@end