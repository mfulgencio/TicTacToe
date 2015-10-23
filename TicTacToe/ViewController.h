//
//  ViewController.h
//  TicTacToe
//
//  Created by Michael Fulgencio on 10/22/15.
//  Copyright © 2015 Michael Fulgencio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface ViewController : UIViewController <SettingsDelegate>

@property int whichPlayer, xScore, oScore;
@property NSArray *squares;

@property (nonatomic, retain) IBOutlet UIButton *topLeftSquare;
@property (nonatomic, retain) IBOutlet UIButton *topMiddleSquare;
@property (nonatomic, retain) IBOutlet UIButton *topRightSquare;

@property (nonatomic, retain) IBOutlet UIButton *middleLeftSquare;
@property (nonatomic, retain) IBOutlet UIButton *centerSquare;
@property (nonatomic, retain) IBOutlet UIButton *middleRightSquare;

@property (nonatomic, retain) IBOutlet UIButton *bottomLeftSquare;
@property (nonatomic, retain) IBOutlet UIButton *bottomMiddleSquare;
@property (nonatomic, retain) IBOutlet UIButton *bottomRightSquare;

@property (nonatomic, retain) IBOutlet UIButton *settingsButton;

@property (nonatomic, retain) IBOutlet UILabel *xScoreLabel;
@property (nonatomic, retain) IBOutlet UILabel *oScoreLabel;

@end

