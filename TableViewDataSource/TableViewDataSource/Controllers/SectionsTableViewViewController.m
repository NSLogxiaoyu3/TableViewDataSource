
//
//  SectionsTableViewViewController.m
//  TestArrayDataSource
//
//  Created by apple on 1/13/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SectionsTableViewViewController.h"
#import "TableViewDataSource.h"

@interface SectionsTableViewViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TableViewDataSource *tableViewDataSource;

@property (strong, nonatomic) NSMutableArray *firstMutableArray;
@property (strong, nonatomic) NSMutableArray *secondMutableArray;

@end

@implementation SectionsTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstMutableArray = [NSMutableArray array];
    self.secondMutableArray = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil]  forCellReuseIdentifier:@"LeftCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RightTableViewCell" bundle:nil]  forCellReuseIdentifier:@"RightCell"];
    
    self.tableViewDataSource = [[TableViewDataSource alloc] initWithNumberOfSection:2
                                                                  sectionArrayBlock:^NSArray *(NSUInteger section){
                                                                      if (section == 0) {
                                                                          return self.firstMutableArray;
                                                                      } else {
                                                                          return self.secondMutableArray;
                                                                      }
                                                                  }
                                                                identifierCellBlock:^NSString *(NSIndexPath *indexPath) {
                                                                    if (indexPath.section == 0) {
                                                                        return @"LeftCell";
                                                                    } else {
                                                                        return @"RightCell";
                                                                    }
                                                                }
                                                                 configureCellBlock:^(id cell, id indexPath, id item) {
                                                                     [cell configureWithData:item indexPath:indexPath];
                                                                 }];
    self.tableView.dataSource = self.tableViewDataSource;
    [self.firstMutableArray addObjectsFromArray:@[@"1", @"1", @"1", @"1"]];
    [self.secondMutableArray addObjectsFromArray:@[@"2", @"2", @"2", @"2"]];
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
