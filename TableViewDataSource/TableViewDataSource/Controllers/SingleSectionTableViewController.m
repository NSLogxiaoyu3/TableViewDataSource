//
//  ViewController.m
//  TestArrayDataSource
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SingleSectionTableViewController.h"
#import "ArrayDataSource.h"
#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"

@interface SingleSectionTableViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ArrayDataSource *dataSource;
@property (strong, nonatomic) NSMutableArray *mutableArray;

@end

@implementation SingleSectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mutableArray = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil]  forCellReuseIdentifier:@"LeftCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RightTableViewCell" bundle:nil]  forCellReuseIdentifier:@"RightCell"];
    
    self.dataSource = [[ArrayDataSource alloc] initWithItemsArray:self.mutableArray
                                         identifierCellBlock:^NSString *(NSIndexPath *indexPath) {
                                             if (indexPath.row % 2 == 0) {
                                                 return @"LeftCell";
                                             }
                                             return @"RightCell";
                                         }
                                             configureCellBlock:^(id cell, id indexPath, id item) {
                                                 [cell configureWithData:item indexPath:indexPath];
                                             }];
    self.tableView.dataSource = self.dataSource;
    [self.mutableArray addObjectsFromArray:@[@"1", @"1", @"1", @"1"]];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
