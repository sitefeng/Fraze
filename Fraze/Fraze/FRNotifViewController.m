//
//  FRNotifViewController.m
//  Fraze
//
//  Created by Si Te Feng on 1/16/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRNotifViewController.h"
#import "FRNotifCell.h"
#import "FRNotifRequestCell.h"


@interface FRNotifViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FRNotifViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.clipsToBounds = YES;
    self.tableView.layer.cornerRadius = 10;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
//    [self.tableView registerClass:[FRNotifCell class] forCellReuseIdentifier:@"FRNotifCell"];
}



#pragma mark - UITableViewController DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0) {
        FRNotifRequestCell* reqCell = [self.tableView dequeueReusableCellWithIdentifier:@"FRNotifRequestCell"];
        reqCell.textLabel.text = @"You have 7 Notifications";
        return reqCell;
    }
    [self.tableView dequeueReusableCellWithIdentifier:@"FRNotifCell"];
    FRNotifCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"FRNotifCell"];
    
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        return 65;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
