//
//  MileStonePopoverViewController.m
//  immunization
//
//  Created by ubicomp10 on 10/29/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "MileStonePopoverViewController.h"

@interface MileStonePopoverViewController ()

@end

@implementation MileStonePopoverViewController
@synthesize delegate;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (IBAction)clickBirth:(id)sender {
    [delegate dismissPop:@"1"];  // make delegate callback here
}

- (IBAction)click6Weeks:(id)sender {
    [delegate dismissPop:@"2"];  // make delegate callback here
}

- (IBAction)click10Weeks:(id)sender {
    [delegate dismissPop:@"3"];  // make delegate callback here
}

- (IBAction)click14Weeks:(id)sender {
    [delegate dismissPop:@"4"];  // make delegate callback here
}

- (IBAction)click9Months:(id)sender {
    [delegate dismissPop:@"5"];  // make delegate callback here
}

- (IBAction)click15Months:(id)sender {
    [delegate dismissPop:@"6"];  // make delegate callback here
}

- (IBAction)click2Years:(id)sender {
    [delegate dismissPop:@"7"];  // make delegate callback here
}

- (IBAction)clickAdditional:(id)sender {
    [delegate dismissPop:@"8"];  // make delegate callback here
}
@end
