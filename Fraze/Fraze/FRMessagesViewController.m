//
//  FRMessagesViewController.m
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRMessagesViewController.h"
#import "FRMainNavigationController.h"
#import "FRMessagesSearchCell.h"
#import "FRMessagesCell.h"
#import "FRMessagesActionCell.h"

@interface FRMessagesViewController ()
{
    NSInteger _dropdownIndex;
}

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FRMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dropdownIndex = -1;

    self.view.backgroundColor = [JPStyle interfaceTintColor];
    
    self.tableView.clipsToBounds = YES;
    self.tableView.layer.cornerRadius = 10;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer* backgroundViewTapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    [self.view addGestureRecognizer:backgroundViewTapRec];
}


#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRows = 9;
    
    if(_dropdownIndex < 0)
        return numRows;
    else
        return numRows+1;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0) {
        FRMessagesSearchCell* searchCell = [self.tableView dequeueReusableCellWithIdentifier:@"FRMessagesSearchCell"];
        [searchCell setup];
        return searchCell;
    }
    
    NSInteger rowNumber = indexPath.row;
    
    if(_dropdownIndex < 0)
    {
        rowNumber = indexPath.row;
    }
    else
    {
        if(indexPath.row < _dropdownIndex) {
            rowNumber = indexPath.row;
        }
        else if(indexPath.row > _dropdownIndex) {
            rowNumber = indexPath.row - 1;
        }
        else //is dropdown row
        {
            FRMessagesActionCell* actionCell = [self.tableView dequeueReusableCellWithIdentifier:@"FRMessagesActionCell"];
            actionCell.backgroundColor = [UIColor clearColor];
            return actionCell;
        }
    }
    
    FRMessagesCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"FRMessagesCell"];
    [cell setup];
    
    cell.profileImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"profile%ld", (long)rowNumber]];
    cell.nameLabel.text = [NSString stringWithFormat:@"Person %ld", (long)rowNumber];
    cell.messageLabel.text = @"Hello there, how are you doing today? I was just going to tell you about all the amazing things that happened today.";
    
    [cell addDropdownTarget:self selector:@selector(dropdownButtonPressed:)];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




#pragma mark - Action Methods


- (void)dropdownButtonPressed: (FRMessagesCell*)cell
{
    NSLog(@"dropdown button pressed");
    NSInteger row = [self.tableView indexPathForCell:cell].row;
    NSInteger prevDropDown = _dropdownIndex;
    
    if(_dropdownIndex > 0)
    {
        NSIndexPath* deleteIndexPath = [NSIndexPath indexPathForRow:_dropdownIndex inSection:0];
        _dropdownIndex = -1;
        [self.tableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
    if(prevDropDown != row+1)
    {
        _dropdownIndex = row+1;
        NSIndexPath* addIndexPath = [NSIndexPath indexPathForRow:_dropdownIndex inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[addIndexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }

}


- (IBAction)backButtonPressed:(id)sender
{
    [self retractViewController];
    
}


- (void)backgroundTapped
{
    FRMessagesSearchCell* cell = (FRMessagesSearchCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell.searchTextField resignFirstResponder];
    
}





#pragma mark - Convenience Methods

- (void)retractViewController
{
    FRMainNavigationController* navController = (FRMainNavigationController*)[self parentViewController];
    [navController retractChildViewController:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end
