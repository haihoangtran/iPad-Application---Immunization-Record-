//
//  SearchVC.h
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhysicianHomeVC : UIViewController

- (IBAction)searchRecords:(id)sender;
- (IBAction)addChild:(id)sender;

@property (strong, nonatomic) NSMutableArray *pInfo;
@property (weak, nonatomic) IBOutlet UILabel *pName;
@property (weak, nonatomic) IBOutlet UILabel *clinic;

@end
