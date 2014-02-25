//
//  RecordVC.h
//  Immunization
//
//  Created by Test on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileStonePopoverViewController.h"
#import "NotePopoverViewController.h"

@interface RecordVC : UIViewController <PopViewControllerDelegate, UIPopoverControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *returnedDate;

//function
-(void)EditReturnDate;
-(void)changeTypeEditWithButton:(UIButton *)editBtn andIndex:(int)index;
-(NSString *)getVacineRecordByVaccineName:(NSString *)vaccineName andData:(NSMutableArray *)data andIndex: (int)index;
-(void)setCheckBoxByCheckButton:(UIButton *)checkBtn andData:(NSMutableArray*)data andVaccineName:(NSString *)vaccineName;
-(void)updateMileStoneByMileStone:(NSString *)mileStone andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andData:(NSMutableArray *)data;

//function for Birth
-(void)loadBirthMilestone;
-(void)enableEditForBirthMileStone;
-(void)UpdateBirthMileStone;

//function for 6 weeks
-(void)load6WeeksMilestone;
-(void)enableEditFor6WeeksMileStone;
-(void)Update6WeeksMileStone;

//function for 10 weeks
-(void)load10WeeksMilestone;
-(void)enableEditFor10WeeksMileStone;
-(void)Update10WeeksMileStone;

//function for 14 Weeks
-(void)load14WeeksMilestone;
-(void)enableEditFor14WeeksMileStone;
-(void)Update14WeeksMileStone;

//function for 9-12 months
-(void)load9MonthsMilestone;
-(void)enableEditFor9MonthsMileStone;
-(void)Update9MonthsMileStone;

//function for 15-18 months
-(void)load15MonthsMilestone;
-(void)enableEditFor15MonthsMileStone;
-(void)Update15MonthsMileStone;

//FUNCTION FOR 2-19 YEARS
-(void)load2YearsMilestone;
-(void)enableEditFor2YearsMileStone;
-(void)Update2YearsMileStone;

//function for additional vaccine
-(void)enableEditForAdditionalMileStone;
-(void)UpdateAdditionalMileStoneForEachRecordByRecordID:(NSString *)recordID andData:(NSMutableArray *)data;
-(void)UpdateAdditionalMileStone;
-(void)loadAdditionalMilestone;
-(void)setCheckBoxForAdditionalVaccine:(UIButton *)checkBtn andTaken:(NSString *)taken;



// Properties for accessing the popover and its viewcontroller
@property (strong, nonatomic) UIStoryboardPopoverSegue *currentPopoverSegue;
@property (strong, nonatomic) MileStonePopoverViewController *pvc;
@property (strong, nonatomic)NSString *milestoneTabNo;

//Properties for accessing the popover note
@property (strong, nonatomic) NotePopoverViewController *notePopoverVC;
//scrolll view
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
// label for child information
@property (strong, nonatomic) IBOutlet UILabel *labelFullNameOnToolbar;
@property (strong, nonatomic) IBOutlet UILabel *labelDobOnToolbar;
@property (strong, nonatomic) IBOutlet UILabel *labelIdOnToolbar;

//Action for tool bar button
- (IBAction)actionButtonHome:(id)sender;
- (IBAction)actionButtonChildInformation:(id)sender;
- (IBAction)actionButtonGrowChart:(id)sender;
- (IBAction)actionButtonLogout:(id)sender;

//Child information
@property bool physician;
@property (strong, nonatomic) NSString *cID;
@property (strong, nonatomic)NSString *childName;
@property (strong, nonatomic)NSString *pID;
@property (strong, nonatomic)NSString *dob;
@property (strong, nonatomic)NSMutableArray *result;

//edit boolean
@property (strong, nonatomic)NSMutableArray *edit;

//Edit Button Action for Birth
- (IBAction)editBirth:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *editBirthBtn;

//Edit Button Action for 6 weeks
- (IBAction)edit6Weeks:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *edit6WeeksBtn;

//Edit Button Action for 10 weeks
- (IBAction)edit10Weeks:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *edit10WeeksBtn;

//Edit Button Action for 14 Weeks
- (IBAction)edit14Weeks:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *edit14WeeksBtn;

