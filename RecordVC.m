//
//  RecordVC.m
//  Immunization
//
//  Created by Test on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "RecordVC.h"
#import "RecordTableCell.h"
#import "Children.h"
#import "SearchVC.h"
#import "ChildVC.h"
#import "MileStonePopoverViewController.h"
#import "NotePopoverViewController.h"
#import "GrowthViewController.h"



@interface RecordVC ()

@end

@implementation RecordVC
@synthesize  datePicker, returnedDate;
@synthesize  currentPopoverSegue, pvc, milestoneTabNo, notePopoverVC;
@synthesize physician, cID, childName,pID, dob, result;
@synthesize labelDobOnToolbar, labelFullNameOnToolbar, labelIdOnToolbar;
@synthesize scrollView;
@synthesize  edit;
@synthesize editBirthBtn, edit6WeeksBtn, edit10WeeksBtn, edit14WeeksBtn, edit9MonthsBtn, edit15MonthsBtn, edit2YearsBtn, editAddtitionalBtn;

@synthesize clinic6WeeksTF1, clinic6WeeksTF2, clinic6WeeksTF3, clinic6WeeksTF4, clinicBirthTF1, clinicBirthTF2,clinicBirthTF3, clinic10WeeksTF1, clinic10WeeksTF2, clinic10WeeksTF3, clinic10WeeksTF4, clinic14WeeksTF1, clinic14WeeksTF2, clinic14WeeksTF3, clinic14WeeksTF4, clinic9MonthsTF1, clinic9MonthsTF2, clinic9MonthsTF3, clinic9MonthsTF4, clinic15MonthsTF1, clinic15MonthsTF2, clinic15MonthsTF3, clinic2YearsTF1, clinic2YearsTF2, clinic2YearsTF3, clinic2YearsTF4, clinic2YearsTF5, clinic2YearsTF6, clinic2YearsTF7, clinic2YearsTF8, clinic2YearsTF9, clinicAdditionalTF1, clinicAdditionalTF2, clinicAdditionalTF3, clinicAdditionalTF4, clinicAdditionalTF5, clinicAdditionalTF6, clinicAdditionalTF7, clinicAdditionalTF8;
@synthesize physician6WeeksTF1, physician6WeeksTF2, physician6WeeksTF3, physician6WeeksTF4, physicianBirthTF1, physicianBirthTF2, physicianBirthTF3, physician10WeeksTF1, physician10WeeksTF2, physician10WeeksTF3, physician10WeeksTF4, physician14WeeksTF1, physician14WeeksTF2, physician14WeeksTF3, physician14WeeksTF4, physician9MonthsTF1, physician9MonthsTF2, physician9MonthsTF3, physician9MonthsTF4, physician15MonthsTF1, physician15MonthsTF2, physician15MonthsTF3, physician2YearsTF1, physician2YearsTF2, physician2YearsTF3, physician2YearsTF4, physician2YearsTF5, physician2YearsTF6, physician2YearsTF7, physician2YearsTF8, physician2YearsTF9, physicianAdditionTF1, physicianAdditionTF2, physicianAdditionTF3, physicianAdditionTF4, physicianAdditionTF5, physicianAdditionTF6, physicianAdditionTF7, physicianAdditionTF8;
@synthesize date6WeeksTF1, date6WeeksTF2, date6WeeksTF3, date6WeeksTF4, dateBirthTF1, dateBirthTF2, dateBirthTF3, date10WeeksTF1, date10WeeksTF2, date10WeeksTF3, date10WeeksTF4, date14WeeksTF1, date14WeeksTF2, date14WeeksTF3, date14WeeksTF4, date9MonthsTF1, date9MonthsTF2, date9MonthsTF3, date9MonthsTF4, date15MonthsTF1, date15MonthsTF2, date15MonthsTF3, date2YearsTF1, date2YearsTF2, date2YearsTF3, date2YearsTF4, date2YearsTF5, date2YearsTF6, date2YearsTF7, date2YearsTF8, date2YearsTF9, dateAdditionalTF1, dateAdditionalTF2, dateAdditionalTF3, dateAdditionalTF4, dateAdditionalTF5, dateAdditionalTF6, dateAdditionalTF7, dateAdditionalTF8;
@synthesize checkBirth1, checkBirth2, checkBirth3, check6Weeks1, check6Weeks2, check6Weeks3, check6Weeks4, check10Weeks1, check10Weeks2, check10Weeks3, check10Weeks4, check14Weeks1, check14Weeks2, check14Weeks3, check14Weeks4, check9Months1, check9Months2, check9Months3, check9Months4, check15Months1, check15Months2, check15Months3, check2Years1,check2Years2, check2Years3, check2Years4, check2Years5, check2Years6, check2Years7, check2Years8, check2Years9, checkAdditional1, checkAdditional2, checkAdditional3, checkAdditional4, checkAdditional5, checkAdditional6, checkAdditional7, checkAdditional8;
@synthesize vNameTF1, vNameTF2,vNameTF3,vNameTF4,vNameTF5,vNameTF6,vNameTF7,vNameTF8,descriptionTF1,descriptionTF2,descriptionTF3,descriptionTF4,descriptionTF5,descriptionTF6,descriptionTF7,descriptionTF8;

@synthesize recordIDAdditional;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //scroll view
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(1024, 4600)];
    
    //load Background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2-1024.png"]];
    
    //load child name, dob, id
    returnedDate.delegate = self;
    labelFullNameOnToolbar.text = childName;
    labelDobOnToolbar.text = dob;
    labelIdOnToolbar.text = cID;
    
    //declare edit boolean
    edit = [[NSMutableArray alloc] initWithObjects: @"N", @"N", @"N", @"N", @"N", @"N", @"N", @"N", nil];
    
    //get recordID for additional vaccine
    recordIDAdditional = [Children GetRecordIDForAdditionalVaccineByChildrenID:cID];
    
    //load screen
    [self loadBirthMilestone];
    [self load6WeeksMilestone];
    [self load10WeeksMilestone];
    [self load14WeeksMilestone];
    [self load9MonthsMilestone];
    [self load15MonthsMilestone];
    [self load2YearsMilestone];
    [self loadAdditionalMilestone];
    
}


//text Field move up when it is touched
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 100);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y - 100) animated:YES];
}

//Test textfield
- (BOOL)validateInputOfPhysicianID:(NSString *)aString
{
    if ([Children PhysicianExistwithID:aString] == YES || [aString isEqualToString:@""])
        return YES;
    else
    {
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Not Found Physician ID %@", aString] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
        return NO;
    }
}

- (BOOL)validateInputWithStringAndNumber:(NSString *)aString
{
     NSString * const regularExpression = @"^[a-zA-Z0-9 ]{0,250}$";
     NSError *error = NULL;
     NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpression
     options:NSRegularExpressionCaseInsensitive
     error:&error];
     if (error) {
     NSLog(@"error %@", error);
     }
     
     NSUInteger numberOfMatches = [regex numberOfMatchesInString:aString
     options:0
     range:NSMakeRange(0, [aString length])];
     if(numberOfMatches <= 0)
     {
     UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@)", @"a-z, A-Z, 0-9" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     
     [inputError show];
     }
     return numberOfMatches > 0;
}

