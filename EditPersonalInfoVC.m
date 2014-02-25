//
//  EditPersonalInfoVC.m
//  Immunization
//
//  Created by trex on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "EditPersonalInfoVC.h"
#import "Children.h"
#import "ChildVC.h"


@interface EditPersonalInfoVC ()

@end

@implementation EditPersonalInfoVC

//@synthesize gender, cID, childInfo;
//@synthesize cIDTF, fNameTF, lNameTF, mNameTF, DOBTF, placeTF, allergiesTF, motherTF, fatherTF, addressTF, cityTF, stateTF,zipCodeTF,eContactTF, ePhoneTF,pIDTF, genderSeg, datePicker;

@synthesize gender, cID, childInfo, stringPhysicianID;
@synthesize cIDTF, fNameTF, lNameTF, mNameTF, DOBTF, placeTF, allergiesTF, motherTF, fatherTF, addressTF, cityTF, stateTF,zipCodeTF,eContactTF, ePhoneTF,pIDTF, genderSeg, datePicker;

@synthesize scrollView;

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
    [self.scrollView setContentSize:CGSizeMake(1024, 1300)];
                                     
    //load Background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1-1024.png"]];
    
    
    
    // dismiss keyboard when touched anywhere on screen
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

    // fill out the fields based on what is passed from the childVC view
    cIDTF.text = [childInfo objectAtIndex:0];
    fNameTF.text = [childInfo objectAtIndex:1];
    mNameTF.text = [childInfo objectAtIndex:21];
    lNameTF.text = [childInfo objectAtIndex:2];
    gender = [childInfo objectAtIndex:4];
    if ([gender isEqualToString:@"M"]) {
        genderSeg.selectedSegmentIndex = 0;
    }
    else {
        genderSeg.selectedSegmentIndex = 1;
    }
    DOBTF.text = [childInfo objectAtIndex:3];
    placeTF.text = [childInfo objectAtIndex:5];
    motherTF.text = [childInfo objectAtIndex:8];
    fatherTF.text = [childInfo objectAtIndex:9];
    addressTF.text = [childInfo objectAtIndex:10];
    cityTF.text = [childInfo objectAtIndex:11];
    stateTF.text = [childInfo objectAtIndex:12];
    zipCodeTF.text = [childInfo objectAtIndex:13];
    
    pIDTF.text = [childInfo objectAtIndex:20];
    eContactTF.text = [childInfo objectAtIndex:14];
    ePhoneTF.text = [childInfo objectAtIndex:15];
    allergiesTF.text = [childInfo objectAtIndex:6];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 325, 250)];
  	datePicker.datePickerMode = UIDatePickerModeDate;
  	datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    [DOBTF setInputView:datePicker];
    [datePicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];
}

// dismiss keyboard method
-(void)dismissKeyboard {
    
    // list all fields here
    [cIDTF resignFirstResponder];
    [fNameTF resignFirstResponder];
    [lNameTF resignFirstResponder];
    [mNameTF resignFirstResponder];
    [DOBTF resignFirstResponder];
    [placeTF resignFirstResponder];
    [allergiesTF resignFirstResponder];
    [motherTF resignFirstResponder];
    [fatherTF resignFirstResponder];
    [addressTF resignFirstResponder];
    [cityTF resignFirstResponder];
    [stateTF resignFirstResponder];
    [zipCodeTF resignFirstResponder];
    [eContactTF resignFirstResponder];
    [ePhoneTF resignFirstResponder];
    [pIDTF resignFirstResponder];
}

//text Field move up when it is touched
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y -100);
    [scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y - 100) animated:YES];
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
    if(textField == pIDTF)
        return [self validateInputWithStringAndNumberForID:textField.text];
    else if(textField == ePhoneTF || textField == zipCodeTF)
        return [self validateInputWithNumber:textField.text];
    else if(textField == placeTF)
        return [self validateInputWithStringAndSpecialCharacter:textField.text];
    else if (textField == DOBTF)
        return YES;
    else if(textField == addressTF || textField == allergiesTF ||textField == eContactTF)
        return [self validateInputWithStringAndNumber:textField.text];
    else
        return [self validateInputWithString:textField.text];
}

-(void)viewWillDisappear:(BOOL)animated{

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

- (IBAction)actionButtonCancelChanges:(id)sender {
    
    [self performSegueWithIdentifier:@"Edit2ChildWithNoChanges" sender:self];
}

- (IBAction)actionButtonConfirmChanges:(id)sender {
    
    NSMutableDictionary *newChildInfo = [[NSMutableDictionary alloc] init];
    //NSLog(@"newChildInfo before data transfer = %@", newChildInfo);
    [newChildInfo addEntriesFromDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                            cIDTF.text, @"cID",
                                            fNameTF.text, @"firstName",
                                            lNameTF.text, @"lastName",
                                            mNameTF.text, @"middleInitial",
                                            gender, @"gender",
                                            DOBTF.text, @"DOB",
                                            placeTF.text, @"placeOfBirth",
                                            allergiesTF.text, @"allergies",
                                            motherTF.text, @"motherName",
                                            fatherTF.text, @"fatherName",
                                            addressTF.text, @"address",
                                            cityTF.text, @"city",
                                            stateTF.text, @"state",
                                            zipCodeTF.text, @"zipCode",
                                            eContactTF.text, @"emergencyContact",
                                            ePhoneTF.text, @"emergencyPhoneNo",
                                            pIDTF.text, @"physicianID",
                                            nil]];
    
    
    if([Children PhysicianExistwithID:pIDTF.text] == NO)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: [NSString stringWithFormat:@"Not Found the Physician ID: %@", pIDTF.text] delegate: nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        //NSLog(@"newChildInfo in the middle of data transfer = %@", newChildInfo);
        NSString *message = [Children EditChildInformation:@"Children" childID:cID ageRange:@"" recordID:@"" newInfo:newChildInfo];
        //NSLog(@"newChildInfo after data transfer = %@", newChildInfo);
        if ([message isEqualToString:@"Successfully"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Successful" message: @"Edit successfully!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self performSegueWithIdentifier:@"Edit2Child" sender:self];
        }
        else if([message isEqualToString:@"column cID is not unique"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"ID already exists" delegate: nil cancelButtonTitle:@"Try again" otherButtonTitles:nil];
            [alert show];
        }
    }
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Yes"]) {

    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    // when "confirm" button pressed
    if ([[segue identifier] isEqualToString:@"Edit2Child"]) {
    
           }
    // when "cancel" button pressed, don 't make any changes
    else if ([[segue identifier] isEqualToString:@"Edit2ChildWithNoChanges"]) {
     
    }
    
    ChildVC *childVC = [segue destinationViewController];
    childVC.cID = cIDTF.text;
    childVC.physician = YES;
    childVC.stringPhysicianID = stringPhysicianID;
}

@end
