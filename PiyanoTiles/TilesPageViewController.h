//
//  TilesPageViewController.h
//  PiyanoTiles
//
//  Created by Developer8 on 2/17/16.
//  Copyright © 2016 Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "LogicTiles.h"


@interface TilesPageViewController : UIViewController<UIAlertViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>{
    LogicTiles *logicObj;
    NSString *name;
    UIAlertView *alertView ;
    int resumeStatus;
   
   }
-(void)startGame;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *labelStep;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
-(UIColor *) colorValue:(int)index;
- (IBAction)buttonExit:(id)sender;
-(void)setUserName:(NSString*)name;
@end
