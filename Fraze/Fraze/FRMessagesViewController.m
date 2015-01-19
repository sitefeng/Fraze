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

@interface FRMessagesViewController ()


@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FRMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [JPStyle interfaceTintColor];
    
    self.tableView.clipsToBounds = YES;
    self.tableView.layer.cornerRadius = 10;
    
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
    
    return 10;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0) {
        FRMessagesSearchCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"FRMessagesSearchCell"];
        return cell;
    }
    
    FRMessagesCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"FRMessagesCell"];
    [cell setup];
    
    cell.profileImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"profile%d", indexPath.row]];
    cell.nameLabel.text = [NSString stringWithFormat:@"Person %d", indexPath.row];
    cell.messageLabel.text = @"Hello there, how are you doing today? I was just going to tell you about all the amazing things that happened today.";
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




#pragma mark - Action Methods


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
