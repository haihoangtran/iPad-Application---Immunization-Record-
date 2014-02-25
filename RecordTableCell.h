//
//  RecordTableCell.h
//  Immunization
//
//  Created by Test on 10/14/13.
//  Copyright (c) 2013 trex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *vaccine;
@property (nonatomic, weak) IBOutlet UILabel *vaccineName;
@property (nonatomic, weak) IBOutlet UILabel *clinic;
@property (nonatomic, weak) IBOutlet UILabel *physician;
@property (nonatomic, weak) IBOutlet UILabel *date;

@end
