//
//  FRNewPostViewController.m
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRNewPostViewController.h"
#import "FRNewPostTableCell.h"
#import "FRMainNavigationController.h"

@interface FRNewPostViewController ()


@property (nonatomic, strong) NSMutableArray* selectedIndexPaths;

@property (weak, nonatomic) IBOutlet UITextView *captionTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *postButton;
@property (weak, nonatomic) IBOutlet UIView *foregroundView;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end



@implementation FRNewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedIndexPaths = [NSMutableArray array];
    
    self.captionTextView.text = @"Write a caption...";
    self.foregroundView.clipsToBounds = YES;
    self.foregroundView.layer.cornerRadius = 10;
    
    UITapGestureRecognizer* tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    [self.backgroundView addGestureRecognizer:tapRec];
    
}




#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 1;
    }
    
    return 10;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRNewPostTableCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"FRNewPostTableCell"];
    
    if(indexPath.section == 0) {
        cell.profileImageView.image = [UIImage imageNamed:@"fLogo.png"];
        cell.titleLabel.text = @"Anonymous";
    } else {
        cell.profileImageView.image = [UIImage imageNamed:@"profile4"];
        cell.titleLabel.text = @"Group Name";
    }
    
    //If this row is selected, display checkmark
    if([self.selectedIndexPaths containsObject:indexPath]) {
        cell.customSelected = YES;
    }
    else {
        cell.customSelected = NO;
    }
    
    return cell;
    
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0) {
        return @"Post Anonymously";
    } else {
        return @"Or allow selected groups to see";
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FRNewPostTableCell* cell = (FRNewPostTableCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    if(![self.selectedIndexPaths containsObject:indexPath])
    {
        [self.selectedIndexPaths addObject:indexPath];
        cell.customSelected = YES;
    }
    else {
        [self.selectedIndexPaths removeObject:indexPath];
        cell.customSelected = NO;
    }
}


#pragma mark - Action Methods

- (IBAction)postButtonPressed:(id)sender
{
    [self retractViewController];
}


- (void)backgroundTapped
{
    [self retractViewController];
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