- (BOOL)validateInputForDate:(NSString *)aString
{
    NSString * const regularExpression = @"^(1[0-2]|0[1-9])/(3[01]|[12][0-9]|0[1-9])/[0-9]{4}$";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if (error) {
        NSLog(@"error %@", error);
    }
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:aString
                                                        options:0
                                                          range:NSMakeRange(0, [aString length])];
    if(numberOfMatches <= 0)
    {
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Format of Date\n %@", @"mm/dd/yyyy" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(textField == physicianBirthTF1 || textField == physicianBirthTF2 || textField == physicianBirthTF3 || textField == physician6WeeksTF1 || textField == physician6WeeksTF2 || textField == physician6WeeksTF3 || textField == physician6WeeksTF4 || textField == physician10WeeksTF1 || textField == physician10WeeksTF2 || textField == physician10WeeksTF3 || textField == physician10WeeksTF4 || textField == physician14WeeksTF1 || textField == physician14WeeksTF2 || textField == physician14WeeksTF3 || textField == physician14WeeksTF4 || textField == physician9MonthsTF1 || textField == physician9MonthsTF2 || textField == physician9MonthsTF3 || textField == physician9MonthsTF4 || textField == physician15MonthsTF1 || textField == physician15MonthsTF2 || textField == physician15MonthsTF3 || textField == physician2YearsTF1 || textField == physician2YearsTF2 || textField == physician2YearsTF3 || textField == physician2YearsTF4 || textField == physician2YearsTF5 || textField == physician2YearsTF6 || textField == physician2YearsTF7 || textField == physician2YearsTF8 || textField == physician2YearsTF9 || textField == physicianAdditionTF1 || textField == physicianAdditionTF2 || textField == physicianAdditionTF3 || textField == physicianAdditionTF4 || textField == physicianAdditionTF5 || textField == physicianAdditionTF6 || textField == physicianAdditionTF7 || textField == physicianAdditionTF8)
        return [self validateInputOfPhysicianID:textField.text];
    
    else if(textField == dateBirthTF1 || textField == dateBirthTF2 || textField == dateBirthTF3 || textField == date6WeeksTF1 || textField == date6WeeksTF2 || textField == date6WeeksTF3 || textField == date6WeeksTF4 || textField == date10WeeksTF1 || textField == date10WeeksTF2 || textField == date10WeeksTF3 || textField == date10WeeksTF4 || textField == date14WeeksTF1 || textField == date14WeeksTF2 || textField == date14WeeksTF3 || textField == date14WeeksTF4 || textField == date9MonthsTF1 || textField == date9MonthsTF2 || textField == date9MonthsTF3 || textField == date9MonthsTF4 || textField == date15MonthsTF1 || textField == date15MonthsTF2 || textField == date15MonthsTF3 || textField == date2YearsTF1 || textField == date2YearsTF2 || textField == date2YearsTF3 || textField == date2YearsTF4 || textField == date2YearsTF5 || textField == date2YearsTF6 || textField == date2YearsTF7 || textField == date2YearsTF8 || textField == date2YearsTF9 || textField == dateAdditionalTF1 || textField == dateAdditionalTF2 || textField == dateAdditionalTF3 || textField == dateAdditionalTF4 || textField == dateAdditionalTF5 || textField == dateAdditionalTF6 || textField == dateAdditionalTF7 || textField == dateAdditionalTF8)
        return [self validateInputForDate:textField.text];
    
    else if (textField == vNameTF1 || textField == vNameTF2 || textField == vNameTF3 || textField == vNameTF4 || textField == vNameTF5 || textField == vNameTF6 || textField == vNameTF7 || textField == vNameTF8 || textField == descriptionTF1 || textField == descriptionTF2 || textField == descriptionTF3 || textField == descriptionTF4 || textField == descriptionTF5 || textField == descriptionTF6 || textField == descriptionTF7 || textField == descriptionTF8 )
        return [self validateInputWithStringAndNumber:textField.text];
    else
        return YES;
}

-(NSString *)getVacineRecordByVaccineName:(NSString *)vaccineName andData:(NSMutableArray *)data andIndex: (int)index
{
    NSString *resultStr;
    if([data count] > 0)
    {
        for(int i = 0; i <[data count]; ++i)
        {
            if([[[data objectAtIndex:i] objectAtIndex:1] isEqualToString:vaccineName])
            {
                resultStr = [[data objectAtIndex:i] objectAtIndex:index];
                break;
            }
        }
    }
    return resultStr;
}

-(void)setCheckBoxByCheckButton:(UIButton *)checkBtn andData:(NSMutableArray*)data andVaccineName:(NSString *)vaccineName
{
    if([data count] > 0)
    {
        for(int i = 0; i <[data count]; ++i)
        {
            if([[[data objectAtIndex:i] objectAtIndex:1] isEqualToString:vaccineName])
            {
                if([[[data objectAtIndex:i]objectAtIndex:5] isEqualToString:@"Y"])
                {
                    [checkBtn setImage:[UIImage imageNamed:@"checkbox1.png"] forState:UIControlStateNormal];
                }
                else
                {
                    [checkBtn setImage:[UIImage imageNamed:@"checkbox0.png" ] forState:UIControlStateNormal];
                }
                
            }
        }
    }
    
}

-(void)updateMileStoneByMileStone:(NSString *)mileStone andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andData:(NSMutableArray *)data
{
    NSString *getVaccine = @"N";
    if(![[data objectAtIndex:2] isEqualToString:@""])
    {
        getVaccine = @"Y";
    }

    if([Children PhysicianExistwithID:[data objectAtIndex:1]] == YES || ![[data objectAtIndex: 2] isEqualToString:@""])
        [Children EditRecordByChildID:cID andAgeRange:mileStone andVaccineName:vaccineName andDescription:description andTakenDate:[data objectAtIndex:2] andTaken:getVaccine andPhysician:[data objectAtIndex:1]];
    /*
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: [NSString stringWithFormat:@"Not Found the Physician ID: %@ Or Date Taken is empty", [data objectAtIndex:1]] delegate: nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alert show];
    }
     */
    

    
}
//Birth MileStone Section

-(void)enableEditForBirthMileStone
{
    if([[edit objectAtIndex:0] isEqualToString:@"N"])
    {
        clinicBirthTF1.enabled = NO;
        clinicBirthTF2.enabled = NO;
        clinicBirthTF3.enabled = NO;
        
        physicianBirthTF1.enabled = NO;
        physicianBirthTF2.enabled = NO;
        physicianBirthTF3.enabled = NO;
        
        dateBirthTF1.enabled = NO;
        dateBirthTF2.enabled = NO;
        dateBirthTF3.enabled = NO;
    }
    if([[edit objectAtIndex:0] isEqualToString:@"Y"])
    {
        /*
        clinicBirthTF1.enabled = YES;
        clinicBirthTF2.enabled = YES;
        clinicBirthTF3.enabled = YES;
        */
        physicianBirthTF1.enabled = YES;
        physicianBirthTF2.enabled = YES;
        physicianBirthTF3.enabled = YES;
        
        physicianBirthTF1.placeholder = @"Physician ID";
        physicianBirthTF2.placeholder = @"Physician ID";
        physicianBirthTF3.placeholder = @"Physician ID";
        
        dateBirthTF1.enabled = YES;
        dateBirthTF2.enabled = YES;
        dateBirthTF3.enabled = YES;
    }
}

-(void)loadBirthMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"Birth"];
    clinicBirthTF1.text = [self getVacineRecordByVaccineName:@"BCG" andData:result andIndex:8];
    clinicBirthTF2.text = [self getVacineRecordByVaccineName:@"HEP B" andData:result andIndex:8];
    clinicBirthTF3.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:8];
    dateBirthTF1.text = [self getVacineRecordByVaccineName:@"BCG" andData:result andIndex:3];
    dateBirthTF2.text = [self getVacineRecordByVaccineName:@"HEP B" andData:result andIndex:3];
    dateBirthTF3.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:3];
    if(![dateBirthTF1.text isEqualToString:@""])
    {
        physicianBirthTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"BCG" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"BCG" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:checkBirth1 andData:result andVaccineName:@"BCG"];
    }
    if(![dateBirthTF2.text isEqualToString:@""])
    {
        physicianBirthTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"HEP B" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"HEP B" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:checkBirth2 andData:result andVaccineName:@"HEP B"];
    }
    if(![dateBirthTF3.text isEqualToString:@""])
    {
        physicianBirthTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:checkBirth3 andData:result andVaccineName:@"OPV"];
    }
}

-(void)UpdateBirthMileStone
{
    [self updateMileStoneByMileStone:@"BIRTH" andVaccineName:@"BCG" andDescription:@"BACILLUS CALMETTE-GUERIN" andData:[[NSMutableArray alloc] initWithObjects:clinicBirthTF1.text, physicianBirthTF1.text, dateBirthTF1.text, nil]];
    [self updateMileStoneByMileStone:@"BIRTH" andVaccineName:@"HEP B" andDescription:@"HEPATITIS B" andData:[[NSMutableArray alloc] initWithObjects:clinicBirthTF2.text, physicianBirthTF2.text, dateBirthTF2.text, nil]];
    [self updateMileStoneByMileStone:@"BIRTH" andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinicBirthTF3.text, physicianBirthTF3.text, dateBirthTF3.text, nil]];
    
}

