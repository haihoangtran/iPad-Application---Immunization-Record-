//
//  ViewController.h
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) UIAlertView *errorLogIn;
@property (strong, nonatomic) NSMutableArray *physicianInfo;

- (IBAction)physicianBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
