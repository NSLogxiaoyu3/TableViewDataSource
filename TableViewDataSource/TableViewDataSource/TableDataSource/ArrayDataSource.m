//
//  ArrayDataSource.m
//  
//
//  Created by Jiawei Chen on 14/12/6.
//  Copyright (c) 2014年 honestwalker.com. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()

@end

@implementation ArrayDataSource

- (id)initWithItemsArray:(NSArray *)itemsArray identifierCellBlock:(TableViewCellIdentifierBlock)identifierCellBlock configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock {
    self = [super init];
    if (self) {
        self.itemsArray = itemsArray;
        self.identifierCellBlock = [identifierCellBlock copy];
        self.configureCellBlock = [configureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.itemsArray.count) {
        return nil;
    }
    return self.itemsArray[(NSUInteger)indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"Cell";
    if (self.identifierCellBlock) {
        identifier = self.identifierCellBlock(indexPath);
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, indexPath, item);
    return cell;
}

@end