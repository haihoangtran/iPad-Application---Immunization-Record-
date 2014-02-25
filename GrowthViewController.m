//
//  GrowthViewController.m
//  immunization
//
//  Created by Test on 11/5/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "GrowthViewController.h"
#import "Children.h"
#import "ChildVC.h"
#import "RecordVC.h"
#import "SearchVC.h"
#import "GrowthPopoverViewController.h"
#import "DrawLine.h"

@interface GrowthViewController ()

@end

@implementation GrowthViewController
@synthesize cID, childName, pID, dob, physician;
@synthesize childIDLabel, childNameLabel, DOBLabel;
@synthesize tabNumber, currentPopoverSegue, pvc;
@synthesize result, headSizeData, heightData, weightData, age, ageRange;
@synthesize lineView, chartBackGround;
@synthesize titleLabel;
@synthesize headSizeLabel, heightLabel, weightLabel;
@synthesize  labelArray1, labelArray2, labelArray3;
@synthesize label1, label2, label10, label11, label12, label13, label14, label15, label16, label17, label18, label19, label20, label21, label3, label4, label5, label6, label7, label8, label9;

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
	// Do any additional setup after loading the view.
    
    //load Background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2-1024.png"]];
    
    ageRange = [[NSMutableArray alloc] initWithObjects:@"BIRTH", @"6 WEEKS", @"10 WEEKS", @"14 WEEKS", @"9-12 MONTHS", @"15-18 MONTHS", @"2-19 YEARS", nil];
    
    //Set label for Child Information
    childNameLabel.text = childName;
    childIDLabel.text = cID;
    DOBLabel.text = dob;
    
    //tab Number
    tabNumber = @"1";
    
    //get data from database
    [self GetDataForGrowth];
    
    //setLineView
    
    [self DrawLine];
    
    //putlabel into array
    labelArray1 =[[NSMutableArray alloc]init];
    labelArray2 =[[NSMutableArray alloc]init];
    labelArray3 =[[NSMutableArray alloc]init];
    [labelArray1 addObject:label1];
    [labelArray1 addObject:label2];
    [labelArray1 addObject:label3];
    [labelArray1 addObject:label4];
    [labelArray1 addObject:label5];
    [labelArray1 addObject:label6];
    [labelArray1 addObject:label7];
    
    [labelArray2 addObject:label8];
    [labelArray2 addObject:label9];
    [labelArray2 addObject:label10];
    [labelArray2 addObject:label11];
    [labelArray2 addObject:label12];
    [labelArray2 addObject:label13];
    [labelArray2 addObject:label14];
    
    [labelArray3 addObject:label15];
    [labelArray3 addObject:label16];
    [labelArray3 addObject:label17];
    [labelArray3 addObject:label18];
    [labelArray3 addObject:label19];
    [labelArray3 addObject:label20];
    [labelArray3 addObject:label21];
    
    [self displayData];
    
}

-(void)clearTextInLabel
{
    for(int i = 0; i< 7; ++i)
    {
        [[labelArray1 objectAtIndex:i] setText:@""];
        [[labelArray2 objectAtIndex:i] setText:@""];
        [[labelArray3 objectAtIndex:i] setText:@""];
        [[labelArray1 objectAtIndex:i] setBackgroundColor:[UIColor whiteColor]];
        [[labelArray2 objectAtIndex:i] setBackgroundColor:[UIColor whiteColor]];
        [[labelArray3 objectAtIndex:i] setBackgroundColor:[UIColor whiteColor]];
    }
}

