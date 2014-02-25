//
//  ChildViewController.m
//  Immunization
//
//  Created by Test on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "ChildVC.h"
#import "Children.h"
#import "EditPersonalInfoVC.h"
#import "RecordVC.h"
#import "SearchVC.h"
#import "GrowthViewController.h"

@interface ChildVC ()

@end

@implementation ChildVC

@synthesize cID, physician, result, stringPhysicianID;
@synthesize cIDLabel, cNameLabel, DOBLabel, genderLabel, placeLabel, allergiesLabel,mNameLabel, fNameLabel, address1Label, address2Label,eContactLabel, ePhoneLabel,pNameLabel, pPhoneLabel, clinicLabel, returnLabel, labelFullNameOnToolbar, labelDobOnToolbar, labelIdOnToolbar;

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2-1024.png"]];
    
    
    [self initializeDataForView];

    if ( physician == NO)
    {
        self.navigationItem.rightBarButtonItem  = nil;
    }
}

-(void)initializeDataForView
{
    result = [Children GetChildInfomation:cID];
    
    cIDLabel.text = [result objectAtIndex:0];
    cNameLabel.text = [NSString stringWithFormat:@"%@ %@ %@", [result objectAtIndex:1], [result objectAtIndex:21], [result objectAtIndex:2]];
    DOBLabel.text = [result objectAtIndex:3];
    if([[result objectAtIndex:4] isEqualToString:@"M"]) {
        genderLabel.text = @"Male";
    }
    else {
        genderLabel.text = @"Female";
    }
    
    labelFullNameOnToolbar.text = [NSString stringWithFormat:@"%@, %@ %@", [result objectAtIndex:2], [result objectAtIndex:1], [result objectAtIndex:21]];
    labelDobOnToolbar.text = [result objectAtIndex:3];
    labelIdOnToolbar.text = [result objectAtIndex:0];
    
    placeLabel.text = [result objectAtIndex:5];
    allergiesLabel.text = [result objectAtIndex:6];
    returnLabel.text = [result objectAtIndex:7];
    mNameLabel.text = [result objectAtIndex:8];
    fNameLabel.text = [result objectAtIndex:9];
    address1Label.text = [result objectAtIndex:10];
    address2Label.text =[NSString stringWithFormat:@"%@, %@, %@", [result objectAtIndex:11], [result objectAtIndex:12], [result objectAtIndex:13]];
    eContactLabel.text = [result objectAtIndex:14];
    ePhoneLabel.text = [result objectAtIndex:15];
    pNameLabel.text = [NSString stringWithFormat:@"%@ %@", [result objectAtIndex:16], [result objectAtIndex:17]];
    pPhoneLabel.text = [result objectAtIndex:18];
    clinicLabel.text = [result objectAtIndex:19];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self initializeDataForView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonHome:(id)sender {
    
    [self performSegueWithIdentifier:@"Child2Search" sender:self];
}

- (IBAction)actionButtonVaccines:(id)sender {
    
    [self performSegueWithIdentifier:@"Child2Record" sender:self];
}

- (IBAction)actionButtonGrowChart:(id)sender {
    [self performSegueWithIdentifier:@"Children2Growth" sender:self];
}

- (IBAction)actionButtonLogout:(id)sender {

    [self performSegueWithIdentifier:@"Child2Welcome" sender:self];
}

- (IBAction)actionButtonEditPersonalInformation:(id)sender {
    
    [self performSegueWithIdentifier:@"Child2Edit" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Child2Edit"])
    {
        EditPersonalInfoVC *edit = [segue destinationViewController];
        edit.cID = cID;
        edit.childInfo = result;
        edit.stringPhysicianID = stringPhysicianID;
        //NSLog(@"count = %d", [edit.childInfo count]);
                //NSLog(@"childInfo = %@", edit.childInfo);
    }
    else if([[segue identifier] isEqualToString:@"Child2Record"])
    {
        RecordVC *recordVC = [segue destinationViewController];
        recordVC.physician = physician;
        recordVC.cID = [result objectAtIndex:0];
        recordVC.childName = [NSString stringWithFormat:@"%@, %@ %@", [result objectAtIndex:2], [result objectAtIndex:1], [result objectAtIndex:21]];;
        recordVC.pID = stringPhysicianID;
        recordVC.dob = [result objectAtIndex:3];
    }
    else if([[segue identifier] isEqualToString:@"Child2Search"]) {
        
        SearchVC *svc = [segue destinationViewController];
        svc.stringPhysicianID = stringPhysicianID;
    }
    else if([[segue identifier] isEqualToString:@"Children2Growth"]) {
        
        GrowthViewController *gvc = [segue destinationViewController];
        gvc.cID = cID;
        gvc.childName = [NSString stringWithFormat:@"%@, %@ %@", [result objectAtIndex:2], [result objectAtIndex:1], [result objectAtIndex:21]];
        gvc.pID = stringPhysicianID;
        gvc.dob = [result objectAtIndex:3];
        gvc.physician = physician;
    }
}

@end