//
//  ResultTableCell.h
//  Immunization
//
//  Created by Test on 10/13/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *identifier;
@property (nonatomic, weak) IBOutlet UILabel *firstName;
@property (nonatomic, weak) IBOutlet UILabel *lastName;
@property (nonatomic, weak) IBOutlet UILabel *DOB;
@property (nonatomic, weak) IBOutlet UILabel *returnDate;
@property (nonatomic, weak) IBOutlet UILabel *motherName;

@end