//6 Weeks Section
-(void)enableEditFor6WeeksMileStone
{
    if([[edit objectAtIndex:1] isEqualToString:@"N"])
    {
        clinic6WeeksTF1.enabled = NO;
        clinic6WeeksTF2.enabled = NO;
        clinic6WeeksTF3.enabled = NO;
        clinic6WeeksTF4.enabled = NO;
        
        physician6WeeksTF1.enabled = NO;
        physician6WeeksTF2.enabled = NO;
        physician6WeeksTF3.enabled = NO;
        physician6WeeksTF4.enabled = NO;
        
        date6WeeksTF1.enabled = NO;
        date6WeeksTF2.enabled = NO;
        date6WeeksTF3.enabled = NO;
        date6WeeksTF4.enabled = NO;
    }
    if([[edit objectAtIndex:1] isEqualToString:@"Y"])
    {
        /*
        clinic6WeeksTF1.enabled = YES;
        clinic6WeeksTF2.enabled = YES;
        clinic6WeeksTF3.enabled = YES;
        clinic6WeeksTF4.enabled = YES;
        */
        physician6WeeksTF1.enabled = YES;
        physician6WeeksTF2.enabled = YES;
        physician6WeeksTF3.enabled = YES;
        physician6WeeksTF4.enabled = YES;
        
        date6WeeksTF1.enabled = YES;
        date6WeeksTF2.enabled = YES;
        date6WeeksTF3.enabled = YES;
        date6WeeksTF4.enabled = YES;
        
        physician6WeeksTF1.placeholder = @"Physician ID";
        physician6WeeksTF2.placeholder = @"Physician ID";
        physician6WeeksTF3.placeholder = @"Physician ID";
        physician6WeeksTF4.placeholder = @"Physician ID";
        
    }
}

-(void)load6WeeksMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"6 Weeks"];
    clinic6WeeksTF1.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:8];
    clinic6WeeksTF2.text = [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:8];
    clinic6WeeksTF3.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:8];
    clinic6WeeksTF4.text = [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:8];
    
    date6WeeksTF1.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:3];
    date6WeeksTF2.text = [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:3];
    date6WeeksTF3.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:3];
    date6WeeksTF4.text = [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:3];
    
    if(![date6WeeksTF1.text isEqualToString:@""])
    {
        physician6WeeksTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check6Weeks1 andData:result andVaccineName:@"OPV"];
    }
    if(![date6WeeksTF2.text isEqualToString:@""])
    {
        physician6WeeksTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check6Weeks2 andData:result andVaccineName:@"PENTA"];
    }
    if(![date6WeeksTF3.text isEqualToString:@""])
    {
        physician6WeeksTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check6Weeks3 andData:result andVaccineName:@"PCV"];
    }
    if(![date6WeeksTF4.text isEqualToString:@""])
    {
        physician6WeeksTF4.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check6Weeks4 andData:result andVaccineName:@"RV"];
    }
}

-(void)Update6WeeksMileStone
{
    [self updateMileStoneByMileStone:@"6 WEEKS" andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic6WeeksTF1.text, physician6WeeksTF1.text, date6WeeksTF1.text, nil]];
    [self updateMileStoneByMileStone:@"6 WEEKS" andVaccineName:@"PENTA" andDescription:@"PENTAVALENT COMBINATION" andData:[[NSMutableArray alloc] initWithObjects:clinic6WeeksTF2.text, physician6WeeksTF2.text, date6WeeksTF2.text, nil]];
    [self updateMileStoneByMileStone:@"6 WEEKS" andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andData:[[NSMutableArray alloc] initWithObjects:clinic6WeeksTF3.text, physician6WeeksTF3.text, date6WeeksTF3.text, nil]];
    [self updateMileStoneByMileStone:@"6 WEEKS" andVaccineName:@"RV" andDescription:@"ORAL ROTAVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic6WeeksTF4.text, physician6WeeksTF4.text, date6WeeksTF4.text, nil]];
    
}


//10 Weeks Section
-(void)enableEditFor10WeeksMileStone
{
    if([[edit objectAtIndex:2] isEqualToString:@"N"])
    {
        clinic10WeeksTF1.enabled = NO;
        clinic10WeeksTF2.enabled = NO;
        clinic10WeeksTF3.enabled = NO;
        clinic10WeeksTF4.enabled = NO;
        
        physician10WeeksTF1.enabled = NO;
        physician10WeeksTF2.enabled = NO;
        physician10WeeksTF3.enabled = NO;
        physician10WeeksTF4.enabled = NO;
        
        date10WeeksTF1.enabled = NO;
        date10WeeksTF2.enabled = NO;
        date10WeeksTF3.enabled = NO;
        date10WeeksTF4.enabled = NO;
    }
    if([[edit objectAtIndex:2] isEqualToString:@"Y"])
    {
        /*
        clinic10WeeksTF1.enabled = YES;
        clinic10WeeksTF2.enabled = YES;
        clinic10WeeksTF3.enabled = YES;
        clinic10WeeksTF4.enabled = YES;
        */
        physician10WeeksTF1.enabled = YES;
        physician10WeeksTF2.enabled = YES;
        physician10WeeksTF3.enabled = YES;
        physician10WeeksTF4.enabled = YES;

        
        date10WeeksTF1.enabled = YES;
        date10WeeksTF2.enabled = YES;
        date10WeeksTF3.enabled = YES;
        date10WeeksTF4.enabled = YES;
        
        physician10WeeksTF1.placeholder = @"Physician ID";
        physician10WeeksTF2.placeholder = @"Physician ID";
        physician10WeeksTF3.placeholder = @"Physician ID";
        physician10WeeksTF4.placeholder = @"Physician ID";
        
    }
}

-(void)load10WeeksMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"10 Weeks"];
    clinic10WeeksTF1.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:8];
    clinic10WeeksTF2.text = [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:8];
    clinic10WeeksTF3.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:8];
    clinic10WeeksTF4.text = [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:8];
    
    date10WeeksTF1.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:3];
    date10WeeksTF2.text = [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:3];
    date10WeeksTF3.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:3];
    date10WeeksTF4.text = [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:3];
    
    if(![date10WeeksTF1.text isEqualToString:@""])
    {
        physician10WeeksTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check10Weeks1 andData:result andVaccineName:@"OPV"];
    }
    if(![date10WeeksTF2.text isEqualToString:@""])
    {
        physician10WeeksTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check10Weeks2 andData:result andVaccineName:@"PENTA"];
    }
    if(![date10WeeksTF3.text isEqualToString:@""])
    {
        physician10WeeksTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check10Weeks3 andData:result andVaccineName:@"PCV"];
    }
    if(![date10WeeksTF4.text isEqualToString:@""])
    {
        physician10WeeksTF4.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check10Weeks4 andData:result andVaccineName:@"RV"];
    }
}

-(void)Update10WeeksMileStone
{
    [self updateMileStoneByMileStone:@"10 WEEKS" andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic10WeeksTF1.text, physician10WeeksTF1.text, date10WeeksTF1.text, nil]];
    [self updateMileStoneByMileStone:@"10 WEEKS" andVaccineName:@"PENTA" andDescription:@"PENTAVALENT COMBINATION" andData:[[NSMutableArray alloc] initWithObjects:clinic10WeeksTF2.text, physician10WeeksTF2.text, date10WeeksTF2.text, nil]];
    [self updateMileStoneByMileStone:@"10 WEEKS" andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andData:[[NSMutableArray alloc] initWithObjects:clinic10WeeksTF3.text, physician10WeeksTF3.text, date10WeeksTF3.text, nil]];
    [self updateMileStoneByMileStone:@"10 WEEKS" andVaccineName:@"RV" andDescription:@"ORAL ROTAVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic10WeeksTF4.text, physician10WeeksTF4.text, date10WeeksTF4.text, nil]];
    
}

