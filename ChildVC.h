//
//  ChildViewController.h
//  Immunization
//
//  Created by Test on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *labelFullNameOnToolbar;
@property (strong, nonatomic) IBOutlet UILabel *labelDobOnToolbar;
@property (strong, nonatomic) IBOutlet UILabel *labelIdOnToolbar;

@property (weak, nonatomic) IBOutlet UILabel *cIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *cNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DOBLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *allergiesLabel;
@property (weak, nonatomic) IBOutlet UILabel *mNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *address1Label;
@property (weak, nonatomic) IBOutlet UILabel *address2Label;
@property (weak, nonatomic) IBOutlet UILabel *eContactLabel;
@property (weak, nonatomic) IBOutlet UILabel *ePhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *pNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnLabel;

@property bool physician;
@property (strong, nonatomic) NSMutableArray *result;
@property (strong, nonatomic)NSString *cID;
@property (strong, nonatomic) NSString *stringPhysicianID;

- (IBAction)actionButtonHome:(id)sender;
- (IBAction)actionButtonVaccines:(id)sender;
- (IBAction)actionButtonGrowChart:(id)sender;
- (IBAction)actionButtonLogout:(id)sender;
- (IBAction)actionButtonEditPersonalInformation:(id)sender;


@end
