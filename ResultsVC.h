//
//  ResultsVC.h
//  Immunization
//
//  Created by trex on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableResult;

@property (strong, nonatomic)NSMutableArray *result;
@property (assign, nonatomic) int rowSelector;
@property(strong, nonatomic)NSString *idFromSearch;
@property(strong, nonatomic)NSString *lNameFromSearch;
@property(strong, nonatomic)NSString *fNameFromSearch;
@property(strong, nonatomic)NSString *mNameFromSearch;
@property (strong, nonatomic) NSString *stringPhysicianID;

@end
