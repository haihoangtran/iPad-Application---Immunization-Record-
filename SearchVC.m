//
//  SearchVC.m
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "SearchVC.h"
#import "ResultsVC.h"
#import "Children.h"
#import "AddChildVC.h"

@interface SearchVC ()

@end

@implementation SearchVC
@synthesize result, pInfo;
@synthesize idTF, lNameTF, fNameTF, mNameTF, stringPhysicianID;
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

    //load Background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1-1024.png"]];
    
    
    result = [[NSMutableArray alloc] init];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    
    // list all fields here
    [idTF resignFirstResponder];
    [lNameTF resignFirstResponder];
    [fNameTF resignFirstResponder];
    [mNameTF resignFirstResponder];
}

//text Field move up when it is touched
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 100);
    [scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}

- (BOOL)validateInputWithStringAndNumber:(NSString *)aString
{
    NSString * const regularExpression = @"^[a-zA-Z0-9]{0,100}$";
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
    NSString * const regularExpression = @"^[a-zA-Z]{0,100}$";
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

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if(textField == idTF)
        return [self validateInputWithStringAndNumber:textField.text];
    else
        return [self validateInputWithString:textField.text];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"Search2Result"]){
        ResultsVC *resultVC = [segue destinationViewController];
        resultVC.result = result;
        resultVC.idFromSearch = idTF.text;
        resultVC.lNameFromSearch = lNameTF.text;
        resultVC.fNameFromSearch = fNameTF.text;
        resultVC.mNameFromSearch = mNameTF.text;
        resultVC.stringPhysicianID = stringPhysicianID;
    }
    else if ([[segue identifier] isEqualToString:@"Search2AddChild"]) {
        
        AddChildVC *acvc = [segue destinationViewController];
        acvc.stringPhysicianID = stringPhysicianID;
    }
}

- (IBAction)search:(id)sender {
    
    NSMutableDictionary *searchInfo = [[NSMutableDictionary alloc] init];
    [searchInfo addEntriesFromDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                          idTF.text, @"cID",
                                          lNameTF.text, @"lastName",
                                          fNameTF.text, @"firstName",
                                          mNameTF.text, @"motherName",
                                          nil]];
    
    result = [Children Search:searchInfo];
    
    if ([result count ] <= 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"No child is matched!" delegate: nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [self performSegueWithIdentifier:@"Search2Result" sender:self];
    }
}

- (IBAction)actionButtonLogout:(id)sender {
    
    [self performSegueWithIdentifier:@"Search2Welcome" sender:self];
}

- (IBAction)actionButtonNewChildEntry:(id)sender {
    
    [self performSegueWithIdentifier:@"Search2AddChild" sender:self];
}

@end