//14 Weeks Section
-(void)enableEditFor14WeeksMileStone
{
    if([[edit objectAtIndex:3] isEqualToString:@"N"])
    {
        clinic14WeeksTF1.enabled = NO;
        clinic14WeeksTF2.enabled = NO;
        clinic14WeeksTF3.enabled = NO;
        clinic14WeeksTF4.enabled = NO;
        
        physician14WeeksTF1.enabled = NO;
        physician14WeeksTF2.enabled = NO;
        physician14WeeksTF3.enabled = NO;
        physician14WeeksTF4.enabled = NO;
        
        date14WeeksTF1.enabled = NO;
        date14WeeksTF2.enabled = NO;
        date14WeeksTF3.enabled = NO;
        date14WeeksTF4.enabled = NO;
    }
    if([[edit objectAtIndex:3] isEqualToString:@"Y"])
    {
        /*
        clinic14WeeksTF1.enabled = YES;
        clinic14WeeksTF2.enabled = YES;
        clinic14WeeksTF3.enabled = YES;
        clinic14WeeksTF4.enabled = YES;
        */
        
        physician14WeeksTF1.enabled = YES;
        physician14WeeksTF2.enabled = YES;
        physician14WeeksTF3.enabled = YES;
        physician14WeeksTF4.enabled = YES;
        
        
        date14WeeksTF1.enabled = YES;
        date14WeeksTF2.enabled = YES;
        date14WeeksTF3.enabled = YES;
        date14WeeksTF4.enabled = YES;
        
        physician14WeeksTF1.placeholder = @"Physician ID";
        physician14WeeksTF2.placeholder = @"Physician ID";
        physician14WeeksTF3.placeholder = @"Physician ID";
        physician14WeeksTF4.placeholder = @"Physician ID";
        
    }
}

-(void)load14WeeksMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"14 Weeks"];
    clinic14WeeksTF1.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:8];
    clinic14WeeksTF2.text = [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:8];
    clinic14WeeksTF3.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:8];
    clinic14WeeksTF4.text = [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:8];
    
    date14WeeksTF1.text = [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:3];
    date14WeeksTF2.text = [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:3];
    date14WeeksTF3.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:3];
    date14WeeksTF4.text = [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:3];
    
    if(![date14WeeksTF1.text isEqualToString:@""])
    {
        physician14WeeksTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"OPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check14Weeks1 andData:result andVaccineName:@"OPV"];
    }
    if(![date14WeeksTF2.text isEqualToString:@""])
    {
        physician14WeeksTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PENTA" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check14Weeks2 andData:result andVaccineName:@"PENTA"];
    }
    if(![date14WeeksTF3.text isEqualToString:@""])
    {
        physician14WeeksTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check14Weeks3 andData:result andVaccineName:@"PCV"];
    }
    if(![date14WeeksTF4.text isEqualToString:@""])
    {
        physician14WeeksTF4.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"RV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check14Weeks4 andData:result andVaccineName:@"RV"];
    }
}

-(void)Update14WeeksMileStone
{
    [self updateMileStoneByMileStone:@"14 WEEKS" andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic14WeeksTF1.text, physician14WeeksTF1.text, date14WeeksTF1.text, nil]];
    [self updateMileStoneByMileStone:@"14 WEEKS" andVaccineName:@"PENTA" andDescription:@"PENTAVALENT COMBINATION" andData:[[NSMutableArray alloc] initWithObjects:clinic14WeeksTF2.text, physician14WeeksTF2.text, date14WeeksTF2.text, nil]];
    [self updateMileStoneByMileStone:@"14 WEEKS" andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andData:[[NSMutableArray alloc] initWithObjects:clinic14WeeksTF3.text, physician14WeeksTF3.text, date14WeeksTF3.text, nil]];
    [self updateMileStoneByMileStone:@"14 WEEKS" andVaccineName:@"RV" andDescription:@"ORAL ROTAVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic14WeeksTF4.text, physician14WeeksTF4.text, date14WeeksTF4.text, nil]];
    
}

// 9-12 Months Section
-(void)enableEditFor9MonthsMileStone
{
    if([[edit objectAtIndex:4] isEqualToString:@"N"])
    {
        clinic9MonthsTF1.enabled = NO;
        clinic9MonthsTF2.enabled = NO;
        clinic9MonthsTF3.enabled = NO;
        clinic9MonthsTF4.enabled = NO;
        
        physician9MonthsTF1.enabled = NO;
        physician9MonthsTF2.enabled = NO;
        physician9MonthsTF3.enabled = NO;
        physician9MonthsTF4.enabled = NO;
        
        date9MonthsTF1.enabled = NO;
        date9MonthsTF2.enabled = NO;
        date9MonthsTF3.enabled = NO;
        date9MonthsTF4.enabled = NO;
    }
    if([[edit objectAtIndex:4] isEqualToString:@"Y"])
    {
        /*
        clinic9MonthsTF1.enabled = YES;
        clinic9MonthsTF2.enabled = YES;
        clinic9MonthsTF3.enabled = YES;
        clinic9MonthsTF4.enabled = YES;
        */
        
        physician9MonthsTF1.enabled = YES;
        physician9MonthsTF2.enabled = YES;
        physician9MonthsTF3.enabled = YES;
        physician9MonthsTF4.enabled = YES;
        
        
        date9MonthsTF1.enabled = YES;
        date9MonthsTF2.enabled = YES;
        date9MonthsTF3.enabled = YES;
        date9MonthsTF4.enabled = YES;
        
        physician9MonthsTF1.placeholder = @"Physician ID";
        physician9MonthsTF2.placeholder = @"Physician ID";
        physician9MonthsTF3.placeholder = @"Physician ID";
        physician9MonthsTF4.placeholder = @"Physician ID";
        
    }
}

-(void)load9MonthsMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"9-12 Months"];
    clinic9MonthsTF1.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:8];
    clinic9MonthsTF2.text = [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:8];
    clinic9MonthsTF3.text = [self getVacineRecordByVaccineName:@"HIB" andData:result andIndex:8];
    clinic9MonthsTF4.text = [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:8];
    
    date9MonthsTF1.text = [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:3];
    date9MonthsTF2.text = [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:3];
    date9MonthsTF3.text = [self getVacineRecordByVaccineName:@"HIB" andData:result andIndex:3];
    date9MonthsTF4.text = [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:3];
    
    if(![date9MonthsTF1.text isEqualToString:@""])
    {
        physician9MonthsTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"PCV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check9Months1 andData:result andVaccineName:@"PCV"];
    }
    if(![date9MonthsTF2.text isEqualToString:@""])
    {
        physician9MonthsTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check9Months2 andData:result andVaccineName:@"MR"];
    }
    if(![date9MonthsTF3.text isEqualToString:@""])
    {
        physician9MonthsTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"HIB" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"HIB" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check9Months3 andData:result andVaccineName:@"HIB"];
    }
    if(![date9MonthsTF4.text isEqualToString:@""])
    {
        physician9MonthsTF4.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check9Months4 andData:result andVaccineName:@"HEB A"];
    }
}

-(void)Update9MonthsMileStone
{
    [self updateMileStoneByMileStone:@"9-12 MONTHS" andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andData:[[NSMutableArray alloc] initWithObjects:clinic9MonthsTF1.text, physician9MonthsTF1.text, date9MonthsTF1.text, nil]];
    [self updateMileStoneByMileStone:@"9-12 MONTHS" andVaccineName:@"MR" andDescription:@"MEASLES AND RUBELLA" andData:[[NSMutableArray alloc] initWithObjects:clinic9MonthsTF2.text, physician9MonthsTF2.text, date9MonthsTF2.text, nil]];
    [self updateMileStoneByMileStone:@"9-12 MONTHS" andVaccineName:@"HIB" andDescription:@"HAEMOPHILUS INFLUENZA" andData:[[NSMutableArray alloc] initWithObjects:clinic9MonthsTF3.text, physician9MonthsTF3.text, date9MonthsTF3.text, nil]];
    [self updateMileStoneByMileStone:@"9-12 MONTHS" andVaccineName:@"HEB A" andDescription:@"HEPATITIS A" andData:[[NSMutableArray alloc] initWithObjects:clinic9MonthsTF4.text, physician9MonthsTF4.text, date9MonthsTF4.text, nil]];
    
}

