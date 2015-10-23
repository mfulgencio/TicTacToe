//
//  SettingsViewController.m
//  TicTacToe
//
//  Created by Michael Fulgencio on 10/22/15.
//  Copyright © 2015 Michael Fulgencio. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize opponentLabel, whoGoesFirstLabel;
@synthesize opponentSegCont, whoGoesFirstSegCont;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [opponentLabel setText:@"Opponent:"];
    [whoGoesFirstLabel setText:@"Who goes first?"];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelSettings)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveSettings)];
    self.navigationItem.rightBarButtonItem = save;
}

- (void)cancelSettings {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveSettings {
    //    if (opponentSegCont.selectedSegmentIndex == 0)
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"in viewWillDisappear");
    
    if ([self.delegate respondsToSelector:@selector(settingsSavedWithStartingPlayer:withOpponent:)]) {
        NSLog(@"in if statement");
        [self.delegate settingsSavedWithStartingPlayer:@"X" withOpponent:@"Human"];
    }
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
