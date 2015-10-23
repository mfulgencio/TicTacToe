//
//  SettingsViewController.h
//  TicTacToe
//
//  Created by Michael Fulgencio on 10/22/15.
//  Copyright © 2015 Michael Fulgencio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsDelegate <NSObject>
- (void) settingsSavedWithStartingPlayer:(NSString *)whoGoesFirst withOpponent:(NSString *)opponent;
@end

@interface SettingsViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *opponentLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *opponentSegCont;

@property (nonatomic, retain) IBOutlet UILabel *whoGoesFirstLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *whoGoesFirstSegCont;

@property (nonatomic, weak) id<SettingsDelegate> delegate;

@end