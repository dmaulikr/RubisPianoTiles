//
//  LogicTiles.h
//  PiyanoTiles
//
//  Created by Developer8 on 2/17/16.
//  Copyright © 2016 Mohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogicTiles : NSObject{
      NSMutableArray *cellColorIndex;
    int speedInr;
    int gameStart;
    int scoreObtained;
    int gameLbl;
}
-(void) startGame;
-(void) setGameStart:(int)no;
-(int) getGameStart;
-(void) setScore;
-(int) getScore;
-(int) getSpeedInr;
-(int) getGameLbl;
-(int) getCellStatus:(int)Pos;
-(void) updateCells;
-(void) setCellStatus:(int)Pos color:(int)value;
@end
