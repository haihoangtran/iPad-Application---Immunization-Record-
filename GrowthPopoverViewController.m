//
//  GrowthPopoverViewController.m
//  immunization
//
//  Created by Test on 11/5/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "GrowthPopoverViewController.h"
#import "AddGrowthPopoverViewController.h"

@interface GrowthPopoverViewController ()

@end

@implementation GrowthPopoverViewController
@synthesize delegate, currentPopoverSegue, pvc;
@synthesize cID;

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

// PopViewControllerDelegate callback function
- (void)dismissAddGrowthPop:(NSString *)value {
    [[currentPopoverSegue popoverController] dismissPopoverAnimated: YES]; // dismiss the popover
    [delegate dismissGrowthPop:@""];  // make delegate callback here
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GrowthP2AddGrowth"])
    {
        currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        pvc = [segue destinationViewController];
        [pvc setDelegate:self];
        pvc.cID = cID;
    }

}

- (IBAction)overallClick:(id)sender {
    [delegate dismissGrowthPop:@"1"];  // make delegate callback here
}

- (IBAction)heightClick:(id)sender {
    [delegate dismissGrowthPop:@"2"];  // make delegate callback here
}

- (IBAction)weightClick:(id)sender {
    [delegate dismissGrowthPop:@"3"];  // make delegate callback here
}

- (IBAction)headSizeClick:(id)sender {
    [delegate dismissGrowthPop:@"4"];  // make delegate callback here
}
@end
