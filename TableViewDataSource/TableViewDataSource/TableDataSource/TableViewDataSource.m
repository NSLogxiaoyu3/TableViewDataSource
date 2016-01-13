//
//  TableViewDataSource.m
//  TestArrayDataSource
//
//  Created by apple on 1/13/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "TableViewDataSource.h"

@implementation TableViewDataSource

- (id)initWithNumberOfSection:(NSUInteger)numberOfSection
            sectionArrayBlock:(TableViewCellSectionArrayBlock)sectionArrayBlock
          identifierCellBlock:(TableViewCellIdentifierBlock)identifierCellBlock
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock {
    self = [super init];
    if (self) {
        self.sectionArrayBlock = [sectionArrayBlock copy];
        self.configureCellBlock = [configureCellBlock copy];
        self.identifierCellBlock = [identifierCellBlock copy];
        self.numberOfSection = numberOfSection;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = self.sectionArrayBlock(indexPath.section);
    if (indexPath.row >= array.count) {
        return nil;
    }
    return array[(NSUInteger)indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.numberOfSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionArrayBlock(section).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
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