//Edit Button Action for 9-12 Months
- (IBAction)edit9Months:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *edit9MonthsBtn;

//Edit Button Action for 15-18 months
- (IBAction)edit15Months:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *edit15MonthsBtn;

//Edit Button Action for 2 Years
- (IBAction)edit2Years:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *edit2YearsBtn;

//Edit Button Action for Additional Vaccine
- (IBAction)editAditional:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *editAddtitionalBtn;

//variable for Additional vaccine
@property(strong, nonatomic)NSMutableArray *recordIDAdditional;

//textfield birth

@property (weak, nonatomic) IBOutlet UITextField *clinicBirthTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinicBirthTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinicBirthTF3;

@property (weak, nonatomic) IBOutlet UITextField *physicianBirthTF1;

@property (weak, nonatomic) IBOutlet UITextField *physicianBirthTF2;
@property (weak, nonatomic) IBOutlet UITextField *physicianBirthTF3;

@property (weak, nonatomic) IBOutlet UITextField *dateBirthTF1;
@property (weak, nonatomic) IBOutlet UITextField *dateBirthTF2;
@property (weak, nonatomic) IBOutlet UITextField *dateBirthTF3;
@property (weak, nonatomic) IBOutlet UIButton *checkBirth1;
@property (weak, nonatomic) IBOutlet UIButton *checkBirth2;
@property (weak, nonatomic) IBOutlet UIButton *checkBirth3;

//textfield 6 weeks
@property (weak, nonatomic) IBOutlet UITextField *clinic6WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinic6WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinic6WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *clinic6WeeksTF4;
@property (weak, nonatomic) IBOutlet UITextField *physician6WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *physician6WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *physician6WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *physician6WeeksTF4;
@property (weak, nonatomic) IBOutlet UITextField *date6WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *date6WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *date6WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *date6WeeksTF4;
@property (weak, nonatomic) IBOutlet UIButton *check6Weeks1;
@property (weak, nonatomic) IBOutlet UIButton *check6Weeks2;
@property (weak, nonatomic) IBOutlet UIButton *check6Weeks3;
@property (weak, nonatomic) IBOutlet UIButton *check6Weeks4;

//textfield 10 weeks
@property (weak, nonatomic) IBOutlet UITextField *clinic10WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinic10WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinic10WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *clinic10WeeksTF4;
@property (weak, nonatomic) IBOutlet UITextField *physician10WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *physician10WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *physician10WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *physician10WeeksTF4;
@property (weak, nonatomic) IBOutlet UITextField *date10WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *date10WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *date10WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *date10WeeksTF4;
@property (weak, nonatomic) IBOutlet UIButton *check10Weeks1;
@property (weak, nonatomic) IBOutlet UIButton *check10Weeks2;
@property (weak, nonatomic) IBOutlet UIButton *check10Weeks3;
@property (weak, nonatomic) IBOutlet UIButton *check10Weeks4;

//textfield 14 Weeks
@property (weak, nonatomic) IBOutlet UITextField *clinic14WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinic14WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinic14WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *clinic14WeeksTF4;
@property (weak, nonatomic) IBOutlet UITextField *physician14WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *physician14WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *physician14WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *physician14WeeksTF4;
@property (weak, nonatomic) IBOutlet UITextField *date14WeeksTF1;
@property (weak, nonatomic) IBOutlet UITextField *date14WeeksTF2;
@property (weak, nonatomic) IBOutlet UITextField *date14WeeksTF3;
@property (weak, nonatomic) IBOutlet UITextField *date14WeeksTF4;
@property (weak, nonatomic) IBOutlet UIButton *check14Weeks1;
@property (weak, nonatomic) IBOutlet UIButton *check14Weeks2;
@property (weak, nonatomic) IBOutlet UIButton *check14Weeks3;
@property (weak, nonatomic) IBOutlet UIButton *check14Weeks4;

