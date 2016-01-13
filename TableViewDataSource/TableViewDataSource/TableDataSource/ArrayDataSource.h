//
//  ArrayDataSource.h
//  
//
//  Created by Jiawei Chen on 14/12/6.
//  Copyright (c) 2014年 honestwalker.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITableViewCell_Configure.h"

typedef void (^TableViewCellConfigureBlock)(id cell, id indexPath, id item);
typedef NSString *(^TableViewCellIdentifierBlock)(id indexPath);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *itemsArray;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewCellIdentifierBlock identifierCellBlock;

- (id)initWithItemsArray:(NSArray *)itemsArray
     identifierCellBlock:(TableViewCellIdentifierBlock)identifierCellBlock
      configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end