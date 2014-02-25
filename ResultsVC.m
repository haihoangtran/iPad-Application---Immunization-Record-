//
//  ResultsVC.m
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "ResultsVC.h"
#import "ResultTableCell.h"
#import "Children.h"
#import "ChildVC.h"
#import "AddChildVC.h"

@interface ResultsVC ()

@end

@implementation ResultsVC

@synthesize  result, tableResult;
@synthesize idFromSearch, fNameFromSearch, lNameFromSearch, mNameFromSearch, stringPhysicianID;

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
    
    //NSLog(@"Result: %@", result);
}

-(void)viewDidAppear:(BOOL)animated
{
    NSMutableDictionary *searchInfo = [[NSMutableDictionary alloc] init];
    [searchInfo addEntriesFromDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                          idFromSearch, @"cID",
                                          lNameFromSearch, @"lastName",
                                          fNameFromSearch, @"firstName",
                                          mNameFromSearch, @"motherName",
                                          nil]];
    
    result = [Children Search:searchInfo];
    [tableResult reloadData];
}

- (void) buttonHomePressed:(id) sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) buttonAddChildPressed:(id) sender {
    
    [self performSegueWithIdentifier:@"Result2AddChild" sender:self];
}

- (void) buttonLogoutPressed:(id) sender {
    
    [self performSegueWithIdentifier:@"Result2Welcome" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [result count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *resultTableIdentifier = @"ResultTableCell";
    
    ResultTableCell *cell = (ResultTableCell *)[tableView dequeueReusableCellWithIdentifier:resultTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ResultTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.identifier.text = [[result objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.firstName.text = [[result objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.lastName.text = [[result objectAtIndex:indexPath.row] objectAtIndex:2];
    cell.DOB.text = [[result objectAtIndex:indexPath.row] objectAtIndex:3];
    cell.returnDate.text = [[result objectAtIndex:indexPath.row] objectAtIndex:4];
    cell.motherName.text = [[result objectAtIndex:indexPath.row] objectAtIndex:5];
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.rowSelector = indexPath.row;
    [self performSegueWithIdentifier:@"Result2Child" sender:self];
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   if([[segue identifier] isEqualToString:@"Result2Child"])
   {
       ChildVC *childVC = [segue destinationViewController];
       childVC.cID = [[result objectAtIndex:self.rowSelector] objectAtIndex:0];
       childVC.stringPhysicianID = stringPhysicianID;
       childVC.physician = YES;
   }
   else if ([[segue identifier] isEqualToString:@"Result2AddChild"]) {
       
       AddChildVC *acvc = [segue destinationViewController];
       acvc.stringPhysicianID = stringPhysicianID;
   }
}

- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
