//
//  NotePopoverViewController.m
//  immunization
//
//  Created by ubicomp11 on 10/29/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import "NotePopoverViewController.h"
#import "Children.h"

@interface NotePopoverViewController ()

@end

@implementation NotePopoverViewController
@synthesize edit, doneBtn, noteTF, cID, ageRange;
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
    //noteTF.text = [Children GetNoteByChildID:cID andAgeRange:ageRange];
    if([edit isEqualToString:@"Y"])
    {
        noteTF.editable = YES;
    }
    else
    {
        doneBtn.hidden = YES;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    noteTF.text = [Children GetNoteByChildID:cID andAgeRange:ageRange];
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

- (IBAction)doneClick:(id)sender {
    [Children EditNoteByChildID:cID andAgeRange:ageRange andNewNote:noteTF.text];
    [delegate dismissNotePop:@""];  // make delegate callback here

}
@end