//15-18 Months Section
-(void)enableEditFor15MonthsMileStone
{
    if([[edit objectAtIndex:5] isEqualToString:@"N"])
    {
        clinic15MonthsTF1.enabled = NO;
        clinic15MonthsTF2.enabled = NO;
        clinic15MonthsTF3.enabled = NO;
        
        physician15MonthsTF1.enabled = NO;
        physician15MonthsTF2.enabled = NO;
        physician15MonthsTF3.enabled = NO;
        
        date15MonthsTF1.enabled = NO;
        date15MonthsTF2.enabled = NO;
        date15MonthsTF3.enabled = NO;
    }
    if([[edit objectAtIndex:5] isEqualToString:@"Y"])
    {
        /*
        clinic15MonthsTF1.enabled = YES;
        clinic15MonthsTF2.enabled = YES;
        clinic15MonthsTF3.enabled = YES;
        */
        
        physician15MonthsTF1.enabled = YES;
        physician15MonthsTF2.enabled = YES;
        physician15MonthsTF3.enabled = YES;
        
        date15MonthsTF1.enabled = YES;
        date15MonthsTF2.enabled = YES;
        date15MonthsTF3.enabled = YES;
        
        physician15MonthsTF1.placeholder = @"Physician ID";
        physician15MonthsTF2.placeholder = @"Physician ID";
        physician15MonthsTF3.placeholder = @"Physician ID";
        
    }
}

-(void)load15MonthsMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"15-18 Months"];
    clinic15MonthsTF1.text = [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:8];
    clinic15MonthsTF2.text = [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:8];
    clinic15MonthsTF3.text = [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:8];
    
    date15MonthsTF1.text = [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:3];
    date15MonthsTF2.text = [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:3];
    date15MonthsTF3.text = [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:3];
    
    if(![date15MonthsTF1.text isEqualToString:@""])
    {
        physician15MonthsTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check15Months1 andData:result andVaccineName:@"MR"];
    }
    if(![date15MonthsTF2.text isEqualToString:@""])
    {
        physician15MonthsTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"HEB A" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check15Months2 andData:result andVaccineName:@"HEB A"];
    }
    if(![date15MonthsTF3.text isEqualToString:@""])
    {
        physician15MonthsTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check15Months3 andData:result andVaccineName:@"DTap"];
    }
}

-(void)Update15MonthsMileStone
{
    [self updateMileStoneByMileStone:@"15-18 MONTHS" andVaccineName:@"MR" andDescription:@"MEASLES AND RUBELLA" andData:[[NSMutableArray alloc] initWithObjects:clinic15MonthsTF1.text, physician15MonthsTF1.text, date15MonthsTF1.text, nil]];
    [self updateMileStoneByMileStone:@"15-18 MONTHS" andVaccineName:@"HEB A" andDescription:@"HEPATITIS A" andData:[[NSMutableArray alloc] initWithObjects:clinic15MonthsTF2.text, physician15MonthsTF2.text, date15MonthsTF2.text, nil]];
    [self updateMileStoneByMileStone:@"15-18 MONTHS" andVaccineName:@"DTap" andDescription:@"DIPHTHERIA, TETANUS, AND ACELLULAR PERTUSSIS" andData:[[NSMutableArray alloc] initWithObjects:clinic15MonthsTF3.text, physician15MonthsTF3.text, date15MonthsTF3.text, nil]];
    
}


//2 Year Section
-(void)enableEditFor2YearsMileStone
{
    if([[edit objectAtIndex:6] isEqualToString:@"N"])
    {
        clinic2YearsTF1.enabled = NO;
        clinic2YearsTF2.enabled = NO;
        clinic2YearsTF3.enabled = NO;
        clinic2YearsTF4.enabled = NO;
        clinic2YearsTF5.enabled = NO;
        clinic2YearsTF6.enabled = NO;
        clinic2YearsTF7.enabled = NO;
        clinic2YearsTF8.enabled = NO;
        clinic2YearsTF9.enabled = NO;
        
        physician2YearsTF1.enabled = NO;
        physician2YearsTF2.enabled = NO;
        physician2YearsTF3.enabled = NO;
        physician2YearsTF4.enabled = NO;
        physician2YearsTF5.enabled = NO;
        physician2YearsTF6.enabled = NO;
        physician2YearsTF7.enabled = NO;
        physician2YearsTF8.enabled = NO;
        physician2YearsTF9.enabled = NO;
        
        date2YearsTF1.enabled = NO;
        date2YearsTF2.enabled = NO;
        date2YearsTF3.enabled = NO;
        date2YearsTF4.enabled = NO;
        date2YearsTF5.enabled = NO;
        date2YearsTF6.enabled = NO;
        date2YearsTF7.enabled = NO;
        date2YearsTF8.enabled = NO;
        date2YearsTF9.enabled = NO;
    }
    if([[edit objectAtIndex:6] isEqualToString:@"Y"])
    {
        /*
        clinic2YearsTF1.enabled = YES;
        clinic2YearsTF2.enabled = YES;
        clinic2YearsTF3.enabled = YES;
        clinic2YearsTF4.enabled = YES;
        clinic2YearsTF5.enabled = YES;
        clinic2YearsTF6.enabled = YES;
        clinic2YearsTF7.enabled = YES;
        clinic2YearsTF8.enabled = YES;
        clinic2YearsTF9.enabled = YES;
        */
        
        physician2YearsTF1.enabled = YES;
        physician2YearsTF2.enabled = YES;
        physician2YearsTF3.enabled = YES;
        physician2YearsTF4.enabled = YES;
        physician2YearsTF5.enabled = YES;
        physician2YearsTF6.enabled = YES;
        physician2YearsTF7.enabled = YES;
        physician2YearsTF8.enabled = YES;
        physician2YearsTF9.enabled = YES;
        
        date2YearsTF1.enabled = YES;
        date2YearsTF2.enabled = YES;
        date2YearsTF3.enabled = YES;
        date2YearsTF4.enabled = YES;
        date2YearsTF5.enabled = YES;
        date2YearsTF6.enabled = YES;
        date2YearsTF7.enabled = YES;
        date2YearsTF8.enabled = YES;
        date2YearsTF9.enabled = YES;
        
        physician2YearsTF1.placeholder = @"Physician ID";
        physician2YearsTF2.placeholder = @"Physician ID";
        physician2YearsTF3.placeholder = @"Physician ID";
        physician2YearsTF4.placeholder = @"Physician ID";
        physician2YearsTF5.placeholder = @"Physician ID";
        physician2YearsTF6.placeholder = @"Physician ID";
        physician2YearsTF7.placeholder = @"Physician ID";
        physician2YearsTF8.placeholder = @"Physician ID";
        physician2YearsTF9.placeholder = @"Physician ID";
        
    }
}