//textfield for 9-12 months
@property (weak, nonatomic) IBOutlet UITextField *clinic9MonthsTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinic9MonthsTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinic9MonthsTF3;
@property (weak, nonatomic) IBOutlet UITextField *clinic9MonthsTF4;
@property (weak, nonatomic) IBOutlet UITextField *physician9MonthsTF1;
@property (weak, nonatomic) IBOutlet UITextField *physician9MonthsTF2;
@property (weak, nonatomic) IBOutlet UITextField *physician9MonthsTF3;
@property (weak, nonatomic) IBOutlet UITextField *physician9MonthsTF4;
@property (weak, nonatomic) IBOutlet UITextField *date9MonthsTF1;
@property (weak, nonatomic) IBOutlet UITextField *date9MonthsTF2;
@property (weak, nonatomic) IBOutlet UITextField *date9MonthsTF3;
@property (weak, nonatomic) IBOutlet UITextField *date9MonthsTF4;
@property (weak, nonatomic) IBOutlet UIButton *check9Months1;
@property (weak, nonatomic) IBOutlet UIButton *check9Months2;
@property (weak, nonatomic) IBOutlet UIButton *check9Months3;
@property (weak, nonatomic) IBOutlet UIButton *check9Months4;

//textfield for 15-18 months
@property (weak, nonatomic) IBOutlet UITextField *clinic15MonthsTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinic15MonthsTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinic15MonthsTF3;
@property (weak, nonatomic) IBOutlet UITextField *physician15MonthsTF1;
@property (weak, nonatomic) IBOutlet UITextField *physician15MonthsTF2;
@property (weak, nonatomic) IBOutlet UITextField *physician15MonthsTF3;
@property (weak, nonatomic) IBOutlet UITextField *date15MonthsTF1;
@property (weak, nonatomic) IBOutlet UITextField *date15MonthsTF2;
@property (weak, nonatomic) IBOutlet UITextField *date15MonthsTF3;
@property (weak, nonatomic) IBOutlet UIButton *check15Months1;
@property (weak, nonatomic) IBOutlet UIButton *check15Months2;
@property (weak, nonatomic) IBOutlet UIButton *check15Months3;

// textfield for 2 Years
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF3;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF4;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF5;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF6;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF7;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF8;
@property (weak, nonatomic) IBOutlet UITextField *clinic2YearsTF9;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF1;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF2;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF3;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF4;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF5;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF6;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF7;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF8;
@property (weak, nonatomic) IBOutlet UITextField *physician2YearsTF9;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF1;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF2;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF3;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF4;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF5;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF6;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF7;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF8;
@property (weak, nonatomic) IBOutlet UITextField *date2YearsTF9;
@property (weak, nonatomic) IBOutlet UIButton *check2Years1;
@property (weak, nonatomic) IBOutlet UIButton *check2Years2;
@property (weak, nonatomic) IBOutlet UIButton *check2Years3;
@property (weak, nonatomic) IBOutlet UIButton *check2Years4;
@property (weak, nonatomic) IBOutlet UIButton *check2Years5;
@property (weak, nonatomic) IBOutlet UIButton *check2Years6;
@property (weak, nonatomic) IBOutlet UIButton *check2Years7;
@property (weak, nonatomic) IBOutlet UIButton *check2Years8;
@property (weak, nonatomic) IBOutlet UIButton *check2Years9;

//textfield For Addtitional Vaccine

@property (weak, nonatomic) IBOutlet UITextField *vNameTF1;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF2;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF3;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF4;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF5;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF6;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF7;
@property (weak, nonatomic) IBOutlet UITextField *vNameTF8;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF1;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF2;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF3;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF4;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF5;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF6;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF7;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTF8;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF1;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF2;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF3;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF4;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF5;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF6;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF7;
@property (weak, nonatomic) IBOutlet UITextField *clinicAdditionalTF8;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF1;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF2;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF3;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF4;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF5;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF6;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF7;
@property (weak, nonatomic) IBOutlet UITextField *physicianAdditionTF8;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF1;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF2;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF3;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF4;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF5;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF6;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF7;
@property (weak, nonatomic) IBOutlet UITextField *dateAdditionalTF8;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional1;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional2;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional3;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional4;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional5;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional6;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional7;
@property (weak, nonatomic) IBOutlet UIButton *checkAdditional8;

@end
