//
//  EditPersonalInfoVC.h
//  Immunization
//
//  Created by trex on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditPersonalInfoVC : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cIDTF;
@property (weak, nonatomic) IBOutlet UITextField *fNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lNameTF;
@property (weak, nonatomic) IBOutlet UITextField *mNameTF;
@property (weak, nonatomic) IBOutlet UITextField *DOBTF;
@property (weak, nonatomic) IBOutlet UITextField *placeTF;
@property (weak, nonatomic) IBOutlet UITextField *allergiesTF;
@property (weak, nonatomic) IBOutlet UITextField *motherTF;
@property (weak, nonatomic) IBOutlet UITextField *fatherTF;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *stateTF;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *eContactTF;
@property (weak, nonatomic) IBOutlet UITextField *ePhoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pIDTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSeg;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSString *cID;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSMutableArray *childInfo;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic)NSString *stringPhysicianID;

- (IBAction)actionButtonCancelChanges:(id)sender;
- (IBAction)actionButtonConfirmChanges:(id)sender;
- (IBAction)genderBtn:(id)sender;

@end
