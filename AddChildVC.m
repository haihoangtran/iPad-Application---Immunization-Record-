//
//  AddChildVC.m
//  Immunization
//
//  Created by trex on 10/16/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "AddChildVC.h"
#import "Children.h"
#import "SearchVC.h"

@interface AddChildVC ()

@end

@implementation AddChildVC

@synthesize cIDTF,lNameTF, mNameTF,fNameTF, DOBTF, gender, placeTF, motherTF, fatherTF, addressTF, cityTF, stateTF, zipCodeTF, phoneTF, eContactTF, ePhoneTF, pIDTF, allergieTF;
@synthesize  genderSeg, datePicker, stringPhysicianID;

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
    //scrollView
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(1024, 870)];
	
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //load Background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2-1024.png"]];
    
    gender = @"M";
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 325, 250)];
  	datePicker.datePickerMode = UIDatePickerModeDate;
  	datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    [DOBTF setInputView:datePicker];
    [datePicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];

    [pIDTF setText:stringPhysicianID];
}

-(void)dismissKeyboard {
    // list all fields here
    [cIDTF resignFirstResponder];
    [lNameTF resignFirstResponder];
    [mNameTF resignFirstResponder];
    [fNameTF resignFirstResponder];
    [DOBTF resignFirstResponder];
    [placeTF resignFirstResponder];
    [motherTF resignFirstResponder];
    [fatherTF resignFirstResponder];
    [addressTF resignFirstResponder];
    [cityTF resignFirstResponder];
    [stateTF resignFirstResponder];
    [zipCodeTF resignFirstResponder];
    [phoneTF resignFirstResponder];
    [eContactTF resignFirstResponder];
    [ePhoneTF resignFirstResponder];
    [pIDTF resignFirstResponder];
    [allergieTF resignFirstResponder];
}

//text Field move up when it is touched
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 100);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (BOOL)validateInputWithStringAndNumberForID:(NSString *)aString
{
    NSString * const regularExpression = @"^[a-zA-Z0-9]{0,250}$";
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
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@) and No Space", @"a-z, A-Z, 0-9" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
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

- (BOOL)validateInputWithString:(NSString *)aString
{
    NSString * const regularExpression = @"^[a-zA-Z ]{0,250}$";
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
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@)", @"a-z, A-Z" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
}

- (BOOL)validateInputWithStringAndSpecialCharacter:(NSString *)aString
{
    NSString * const regularExpression = @"^[a-zA-Z, ]{0,250}$";
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
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@)", @"a-z, A-Z, ," ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
}

- (BOOL)validateInputWithNumber:(NSString *)aString
{
    NSString * const regularExpression = @"^[0-9- ]{0,250}$";
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
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@)", @"0-9, -" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if(textField == cIDTF)
        return [self validateInputWithStringAndNumberForID:textField.text];
    else if(textField == phoneTF || textField == ePhoneTF || textField == zipCodeTF)
        return [self validateInputWithNumber:textField.text];
    else if(textField == placeTF)
        return [self validateInputWithStringAndSpecialCharacter:textField.text];
    else if (textField == DOBTF)
        return YES;
    else if(textField == addressTF || textField == allergieTF ||textField == eContactTF)
        return [self validateInputWithStringAndNumber:textField.text];
    else
        return [self validateInputWithString:textField.text];
}

