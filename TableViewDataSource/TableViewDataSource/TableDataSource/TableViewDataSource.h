//
//  TableViewDataSource.h
//  TestArrayDataSource
//
//  Created by apple on 1/13/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITableViewCell_Configure.h"

typedef void (^TableViewCellConfigureBlock)(id cell, id indexPath, id item);

typedef NSString *(^TableViewCellIdentifierBlock)(id indexPath);

typedef NSArray *(^TableViewCellSectionArrayBlock)(NSUInteger section);

@interface TableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewCellIdentifierBlock identifierCellBlock;
@property (nonatomic, copy) TableViewCellSectionArrayBlock sectionArrayBlock;
@property (nonatomic, assign) NSUInteger numberOfSection;

- (id)initWithNumberOfSection:(NSUInteger)numberOfSection
            sectionArrayBlock:(TableViewCellSectionArrayBlock)sectionArrayBlock
          identifierCellBlock:(TableViewCellIdentifierBlock)identifierCellBlock
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
