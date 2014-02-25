//
//  AddGrowthPopoverViewController.m
//  immunization
//
//  Created by Test on 11/5/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "AddGrowthPopoverViewController.h"
#import "Children.h"

@interface AddGrowthPopoverViewController ()

@end

@implementation AddGrowthPopoverViewController
@synthesize delegate;
@synthesize cID;
@synthesize headTF,weightTF, heightTF;
@synthesize age, agePicker, ageArray;


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
	// Do any additional setup after loading the view.//pickerView
    self.agePicker.delegate=self;
    self.agePicker.dataSource=self;
    
    self.ageArray = [[NSArray alloc] initWithObjects:@"BIRTH", @"6 WEEKS", @"10 WEEKS", @"14 WEEKS", @"9-12 MONTHS", @"15-18 MONTHS", @"2-19 YEARS",nil];
    
    age = @"BIRTH";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validateInputWithString:(NSString *)aString
{
    NSString * const regularExpression = @"^[0-9]{0,30}$";
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
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@) and No Space", @"0-9" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return [self validateInputWithString:textField.text];
    
}

#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.ageArray count];
}

#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.ageArray objectAtIndex:row];
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //Let's print in the console what the user had chosen;
    age = [NSString stringWithFormat:@"%@", [self.ageArray objectAtIndex:row]];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)addBtn:(id)sender {
    [Children UPdateGrowthByChildrenID:cID andAgeRange:age andHeight:heightTF.text andWeight:weightTF.text andHeadSize:headTF.text];
    [delegate dismissAddGrowthPop:@""];  // make delegate callback here
}
@end