- (void)changeDateInLabel:(id)sender{
    
    //Use NSDateFormatter to write out the date in a friendly format
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    DOBTF.text = [NSString stringWithFormat:@"%@", [df stringFromDate:datePicker.date]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) checkIfAllFieldsFilledOut {
    
    if ([cIDTF.text isEqualToString:@""] || [lNameTF.text isEqualToString:@""] || [fNameTF.text isEqualToString:@""] || [DOBTF.text isEqualToString:@""] || [motherTF.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Extra information needed"
                                                          message:@"Please fill out all the required fields"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        
        return FALSE;
    }
    
    return TRUE;
}

- (IBAction)genderBtn:(id)sender {
    
    switch (genderSeg.selectedSegmentIndex) {
        case 0:
            gender = @"M";
            break;
            
        case 1:
            gender = @"F";
            break;
    }
}

- (IBAction)actionButtonCancel:(id)sender {
    [self performSegueWithIdentifier:@"AddChild2Search" sender:self];
}

-(void)createRecordAndNoteForNewChild
{
    //CREATE RECORD
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"BCG" andDescription:@"BACILLUS CALMETTE-DUERIN" andAgeRange:@"BIRTH"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"HEP B" andDescription:@"HEPATITIS B" andAgeRange:@"BIRTH"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andAgeRange:@"BIRTH"];
    
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andAgeRange:@"6 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PENTA" andDescription:@"PENTAVALENT COMBINATION" andAgeRange:@"6 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andAgeRange:@"6 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"RV" andDescription:@"ORAL ROTAVIRUS" andAgeRange:@"6 WEEKS"];
    
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andAgeRange:@"10 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PENTA" andDescription:@"PENTAVALENT COMBINATION" andAgeRange:@"10 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andAgeRange:@"10 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"RV" andDescription:@"ORAL ROTAVIRUS" andAgeRange:@"10 WEEKS"];
    
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"OPV" andDescription:@"ORAL POLIOVIRUS" andAgeRange:@"14 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PENTA" andDescription:@"PENTAVALENT COMBINATION" andAgeRange:@"14 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andAgeRange:@"14 WEEKS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"RV" andDescription:@"ORAL ROTAVIRUS" andAgeRange:@"14 WEEKS"];
    
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"PCV" andDescription:@"PNEUMOCOCCAL CONJUGATE" andAgeRange:@"9-12 MONTHS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"MR" andDescription:@"MEASLES AND RUBELLA" andAgeRange:@"9-12 MONTHS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"HIB" andDescription:@"HAEMOPHILUS INFLUENZA" andAgeRange:@"9-12 MONTHS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"HEB A" andDescription:@"HEPATITIS A" andAgeRange:@"9-12 MONTHS"];
    
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"MR" andDescription:@"MEASLES AND RUBELLA" andAgeRange:@"15-18 MONTHS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"HEB A" andDescription:@"HEPATITIS A" andAgeRange:@"15-18 MONTHS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"DTap" andDescription:@"DIPHTHERIA, TETANUS, AND ACELLULAR PERTUSSIS" andAgeRange:@"15-18 MONTHS"];
    
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"MR" andDescription:@"MEASLES AND RUBELLA" andAgeRange:@"4-6 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"VARIVAX" andDescription:@"VARICELLA CHICKENPOX" andAgeRange:@"4-6 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"DTap" andDescription:@"DIPHTHERIA, TETANUS, AND ACELLULAR PERTUSSIS" andAgeRange:@"4-6 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"IPV" andDescription:@"INACTIVATED POLIOVIRUS" andAgeRange:@"4-6 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"DTap" andDescription:@"DIPHTHERIA, TETANUS, AND ACELLULAR PERTUSSIS" andAgeRange:@"11-12 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"MCV4" andDescription:@"MENINGOCOCCAL VACCINE" andAgeRange:@"11-12 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"HPV" andDescription:@"HUMAN PAPILLOMAVIRUS" andAgeRange:@"11-12 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"MCV4" andDescription:@"MENINGOCOCCAL VACCINE" andAgeRange:@"13-19 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"HPV" andDescription:@"HUMAN PAPILLOMAVIRUS" andAgeRange:@"13-19 YEARS"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    [Children AddNewRecordByChildrenID:cIDTF.text andVaccineName:@"" andDescription:@"" andAgeRange:@"ADDITIONAL VACCINE"];
    
    //Create Note
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"BIRTH"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"6 WEEKS"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"10 WEEKS"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"14 WEEKS"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"9-12 MONTHS"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"15-18 MONTHS"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"2-19 YEARS"];
    [Children AddNoteByChildID:cIDTF.text andAgeRange:@"ADDITIONAL VACCINES"];
    
    //Add growth
    [Children AddGrowthByChildID:cIDTF.text];
}

- (IBAction)actionButtonEnter:(id)sender {
    
    // Check Emty Text Field
    NSMutableDictionary *newChildInfo = [[NSMutableDictionary alloc] init];
    [newChildInfo addEntriesFromDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                            cIDTF.text, @"Identifier",
                                            fNameTF.text, @"First Name",
                                            lNameTF.text, @"Last Name",
                                            DOBTF.text, @"Day of Birth",
                                            placeTF.text, @"Place of Birth",
                                            allergieTF.text, @"allergies",
                                            motherTF.text, @"MOther Name",
                                            fatherTF.text, @"Father Name",
                                            addressTF.text, @"Address",
                                            cityTF.text, @"City",
                                            stateTF.text, @"State",
                                            zipCodeTF.text, @"Zip Code",
                                            phoneTF.text, @"Phone Number",
                                            pIDTF.text, @"Physician ID",
                                            nil]];
    
    if ([self checkIfAllFieldsFilledOut]) {
        
        if([Children PhysicianExistwithID:pIDTF.text] == NO)
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: [NSString stringWithFormat:@"Not Found the Physician ID: %@", pIDTF.text] delegate: nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
            [alert show];
        }
        
        //should pop up an alert prompting that a child record has been created successfully with ID ######
        NSMutableArray *newChild = [[NSMutableArray alloc] initWithObjects:cIDTF.text, fNameTF.text, lNameTF.text, mNameTF.text, gender, DOBTF.text, placeTF.text, allergieTF.text, @"", @"", motherTF.text, fatherTF.text, phoneTF.text, addressTF.text, cityTF.text, stateTF.text, zipCodeTF.text, eContactTF.text, ePhoneTF.text, pIDTF.text, nil];
        NSString *message = [Children CreateNewChildInformation:@"Children" newData:newChild];
        
        if ([message isEqualToString:@"Successfully"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Successful" message: [NSString stringWithFormat:@"Add successfully a child with ID: %@!", cIDTF.text] delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            //Create Record and note for each new child
            [self createRecordAndNoteForNewChild];
            [self performSegueWithIdentifier:@"AddChild2Search" sender:self];
        }
        else if([message isEqualToString:@"column cID is not unique"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"ID is already existed" delegate: nil cancelButtonTitle:@"Try again" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (IBAction)actionButtonLogout:(id)sender {
    
    [self performSegueWithIdentifier:@"AddChild2Welcome" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([[segue identifier] isEqualToString:@"AddChild2Search"] || [[segue identifier] isEqualToString:@"AddChild2SearchWithConfirm"]) {
        
        SearchVC *svc = [segue destinationViewController];
        svc.stringPhysicianID = stringPhysicianID;
    }
}

@end
