//
//  ViewController.h
//  PiyanoTiles
//
//  Created by Developer8 on 2/17/16.
//  Copyright © 2016 Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TilesPageViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textUserName;

- (IBAction)buttonPlay:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlay;
- (IBAction)textChanged:(id)sender;

@end