-(void)load2YearsMilestone
{
    result = [Children GetChildRecordByChildID:cID ageRange:@"4-6 Years"];
    clinic2YearsTF1.text = [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:8];
    clinic2YearsTF2.text = [self getVacineRecordByVaccineName:@"VARIVAX" andData:result andIndex:8];
    clinic2YearsTF3.text = [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:8];
    clinic2YearsTF4.text = [self getVacineRecordByVaccineName:@"IPV" andData:result andIndex:8];
    
    date2YearsTF1.text = [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:3];
    date2YearsTF2.text = [self getVacineRecordByVaccineName:@"VARIVAX" andData:result andIndex:3];
    date2YearsTF3.text = [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:3];
    date2YearsTF4.text = [self getVacineRecordByVaccineName:@"IPV" andData:result andIndex:3];
    
    if(![date2YearsTF1.text isEqualToString:@""])
    {
        physician2YearsTF1.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"MR" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years1 andData:result andVaccineName:@"MR"];
    }
    if(![date2YearsTF2.text isEqualToString:@""])
    {
        physician2YearsTF2.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"VARIVAX" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"VARIVAX" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years2 andData:result andVaccineName:@"VARIVAX"];
    }
    if(![date2YearsTF3.text isEqualToString:@""])
    {
        physician2YearsTF3.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years3 andData:result andVaccineName:@"DTap"];
    }
    if(![date2YearsTF4.text isEqualToString:@""])
    {
        physician2YearsTF4.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"IPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"IPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years4 andData:result andVaccineName:@"IPV"];
    }
    
    result = [Children GetChildRecordByChildID:cID ageRange:@"11-12 Years"];
    clinic2YearsTF5.text = [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:8];
    clinic2YearsTF6.text = [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:8];
    clinic2YearsTF7.text = [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:8];
    
    date2YearsTF5.text = [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:3];
    date2YearsTF6.text = [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:3];
    date2YearsTF7.text = [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:3];
    
    if(![date2YearsTF5.text isEqualToString:@""])
    {
        physician2YearsTF5.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"DTap" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years5 andData:result andVaccineName:@"DTap"];
    }
    if(![date2YearsTF6.text isEqualToString:@""])
    {
        physician2YearsTF6.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years6 andData:result andVaccineName:@"MCV4"];
    }
    if(![date2YearsTF7.text isEqualToString:@""])
    {
        physician2YearsTF7.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years7 andData:result andVaccineName:@"HPV"];
    }
    
    result = [Children GetChildRecordByChildID:cID ageRange:@"13-19 Years"];
    clinic2YearsTF8.text = [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:8];
    clinic2YearsTF9.text = [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:8];
    
    date2YearsTF8.text = [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:3];
    date2YearsTF9.text = [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:3];
    
    if(![date2YearsTF8.text isEqualToString:@""])
    {
        physician2YearsTF8.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"MCV4" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years8 andData:result andVaccineName:@"MCV4"];
    }
    if(![date2YearsTF9.text isEqualToString:@""])
    {
        physician2YearsTF9.text = [NSString stringWithFormat:@"%@ %@", [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:9], [self getVacineRecordByVaccineName:@"HPV" andData:result andIndex:10]];
        [self setCheckBoxByCheckButton:check2Years9 andData:result andVaccineName:@"HPV"];
    }

}

-(void)Update2YearsMileStone
{
    [self updateMileStoneByMileStone:@"4-6 Years" andVaccineName:@"MR" andDescription:@"MEASLES AND RUBELLA" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF1.text, physician2YearsTF1.text, date2YearsTF1.text, nil]];
    [self updateMileStoneByMileStone:@"4-6 Years" andVaccineName:@"VARIVAX" andDescription:@"VARICELLA CHICKENPOX" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF2.text, physician2YearsTF2.text, date2YearsTF2.text, nil]];
    [self updateMileStoneByMileStone:@"4-6 Years" andVaccineName:@"DTap" andDescription:@"DIPHTHERIA, TETANUS, AND ACELLULAR PERTUSSIS" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF3.text, physician2YearsTF3.text, date2YearsTF3.text, nil]];
    [self updateMileStoneByMileStone:@"4-6 Years" andVaccineName:@"IPV" andDescription:@"INACTIVATED POLIOVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF4.text, physician2YearsTF4.text, date2YearsTF4.text, nil]];
    [self updateMileStoneByMileStone:@"11-12 Years" andVaccineName:@"DTap" andDescription:@"DIPHTHERIA, TETANUS, AND ACELLULAR PERTUSSIS" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF5.text, physician2YearsTF5.text, date2YearsTF5.text, nil]];
    [self updateMileStoneByMileStone:@"11-12 Years" andVaccineName:@"MCV4" andDescription:@"MENINGOCOCCAL VACCINE" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF6.text, physician2YearsTF6.text, date2YearsTF6.text, nil]];
    [self updateMileStoneByMileStone:@"11-12 Years" andVaccineName:@"HPV" andDescription:@"HUMAN PAPILLOMAVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF7.text, physician2YearsTF7.text, date2YearsTF7.text, nil]];
    [self updateMileStoneByMileStone:@"13-19 Years" andVaccineName:@"MCV4" andDescription:@"MENINGOCOCCAL VACCINE" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF8.text, physician2YearsTF8.text, date2YearsTF8.text, nil]];
    [self updateMileStoneByMileStone:@"13-19 Years" andVaccineName:@"HPV" andDescription:@"HUMAN PAPILLOMAVIRUS" andData:[[NSMutableArray alloc] initWithObjects:clinic2YearsTF9.text, physician2YearsTF9.text, date2YearsTF9.text, nil]];
    
}


//Additional Vaccine Section
-(void)enableEditForAdditionalMileStone
{
    if([[edit objectAtIndex:7] isEqualToString:@"N"])
    {
        clinicAdditionalTF1.enabled = NO;
        clinicAdditionalTF2.enabled = NO;
        clinicAdditionalTF3.enabled = NO;
        clinicAdditionalTF4.enabled = NO;
        clinicAdditionalTF5.enabled = NO;
        clinicAdditionalTF6.enabled = NO;
        clinicAdditionalTF7.enabled = NO;
        clinicAdditionalTF8.enabled = NO;
        
        physicianAdditionTF1.enabled = NO;
        physicianAdditionTF2.enabled = NO;
        physicianAdditionTF3.enabled = NO;
        physicianAdditionTF4.enabled = NO;
        physicianAdditionTF5.enabled = NO;
        physicianAdditionTF6.enabled = NO;
        physicianAdditionTF7.enabled = NO;
        physicianAdditionTF8.enabled = NO;

        
        dateAdditionalTF1.enabled = NO;
        dateAdditionalTF2.enabled = NO;
        dateAdditionalTF3.enabled = NO;
        dateAdditionalTF4.enabled = NO;
        dateAdditionalTF5.enabled = NO;
        dateAdditionalTF6.enabled = NO;
        dateAdditionalTF7.enabled = NO;
        dateAdditionalTF8.enabled = NO;
        
        vNameTF1.enabled = NO;
        vNameTF2.enabled = NO;
        vNameTF3.enabled = NO;
        vNameTF4.enabled = NO;
        vNameTF5.enabled = NO;
        vNameTF6.enabled = NO;
        vNameTF7.enabled = NO;
        vNameTF8.enabled = NO;
        
        descriptionTF1.enabled = NO;
        descriptionTF2.enabled = NO;
        descriptionTF3.enabled = NO;
        descriptionTF4.enabled = NO;
        descriptionTF5.enabled = NO;
        descriptionTF6.enabled = NO;
        descriptionTF7.enabled = NO;
        descriptionTF8.enabled = NO;

    }
    if([[edit objectAtIndex:7] isEqualToString:@"Y"])
    {
        /*
        clinicAdditionalTF1.enabled = YES;
        clinicAdditionalTF2.enabled = YES;
        clinicAdditionalTF3.enabled = YES;
        clinicAdditionalTF4.enabled = YES;
        clinicAdditionalTF5.enabled = YES;
        clinicAdditionalTF6.enabled = YES;
        clinicAdditionalTF7.enabled = YES;
        clinicAdditionalTF8.enabled = YES;
        */
        
        physicianAdditionTF1.enabled = YES;
        physicianAdditionTF2.enabled = YES;
        physicianAdditionTF3.enabled = YES;
        physicianAdditionTF4.enabled = YES;
        physicianAdditionTF5.enabled = YES;
        physicianAdditionTF6.enabled = YES;
        physicianAdditionTF7.enabled = YES;
        physicianAdditionTF8.enabled = YES;
        
        
        dateAdditionalTF1.enabled = YES;
        dateAdditionalTF2.enabled = YES;
        dateAdditionalTF3.enabled = YES;
        dateAdditionalTF4.enabled = YES;
        dateAdditionalTF5.enabled = YES;
        dateAdditionalTF6.enabled = YES;
        dateAdditionalTF7.enabled = YES;
        dateAdditionalTF8.enabled = YES;
        
        vNameTF1.enabled = YES;
        vNameTF2.enabled = YES;
        vNameTF3.enabled = YES;
        vNameTF4.enabled = YES;
        vNameTF5.enabled = YES;
        vNameTF6.enabled = YES;
        vNameTF7.enabled = YES;
        vNameTF8.enabled = YES;
        
        descriptionTF1.enabled = YES;
        descriptionTF2.enabled = YES;
        descriptionTF3.enabled = YES;
        descriptionTF4.enabled = YES;
        descriptionTF5.enabled = YES;
        descriptionTF6.enabled = YES;
        descriptionTF7.enabled = YES;
        descriptionTF8.enabled = YES;
        
        physicianAdditionTF1.placeholder = @"Physician ID";
        physicianAdditionTF2.placeholder = @"Physician ID";
        physicianAdditionTF3.placeholder = @"Physician ID";
        physicianAdditionTF4.placeholder = @"Physician ID";
        physicianAdditionTF5.placeholder = @"Physician ID";
        physicianAdditionTF6.placeholder = @"Physician ID";
        physicianAdditionTF7.placeholder = @"Physician ID";
        physicianAdditionTF8.placeholder = @"Physician ID";
        
    }

}