-(void)displayDataForOverallLabel
{
    titleLabel.text = @"OVERALL";
    titleLabel.textColor = [UIColor colorWithRed:103.0f/255.0f green:171.0f/255.0f blue:170.0f/255.0f alpha:1];
    headSizeLabel.hidden = NO;
    heightLabel.hidden = NO;
    weightLabel.hidden = NO;
    for(int i = 0 ; i < 7; ++i)
    {
        [[labelArray3 objectAtIndex:i] setHidden:NO];
    }
    for(int i = 0; i < [age count]; ++i)
    {
        for(int j = 0; j <[ageRange count]; ++j)
        {
            if([[age objectAtIndex:i] isEqualToString:[ageRange objectAtIndex:j]])
            {
                [[labelArray1 objectAtIndex:j] setText:[heightData objectAtIndex:i]];
                [[labelArray1 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
                [[labelArray2 objectAtIndex:j] setText:[weightData objectAtIndex:i]];
                [[labelArray2 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
                [[labelArray3 objectAtIndex:j] setText:[headSizeData objectAtIndex:i]];
                [[labelArray3 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
            }
        }
    }
}

-(void)displayDataForHeight
{
    titleLabel.text = @"HEIGHT";
    titleLabel.textColor = [UIColor colorWithRed:240.0f/255.0f green:67.0f/255.0f blue:33.0f/255.0f alpha:1];
    headSizeLabel.hidden = YES;
    heightLabel.hidden = YES;
    weightLabel.hidden = YES;
    for(int i = 0; i < [age count]; ++i)
    {
        for(int j = 0; j <[ageRange count]; ++j)
        {
            if([[age objectAtIndex:i] isEqualToString:[ageRange objectAtIndex:j]])
            {
                [[labelArray1 objectAtIndex:j] setText:[heightData objectAtIndex:i]];
                [[labelArray1 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
                [[labelArray2 objectAtIndex:j] setText:@"IN"];
                [[labelArray2 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
            }
        }
    }
    for(int i = 0 ; i < 7; ++i)
    {
        [[labelArray3 objectAtIndex:i] setHidden:YES];
    }
}

-(void)displayDataForWeight
{
    titleLabel.text = @"WEIGHT";
    titleLabel.textColor = [UIColor colorWithRed:226.0f/255.0f green:189.0f/255.0f blue:59.0f/255.0f alpha:1];
    headSizeLabel.hidden = YES;
    heightLabel.hidden = YES;
    weightLabel.hidden = YES;
    for(int i = 0; i < [weightData count]; ++i)
    {
        for(int j = 0; j <[ageRange count]; ++j)
        {
            if([[age objectAtIndex:i] isEqualToString:[ageRange objectAtIndex:j]])
            {
                [[labelArray1 objectAtIndex:j] setText:[weightData objectAtIndex:i]];
                [[labelArray1 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
                [[labelArray2 objectAtIndex:j] setText:@"Lbs"];
                [[labelArray2 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
            }
        }
    }
    for(int i = 0 ; i < 7; ++i)
    {
        [[labelArray3 objectAtIndex:i] setHidden:YES];
    }
}

-(void)displayDataForHeadSize
{
    titleLabel.text = @"HEAD SIZE";
    titleLabel.textColor = [UIColor colorWithRed:124.0f/255.0f green:87.0f/255.0f blue:154.0f/255.0f alpha:1];
    headSizeLabel.hidden = YES;
    heightLabel.hidden = YES;
    weightLabel.hidden = YES;
    for(int i = 0; i < [headSizeData count]; ++i)
    {
        for(int j = 0; j <[ageRange count]; ++j)
        {
            if([[age objectAtIndex:i] isEqualToString:[ageRange objectAtIndex:j]])
            {
                [[labelArray1 objectAtIndex:j] setText:[headSizeData objectAtIndex:i]];
                [[labelArray1 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];
                [[labelArray2 objectAtIndex:j] setText:@"IN"];
                [[labelArray2 objectAtIndex:j] setBackgroundColor:[UIColor clearColor]];            }
        }
    }
    for(int i = 0 ; i < 7; ++i)
    {
        [[labelArray3 objectAtIndex:i] setHidden:YES];
    }
}

-(void)displayData
{
    [self clearTextInLabel];
    if([tabNumber isEqualToString:@"1"])
    {
        [self displayDataForOverallLabel];
    }
    else if([tabNumber isEqualToString:@"2"])
    {
        [self displayDataForHeight];
    }
    
    else if([tabNumber isEqualToString:@"3"])
    {
        [self displayDataForWeight];
    }
    else if([tabNumber isEqualToString:@"4"])
    {
        [self displayDataForHeadSize];
    }
}

-(void)DrawLine
{
    [lineView removeFromSuperview];
    CGRect chartView = CGRectMake(459, 232, 545, 495);
    lineView = [[DrawLine alloc] initWithFrame:chartView];
    lineView.heightData = heightData;
    lineView.weightData = weightData;
    lineView.headSizeData = headSizeData;
    lineView.age = age;
    lineView.type = tabNumber;
    [self.view addSubview:lineView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Get Data from Database
-(void)GetDataForGrowth
{
    result = [Children GETGrowthByChildID:cID];
    age =[[NSMutableArray alloc]init];
    heightData =[[NSMutableArray alloc]init];
    weightData =[[NSMutableArray alloc]init];
    headSizeData =[[NSMutableArray alloc]init];
    for(int i = 0; i <[result count]; ++i)
    {
        for(int j =0; j <[result count]; ++j)
        {
            if([[[result objectAtIndex:j] objectAtIndex:1] isEqualToString:[ageRange objectAtIndex:i]])
            {
                if (![[[result objectAtIndex:j] objectAtIndex:2] isEqualToString:@""] && ![[[result objectAtIndex:j] objectAtIndex:3] isEqualToString:@""] && ![[[result objectAtIndex:j] objectAtIndex:4] isEqualToString:@""])
                {
                    [age addObject:[[result objectAtIndex:j] objectAtIndex:1]];
                    [heightData addObject:[[result objectAtIndex:j] objectAtIndex:2]];
                    [weightData addObject:[[result objectAtIndex:j] objectAtIndex:3]];
                    [headSizeData addObject:[[result objectAtIndex:j] objectAtIndex:4]];
                }
            }
        }
    }
}

//Popover for MileStone Tab
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

// PopViewControllerDelegate callback function
- (void)dismissGrowthPop:(NSString *)value {
    if(![value isEqualToString:@""])
        tabNumber = [NSString stringWithFormat:@"%@",value];
    [[currentPopoverSegue popoverController] dismissPopoverAnimated: YES]; // dismiss the popover
    if([tabNumber isEqualToString:@"1"])
    {
        [chartBackGround setImage:[UIImage imageNamed:@"overallGraph.png"]];
    }
    else if([tabNumber isEqualToString:@"2"])
    {
        [chartBackGround setImage:[UIImage imageNamed:@"heightGraph.png"]];
    }
    else if([tabNumber isEqualToString:@"3"])
    {
        [chartBackGround setImage:[UIImage imageNamed:@"weightGraph.png"]];
    }
    else if([tabNumber isEqualToString:@"4"])
    {
        [chartBackGround setImage:[UIImage imageNamed:@"headSizeGraph.png"]];
    }
    [self GetDataForGrowth];
    [self DrawLine];
    [self displayData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"Growth2Child"])
    {
        ChildVC *childVC = [segue destinationViewController];
        childVC.cID = cID;
        childVC.stringPhysicianID = pID;
        childVC.physician = physician;
    }
    else if([[segue identifier] isEqualToString:@"Growth2Record"])
    {
        RecordVC *recordVC = [segue destinationViewController];
        recordVC.physician = physician;
        recordVC.cID = cID;
        recordVC.childName = childName;
        recordVC.pID = pID;
        recordVC.dob = dob;
    }
    else if([[segue identifier] isEqualToString:@"Growth2Search"])
    {
        SearchVC *searchVC = [segue destinationViewController];
        searchVC.stringPhysicianID = pID;
    }
    else if ([[segue identifier] isEqualToString:@"Growth2GrowthTab"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        pvc = [segue destinationViewController];
        [pvc setDelegate:self];
        pvc.cID = cID;        
    }
}

- (IBAction)homeButtonClick:(id)sender {
    [self performSegueWithIdentifier:@"Growth2Search" sender:self];
}

- (IBAction)childButtonClick:(id)sender {
    [self performSegueWithIdentifier:@"Growth2Child" sender:self];
}

- (IBAction)recordButtonClick:(id)sender {
    [self performSegueWithIdentifier:@"Growth2Record" sender:self];
}

- (IBAction)growthButtonClick:(id)sender {
}

- (IBAction)logoutButtonClick:(id)sender {
    [self performSegueWithIdentifier:@"Growth2MainView" sender:self];
}
@end
