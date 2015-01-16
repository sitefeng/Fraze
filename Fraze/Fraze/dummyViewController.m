//
//  dummyViewController.m
//  Fraze
//
//  Created by Si Te Feng on 1/15/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "dummyViewController.h"
#import "PPIconButton.h"

@interface dummyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (strong, nonatomic) IBOutletCollection(PPIconButton) NSArray *profileButtons;
@property (weak, nonatomic) IBOutlet UIImageView *profileImgView;

@end

@implementation dummyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [JPStyle interfaceTintColor];
    
    self.profileImgView.clipsToBounds = YES;
    self.profileImgView.layer.cornerRadius = self.profileImgView.frame.size.width/2;
    
    NSArray* imgNames = @[@"friendsIcon",@"groupsIcon",@"legalIcon",@"shareIcon",@"settingsIcon",@"signOutIcon"];
    NSArray* buttonNames = @[@"Friends",@"Groups",@"Legal",@"Share",@"Settings",@"Log Out"];
    
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