-(void)UpdateAdditionalMileStoneForEachRecordByRecordID:(NSString *)recordID andData:(NSMutableArray *)data
{
    NSString *getVaccine = @"N";
    if(![[data objectAtIndex:3] isEqualToString:@""])
    {
        getVaccine = @"Y";
    }
    
    [Children EditRecordForAdditionalVaccineByRecordID:recordID andChildrenID:cID andVaccineName:[data objectAtIndex:0] andDescription:[data objectAtIndex:1] andTakenDate:[data objectAtIndex:3] andTaken:getVaccine andPhysician:[data objectAtIndex:2]];
}

-(void)UpdateAdditionalMileStone
{
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:0] andData:[[NSMutableArray alloc] initWithObjects:vNameTF1.text, descriptionTF1.text, physicianAdditionTF1.text, dateAdditionalTF1.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:1] andData:[[NSMutableArray alloc] initWithObjects:vNameTF2.text, descriptionTF2.text, physicianAdditionTF2.text, dateAdditionalTF2.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:2] andData:[[NSMutableArray alloc] initWithObjects:vNameTF3.text, descriptionTF3.text, physicianAdditionTF3.text, dateAdditionalTF3.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:3] andData:[[NSMutableArray alloc] initWithObjects:vNameTF4.text, descriptionTF4.text, physicianAdditionTF4.text, dateAdditionalTF4.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:4] andData:[[NSMutableArray alloc] initWithObjects:vNameTF5.text, descriptionTF5.text, physicianAdditionTF5.text, dateAdditionalTF5.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:5] andData:[[NSMutableArray alloc] initWithObjects:vNameTF6.text, descriptionTF6.text, physicianAdditionTF6.text, dateAdditionalTF6.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:6] andData:[[NSMutableArray alloc] initWithObjects:vNameTF7.text, descriptionTF7.text, physicianAdditionTF7.text, dateAdditionalTF7.text, nil]];
    [self UpdateAdditionalMileStoneForEachRecordByRecordID:[recordIDAdditional objectAtIndex:7] andData:[[NSMutableArray alloc] initWithObjects:vNameTF8.text, descriptionTF8.text, physicianAdditionTF8.text, dateAdditionalTF8.text, nil]];
}

-(void)setCheckBoxForAdditionalVaccine:(UIButton *)checkBtn andTaken:(NSString *)taken
{



    if([taken isEqualToString:@"Y"])
    {
        [checkBtn setImage:[UIImage imageNamed:@"checkbox1.png"] forState:UIControlStateNormal];
    }
    else
    {
        [checkBtn setImage:[UIImage imageNamed:@"checkbox0.png" ] forState:UIControlStateNormal];
    }
}
-(void)loadAdditionalMilestone
{
    result = [Children GetAdditionalRecordByChildID:cID];
    vNameTF1.text = [[result objectAtIndex:0] objectAtIndex:0];
    vNameTF2.text = [[result objectAtIndex:1] objectAtIndex:0];
    vNameTF3.text = [[result objectAtIndex:2] objectAtIndex:0];
    vNameTF4.text = [[result objectAtIndex:3] objectAtIndex:0];
    vNameTF5.text = [[result objectAtIndex:4] objectAtIndex:0];
    vNameTF6.text = [[result objectAtIndex:5] objectAtIndex:0];
    vNameTF7.text = [[result objectAtIndex:6] objectAtIndex:0];
    vNameTF8.text = [[result objectAtIndex:7] objectAtIndex:0];
    
    descriptionTF1.text = [[result objectAtIndex:0] objectAtIndex:1];
    descriptionTF2.text = [[result objectAtIndex:1] objectAtIndex:1];
    descriptionTF3.text = [[result objectAtIndex:2] objectAtIndex:1];
    descriptionTF4.text = [[result objectAtIndex:3] objectAtIndex:1];
    descriptionTF5.text = [[result objectAtIndex:4] objectAtIndex:1];
    descriptionTF6.text = [[result objectAtIndex:5] objectAtIndex:1];
    descriptionTF7.text = [[result objectAtIndex:6] objectAtIndex:1];
    descriptionTF8.text = [[result objectAtIndex:7] objectAtIndex:1];
    
    dateAdditionalTF1.text = [[result objectAtIndex:0] objectAtIndex:2];
    dateAdditionalTF2.text = [[result objectAtIndex:1] objectAtIndex:2];
    dateAdditionalTF3.text = [[result objectAtIndex:2] objectAtIndex:2];
    dateAdditionalTF4.text = [[result objectAtIndex:3] objectAtIndex:2];
    dateAdditionalTF5.text = [[result objectAtIndex:4] objectAtIndex:2];
    dateAdditionalTF6.text = [[result objectAtIndex:5] objectAtIndex:2];
    dateAdditionalTF7.text = [[result objectAtIndex:6] objectAtIndex:2];
    dateAdditionalTF8.text = [[result objectAtIndex:7] objectAtIndex:2];
    
    [self setCheckBoxForAdditionalVaccine:checkAdditional1 andTaken:[[result objectAtIndex:0] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional2 andTaken:[[result objectAtIndex:1] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional3 andTaken:[[result objectAtIndex:2] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional4 andTaken:[[result objectAtIndex:3] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional5 andTaken:[[result objectAtIndex:4] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional6 andTaken:[[result objectAtIndex:5] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional7 andTaken:[[result objectAtIndex:6] objectAtIndex:3]];
    [self setCheckBoxForAdditionalVaccine:checkAdditional8 andTaken:[[result objectAtIndex:7] objectAtIndex:3]];
    
    physicianAdditionTF1.text = [Children GetPhysicianNameByID:[[result objectAtIndex:0] objectAtIndex:4]];
    physicianAdditionTF2.text = [Children GetPhysicianNameByID:[[result objectAtIndex:1] objectAtIndex:4]];
    physicianAdditionTF3.text = [Children GetPhysicianNameByID:[[result objectAtIndex:2] objectAtIndex:4]];
    physicianAdditionTF4.text = [Children GetPhysicianNameByID:[[result objectAtIndex:3] objectAtIndex:4]];
    physicianAdditionTF5.text = [Children GetPhysicianNameByID:[[result objectAtIndex:4] objectAtIndex:4]];
    physicianAdditionTF6.text = [Children GetPhysicianNameByID:[[result objectAtIndex:5] objectAtIndex:4]];
    physicianAdditionTF7.text = [Children GetPhysicianNameByID:[[result objectAtIndex:6] objectAtIndex:4]];
    physicianAdditionTF8.text = [Children GetPhysicianNameByID:[[result objectAtIndex:7] objectAtIndex:4]];
    
    clinicAdditionalTF1.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:0] objectAtIndex:4]];
    clinicAdditionalTF2.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:1] objectAtIndex:4]];
    clinicAdditionalTF3.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:2] objectAtIndex:4]];
    clinicAdditionalTF4.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:3] objectAtIndex:4]];
    clinicAdditionalTF5.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:4] objectAtIndex:4]];
    clinicAdditionalTF6.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:5] objectAtIndex:4]];
    clinicAdditionalTF7.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:6] objectAtIndex:4]];
    clinicAdditionalTF8.text = [Children GetPhysicianClinicByPhysicianID:[[result objectAtIndex:7] objectAtIndex:4]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Popover for MileStone Tab
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

// PopViewControllerDelegate callback function
- (void)dismissPop:(NSString *)value {
    milestoneTabNo = [NSString stringWithFormat:@"%@",value];
    [[currentPopoverSegue popoverController] dismissPopoverAnimated: YES]; // dismiss the popover
    //NSLog(@"Milestone number: %@", milestoneTabNo);
    
    //scroll View to the selected milestone
    if ([milestoneTabNo isEqualToString:@"1"]){
        [self.scrollView setContentOffset:CGPointMake(0, 49)];
    }
    else if ([milestoneTabNo isEqualToString:@"2"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 428)];
    }
    else if ([milestoneTabNo isEqualToString:@"3"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 869)];
    }
    else if ([milestoneTabNo isEqualToString:@"4"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 1309)];
    }
    else if ([milestoneTabNo isEqualToString:@"5"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 1743)];
    }
    else if ([milestoneTabNo isEqualToString:@"6"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 2181)];
    }
    else if ([milestoneTabNo isEqualToString:@"7"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 2571)];
    }
    else if ([milestoneTabNo isEqualToString:@"8"])
    {
        [self.scrollView setContentOffset:CGPointMake(0, 3465)];
    }

}

