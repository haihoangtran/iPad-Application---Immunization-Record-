//
//  SearchVC.m
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "PhysicianHomeVC.h"
#import "AddChildVC.h"
#import "SearchVC.h"

@interface PhysicianHomeVC ()

@end

@implementation PhysicianHomeVC
@synthesize pInfo;
@synthesize pName, clinic;

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    pName.text = [NSString stringWithFormat:@"Physician: Dr. %@ %@", [pInfo objectAtIndex:0], [pInfo objectAtIndex:1]];
    clinic.text = [NSString stringWithFormat:@"Clinic: %@", [pInfo objectAtIndex:2]]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchRecords:(id)sender {
    [self performSegueWithIdentifier:@"Physician2Search" sender:self];
}

- (IBAction)addChild:(id)sender {
    [self performSegueWithIdentifier:@"Physician2AddChild" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"Physician2Search"]){
        
        SearchVC *svc = [segue destinationViewController];
        svc.stringPhysicianID = [pInfo objectAtIndex:3];
    }
    else if ([[segue identifier] isEqualToString:@"Physician2AddChild"]) {
        AddChildVC *acvc = [segue destinationViewController];
        acvc.stringPhysicianID = [pInfo objectAtIndex:3];
    }
        
}
@end
