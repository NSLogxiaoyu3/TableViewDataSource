//
//  BottomTableViewCell.m
//  TestArrayDataSource
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configureWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    self.contentLabel.text = data;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
