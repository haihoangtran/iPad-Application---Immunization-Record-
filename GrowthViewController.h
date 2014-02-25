//
//  GrowthViewController.h
//  immunization
//
//  Created by Test on 11/5/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrowthPopoverViewController.h"
#import "DrawLine.h"

@interface GrowthViewController : UIViewController <PopViewControllerDelegate, UIPopoverControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *chartBackGround;

//Draw Line
@property(strong, nonatomic)DrawLine *lineView;
-(void)DrawLine;

//Child Information
@property (strong, nonatomic) NSString *cID;
@property (strong, nonatomic)NSString *childName;
@property (strong, nonatomic)NSString *pID;
@property (strong, nonatomic)NSString *dob;
@property bool physician;

//Label for CHild INformation
@property (weak, nonatomic) IBOutlet UILabel *childNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DOBLabel;
@property (weak, nonatomic) IBOutlet UILabel *childIDLabel;

//Bar Button
- (IBAction)homeButtonClick:(id)sender;
- (IBAction)childButtonClick:(id)sender;
- (IBAction)recordButtonClick:(id)sender;
- (IBAction)growthButtonClick:(id)sender;
- (IBAction)logoutButtonClick:(id)sender;

//Growth tab
@property(strong, nonatomic)NSString *tabNumber;

// Properties for accessing the popover and its viewcontroller
@property (strong, nonatomic) UIStoryboardPopoverSegue *currentPopoverSegue;
@property (strong, nonatomic) GrowthPopoverViewController *pvc;

//Array data from Database
@property(strong, nonatomic)NSMutableArray *result;
@property(strong, nonatomic)NSMutableArray *heightData;
@property(strong, nonatomic)NSMutableArray *weightData;
@property(strong, nonatomic)NSMutableArray *headSizeData;
@property(strong, nonatomic)NSMutableArray *age;
@property (strong, nonatomic) NSMutableArray *ageRange;

//label
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *headSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label14;
@property (weak, nonatomic) IBOutlet UILabel *label15;
@property (weak, nonatomic) IBOutlet UILabel *label16;
@property (weak, nonatomic) IBOutlet UILabel *label17;
@property (weak, nonatomic) IBOutlet UILabel *label18;
@property (weak, nonatomic) IBOutlet UILabel *label19;
@property (weak, nonatomic) IBOutlet UILabel *label20;
@property (weak, nonatomic) IBOutlet UILabel *label21;
@property(strong, nonatomic)NSMutableArray *labelArray1;
@property(strong, nonatomic)NSMutableArray *labelArray2;
@property(strong, nonatomic)NSMutableArray *labelArray3;

-(void)clearTextInLabel;
-(void)displayDataForOverallLabel;
-(void)displayDataForHeight;
-(void)displayDataForWeight;
-(void)displayDataForHeadSize;
-(void)displayData;






@end
