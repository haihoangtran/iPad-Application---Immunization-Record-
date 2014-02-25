//
//  ViewController.m
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "HomeVC.h"
#import "PhysicianHomeVC.h"
#import "Account.h"
#import "SearchVC.h"


@interface HomeVC ()

@end

@implementation HomeVC

@synthesize username, password, errorLogIn;
@synthesize physicianInfo;
@synthesize  scrollView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //load Background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1-1024.png"]];
    password.secureTextEntry = YES;
}

-(void)dismissKeyboard {
    
    // list all fields here
    [username resignFirstResponder];
    [password resignFirstResponder];
}

//text Field move up when it is touched
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 100);
    [scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//get Username and Password and check if correct
- (IBAction)physicianBtn:(id)sender {
    
    physicianInfo = [Account logIn:username.text password:password.text];
    
    //if return values from "Account", it means that the login is successful
    if ([physicianInfo count] == 4)
    {
        [self performSegueWithIdentifier:@"Welcome2Search" sender:self];
    }
    else {
        
        errorLogIn = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Wrong Username or Password. Please try again!" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorLogIn show];
    }
}

- (BOOL)validateInputWithString:(NSString *)aString
{
    NSString * const regularExpression = @"^[a-zA-Z0-9_-]{0,30}$";
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
        UIAlertView *inputError = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat: @"Please Input Valid Letter (%@)", @"a-z, A-Z, 0-9, _, -" ] delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [inputError show];
    }
    return numberOfMatches > 0;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return [self validateInputWithString:textField.text];
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    username.text = password.text = @"";
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"Welcome2Search"])
    {
        SearchVC *svc = [segue destinationViewController];
        svc.pInfo = physicianInfo;
        svc.stringPhysicianID = [physicianInfo objectAtIndex:3];
    }
}

@end
