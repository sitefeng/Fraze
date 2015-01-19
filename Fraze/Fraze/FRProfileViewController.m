//
//  dummyViewController.m
//  Fraze
//
//  Created by Si Te Feng on 1/15/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRProfileViewController.h"
#import "PPIconButton.h"
#import "FRMainNavigationController.h"

@interface FRProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (strong, nonatomic) IBOutletCollection(PPIconButton) NSArray *profileButtons;
@property (weak, nonatomic) IBOutlet UIImageView *profileImgView;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;



@end

@implementation FRProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [JPStyle interfaceTintColor];
    
    self.profileImgView.clipsToBounds = YES;
    self.profileImgView.layer.cornerRadius = self.profileImgView.frame.size.width/2;
    
    NSArray* imgNames = @[@"signOutIcon",@"settingsIcon",@"editIcon",@"friendsIcon",@"legalIcon",@"shareIcon"];
    NSArray* buttonNames = @[@"Log Out",@"Settings",@"Edit Profile",@"Friends",@"Legal",@"Share"];
    
    for(int i=0; i<6; i++) {
        
        PPIconButton* button = self.profileButtons[i];
        
        button.backgroundColor = [UIColor clearColor];
        
        [button setTitle:buttonNames[i]];
        [button setImageName:imgNames[i]];
        
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}


- (void)buttonPressed: (PPIconButton*)button {
    
    
    
    
}


- (IBAction)closeButtonPressed:(id)sender
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
