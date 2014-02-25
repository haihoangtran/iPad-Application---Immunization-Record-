//
//  SearchVC.h
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *idTF;
@property (weak, nonatomic) IBOutlet UITextField *lNameTF;
@property (weak, nonatomic) IBOutlet UITextField *fNameTF;
@property (weak, nonatomic) IBOutlet UITextField *mNameTF;

@property (strong, nonatomic) NSMutableArray *pInfo;
@property (strong, nonatomic)NSMutableArray *result;
@property (strong, nonatomic) NSString *stringPhysicianID;

- (IBAction)search:(id)sender;
- (IBAction)actionButtonLogout:(id)sender;
- (IBAction)actionButtonNewChildEntry:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
