//
//  ViewController.m
//  TicTacToe
//
//  Created by Michael Fulgencio on 10/22/15.
//  Copyright © 2015 Michael Fulgencio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize whichPlayer, xScore, oScore;
@synthesize topLeftSquare, topMiddleSquare, topRightSquare, middleLeftSquare, centerSquare,
middleRightSquare, bottomLeftSquare, bottomMiddleSquare, bottomRightSquare;
@synthesize settingsButton;
@synthesize xScoreLabel, oScoreLabel;
@synthesize squares;

- (IBAction)squareSelected:(id)sender {
    UIButton *square = (UIButton *)sender;
    [square setEnabled:NO];
    
    switch (whichPlayer) {
        case 1:
            [square setTitle:@"X" forState:UIControlStateNormal];
            square.titleLabel.font = [UIFont systemFontOfSize:36.0];
            whichPlayer = 2;
            break;
        case 2:
            [square setTitle:@"O" forState:UIControlStateNormal];
            square.titleLabel.font = [UIFont systemFontOfSize:36.0];
            whichPlayer = 1;
            break;
            
        default:
            break;
    }
    
    [self performSelector:@selector(checkForWin) withObject:nil afterDelay:0.2f];
}

- (void)checkForWin {
    if (([topLeftSquare.titleLabel.text isEqualToString:@"O"] && [topMiddleSquare.titleLabel.text isEqualToString:@"O"] && [topRightSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([topLeftSquare.titleLabel.text isEqualToString:@"O"] && [middleLeftSquare.titleLabel.text isEqualToString:@"O"] && [bottomLeftSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([topMiddleSquare.titleLabel.text isEqualToString:@"O"] && [centerSquare.titleLabel.text isEqualToString:@"O"] && [bottomMiddleSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([topRightSquare.titleLabel.text isEqualToString:@"O"] && [middleRightSquare.titleLabel.text isEqualToString:@"O"] && [bottomRightSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([topLeftSquare.titleLabel.text isEqualToString:@"O"] && [centerSquare.titleLabel.text isEqualToString:@"O"] && [bottomRightSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([topRightSquare.titleLabel.text isEqualToString:@"O"] && [centerSquare.titleLabel.text isEqualToString:@"O"] && [bottomLeftSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([middleLeftSquare.titleLabel.text isEqualToString:@"O"] && [centerSquare.titleLabel.text isEqualToString:@"O"] && [middleRightSquare.titleLabel.text isEqualToString:@"O"]) ||
        ([bottomLeftSquare.titleLabel.text isEqualToString:@"O"] && [bottomMiddleSquare.titleLabel.text isEqualToString:@"O"] && [bottomRightSquare.titleLabel.text isEqualToString:@"O"])) {
        [oScoreLabel setText:[NSString stringWithFormat:@"O: %d", ++oScore]];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\"O\" Wins!!" message:@"Play again?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self resetBoard];
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (([topLeftSquare.titleLabel.text isEqualToString:@"X"] && [topMiddleSquare.titleLabel.text isEqualToString:@"X"] && [topRightSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([topLeftSquare.titleLabel.text isEqualToString:@"X"] && [middleLeftSquare.titleLabel.text isEqualToString:@"X"] && [bottomLeftSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([topMiddleSquare.titleLabel.text isEqualToString:@"X"] && [centerSquare.titleLabel.text isEqualToString:@"X"] && [bottomMiddleSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([topRightSquare.titleLabel.text isEqualToString:@"X"] && [middleRightSquare.titleLabel.text isEqualToString:@"X"] && [bottomRightSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([topLeftSquare.titleLabel.text isEqualToString:@"X"] && [centerSquare.titleLabel.text isEqualToString:@"X"] && [bottomRightSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([topRightSquare.titleLabel.text isEqualToString:@"X"] && [centerSquare.titleLabel.text isEqualToString:@"X"] && [bottomLeftSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([middleLeftSquare.titleLabel.text isEqualToString:@"X"] && [centerSquare.titleLabel.text isEqualToString:@"X"] && [middleRightSquare.titleLabel.text isEqualToString:@"X"]) ||
               ([bottomLeftSquare.titleLabel.text isEqualToString:@"X"] && [bottomMiddleSquare.titleLabel.text isEqualToString:@"X"] && [bottomRightSquare.titleLabel.text isEqualToString:@"X"])) {
        [xScoreLabel setText:[NSString stringWithFormat:@"X: %d", ++xScore]];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\"X\" Wins!!" message:@"Play again?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self resetBoard];
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else if ([self checkForTie]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"It's a tie!!" message:@"Play again?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self resetBoard];
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)settingsSavedWithStartingPlayer:(NSString *)whoGoesFirst withOpponent:(NSString *)opponent {
    NSString *firstPlayer = whoGoesFirst;
    NSString *opnt = opponent;
    
    NSLog(@"firstPlayer: %@, opponent: %@", firstPlayer, opnt);
}

- (BOOL)checkForTie {
    BOOL tie = YES;
    
    for (UIButton *square in squares)
        if ([square isEnabled]) {
            tie = NO;
            break;
        }
    
    return tie;
}

- (void)resetBoard {
    for (UIButton *square in squares) {
        [square setTitle:@" " forState:UIControlStateNormal];
        [square setEnabled:YES];
    }
    
    whichPlayer = 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"present_settingsViewController"]) {
        NSLog(@"in prepareForSegue");
        
        SettingsViewController *settingsVC = (SettingsViewController *)segue.destinationViewController;
        
        settingsVC.delegate = self;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UIImage *settingsImage = [UIImage imageNamed:@"setting-256.png"];
    //    [settingsButton setImage:settingsImage forState:UIControlStateNormal];
    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    
    whichPlayer = 1;
    xScore = 0;
    oScore = 0;
    
    squares = [[NSArray alloc] initWithObjects:topLeftSquare, topMiddleSquare, topRightSquare,
               middleLeftSquare, centerSquare, middleRightSquare, bottomLeftSquare, bottomMiddleSquare, bottomRightSquare, nil];
    
    [xScoreLabel setText:[NSString stringWithFormat:@"X: %d", xScore]];
    xScoreLabel.font = [UIFont systemFontOfSize:24.0];
    xScoreLabel.textAlignment = NSTextAlignmentCenter;
    
    [oScoreLabel setText:[NSString stringWithFormat:@"O: %d", oScore]];
    oScoreLabel.font = [UIFont systemFontOfSize:24.0];
    oScoreLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
