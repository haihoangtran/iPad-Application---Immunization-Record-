//
//  AddChildVC.h
//  Immunization
//
//  Created by trex on 10/16/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddChildVC : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cIDTF;
@property (weak, nonatomic) IBOutlet UITextField *lNameTF;
@property (weak, nonatomic) IBOutlet UITextField *mNameTF;
@property (weak, nonatomic) IBOutlet UITextField *fNameTF;
@property (weak, nonatomic) IBOutlet UITextField *DOBTF;
@property (weak, nonatomic) IBOutlet UITextField *placeTF;
@property (weak, nonatomic) IBOutlet UITextField *motherTF;
@property (weak, nonatomic) IBOutlet UITextField *fatherTF;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *stateTF;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *eContactTF;
@property (weak, nonatomic) IBOutlet UITextField *ePhoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pIDTF;
@property (weak, nonatomic) IBOutlet UITextField *allergieTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSeg;

@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *stringPhysicianID;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)actionButtonEnter:(id)sender;
- (IBAction)actionButtonLogout:(id)sender;
- (IBAction)genderBtn:(id)sender;
- (IBAction)actionButtonCancel:(id)sender;

@end