- (void)dismissNotePop:(NSString *)value {
    [[currentPopoverSegue popoverController] dismissPopoverAnimated: YES]; // dismiss the popover
    //NSLog(@"Milestone number: %@", milestoneTabNo);
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"Record2Search"]) {
        SearchVC *searchVC = [segue destinationViewController];
        searchVC.stringPhysicianID = pID;
        
    }
    else if([[segue identifier] isEqualToString:@"Record2Child"]) {
        
        ChildVC *childVC = [segue destinationViewController];
        childVC.physician = physician;
        childVC.cID = cID;
        childVC.stringPhysicianID = pID;
    }
    else if([[segue identifier] isEqualToString:@"Record2Growth"]) {
        
        GrowthViewController *growthVC = [segue destinationViewController];
        growthVC.cID = cID;
        growthVC.childName = childName;
        growthVC.pID = pID;
        growthVC.dob = dob;
        growthVC.physician = physician;
    }
    else if ([[segue identifier] isEqualToString:@"Record2MilestoneTab"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        pvc = [segue destinationViewController];
        [pvc setDelegate:self];
        //[pvc setStrPassedValue:[tfUserText text]];
    }
    else if ([[segue identifier] isEqualToString:@"NoteBirth2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"Birth";
        notePopoverVC.edit = [edit objectAtIndex:0];

    }
    else if ([[segue identifier] isEqualToString:@"Note6Weeks2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"6 Weeks";
        notePopoverVC.edit = [edit objectAtIndex:1];
    }
    else if ([[segue identifier] isEqualToString:@"Note10Weeks2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"10 Weeks";
        notePopoverVC.edit = [edit objectAtIndex:2];
    }
    else if ([[segue identifier] isEqualToString:@"Note14Weeks2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"14 Weeks";
        notePopoverVC.edit = [edit objectAtIndex:3];
    }
    else if ([[segue identifier] isEqualToString:@"Note9Months2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"9-12 Months";
        notePopoverVC.edit = [edit objectAtIndex:4];
    }
    else if ([[segue identifier] isEqualToString:@"Note15Months2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"15-18 Months";
        notePopoverVC.edit = [edit objectAtIndex:5];
    }
    else if ([[segue identifier] isEqualToString:@"Note2Years2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"2-19 Years";
        notePopoverVC.edit = [edit objectAtIndex:6];
    }
    else if ([[segue identifier] isEqualToString:@"NoteAdditonal2NotePover"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        notePopoverVC = [segue destinationViewController];
        [notePopoverVC setDelegate:self];
        notePopoverVC.cID = cID;
        notePopoverVC.ageRange = @"ADDITIONAL VACCINES";
        notePopoverVC.edit = [edit objectAtIndex:7];
    }
    
}


- (IBAction)actionButtonHome:(id)sender {
    
    [self performSegueWithIdentifier:@"Record2Search" sender:self];
}

- (IBAction)actionButtonChildInformation:(id)sender {
    
    [self performSegueWithIdentifier:@"Record2Child" sender:self];
}

- (IBAction)actionButtonGrowChart:(id)sender {
    [self performSegueWithIdentifier:@"Record2Growth" sender:self];
}

- (IBAction)actionButtonLogout:(id)sender {
    
    [self performSegueWithIdentifier:@"Record2Welcome" sender:self];
}

//Change type edit Button

-(void)changeTypeEditWithButton:(UIButton *)editBtn andIndex:(int)index
{
    if([[edit objectAtIndex:index] isEqualToString:@"N"])
    {
        [edit replaceObjectAtIndex:index withObject:@"Y"];
        [editBtn setImage:[UIImage imageNamed:@"confirm tab.png"] forState:UIControlStateNormal];
    }
    else if([[edit objectAtIndex:index] isEqualToString:@"Y"])
    {
        [edit replaceObjectAtIndex:index withObject:@"N"];
        [editBtn setImage:[UIImage imageNamed:@"Edit.png"] forState:UIControlStateNormal];
    }
        
}

//Return Date
-(void)EditReturnDate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Returned Date" message:@"Enter New Return Date" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    returnedDate = [alertView textFieldAtIndex:0];
    returnedDate.placeholder = @"mm/dd/yyyy";
    
    if([title isEqualToString:@"OK"])
    {
        if ([returnedDate.text isEqualToString:@""])
        {
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Returned Date is not empty" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert1 show];
        }
        else{
            [Children UpdateReturnDateByChildrenID:cID andReturnDate:returnedDate.text];
        }
    }

    
}

//Edit action
- (IBAction)editBirth:(id)sender {
    if([[edit objectAtIndex:0] isEqualToString:@"Y"])
    {
        [self UpdateBirthMileStone];
        [self EditReturnDate];
    }
    [self changeTypeEditWithButton:editBirthBtn andIndex:0];
    [self enableEditForBirthMileStone];
    [self loadBirthMilestone];
}

- (IBAction)edit6Weeks:(id)sender {
    if([[edit objectAtIndex:1] isEqualToString:@"Y"])
    {
        [self Update6WeeksMileStone];
        [self EditReturnDate];
    }
    [self changeTypeEditWithButton:edit6WeeksBtn andIndex:1];
    [self enableEditFor6WeeksMileStone];
    [self load6WeeksMilestone];

}
- (IBAction)edit10Weeks:(id)sender {
    if([[edit objectAtIndex:2] isEqualToString:@"Y"])
    {
        [self Update10WeeksMileStone];
        //[self EditReturnDate];
    }
    [self changeTypeEditWithButton:edit10WeeksBtn andIndex:2];
    [self enableEditFor10WeeksMileStone];
    [self load10WeeksMilestone];
}
- (IBAction)edit14Weeks:(id)sender {
    if([[edit objectAtIndex:3] isEqualToString:@"Y"])
    {
        [self Update14WeeksMileStone];
        //[self EditReturnDate];
    }
    [self changeTypeEditWithButton:edit14WeeksBtn andIndex:3];
    [self enableEditFor14WeeksMileStone];
    [self load14WeeksMilestone];
}
- (IBAction)edit9Months:(id)sender {
    if([[edit objectAtIndex:4] isEqualToString:@"Y"])
    {
        [self Update9MonthsMileStone];
        //[self EditReturnDate];
    }
    [self changeTypeEditWithButton:edit9MonthsBtn andIndex:4];
    [self enableEditFor9MonthsMileStone];
    [self load9MonthsMilestone];

}
- (IBAction)edit15Months:(id)sender {
    if([[edit objectAtIndex:5] isEqualToString:@"Y"])
    {
        [self Update15MonthsMileStone];
        //[self EditReturnDate];
    }
    [self changeTypeEditWithButton:edit15MonthsBtn andIndex:5];
    [self enableEditFor15MonthsMileStone];
    [self load15MonthsMilestone];
}
- (IBAction)edit2Years:(id)sender {
    if([[edit objectAtIndex:6] isEqualToString:@"Y"])
    {
        [self Update2YearsMileStone];
        //[self EditReturnDate];
    }
    [self changeTypeEditWithButton:edit2YearsBtn andIndex:6];
    [self enableEditFor2YearsMileStone];
    [self load2YearsMilestone];
}
- (IBAction)editAditional:(id)sender {
    if([[edit objectAtIndex:7] isEqualToString:@"Y"])
    {
        [self UpdateAdditionalMileStone];
        //[self EditReturnDate];
    }
    [self changeTypeEditWithButton:editAddtitionalBtn andIndex:7];
    [self enableEditForAdditionalMileStone];
    [self loadAdditionalMilestone];
}
@end
