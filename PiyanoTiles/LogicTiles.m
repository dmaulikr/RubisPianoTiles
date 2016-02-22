//
//  LogicTiles.m
//  PiyanoTiles
//
//  Created by Developer8 on 2/17/16.
//  Copyright © 2016 Mohan. All rights reserved.
//

#import "LogicTiles.h"

@implementation LogicTiles
-(void) setGameStart:(int)no{
    gameStart=no;
}
-(int)getSpeedInr{
    return speedInr;
}
-(int) getGameStart{
    return gameStart;
}
-(void) setScore{
    if (scoreObtained<10) {
        scoreObtained++;
        gameLbl=1;
    }
    else if(scoreObtained<30){
        scoreObtained +=2;
        gameLbl=2;
        speedInr=2;
    }else if(scoreObtained<60){
        scoreObtained +=3;
        gameLbl=3;
        speedInr=3;
    }
    else if(scoreObtained<130){
        scoreObtained +=5;
        gameLbl=4;
        speedInr=4;
    }
    else if(scoreObtained<400){
        scoreObtained +=7;
        gameLbl=5;
        speedInr=5;
    }
    else if(scoreObtained<1000){
        scoreObtained +=10;
        gameLbl=6;
        speedInr=8;
    }
    else if(scoreObtained<3000){
        scoreObtained +=30;
        gameLbl=7;
        speedInr=10;
    }
    else if(scoreObtained<9000){
        scoreObtained +=50;
        gameLbl=8;
        speedInr=12;
    }
    else if(scoreObtained<15000){
        scoreObtained +=75;
        gameLbl=9;
        speedInr=15;
    }
    else{
         scoreObtained +=100;
        gameLbl=10;
        speedInr=20;
    }
    
}
-(int) getScore{
    return scoreObtained;
}
-(int) getGameLbl{
    return gameLbl;
}
-(void) startGame{
     speedInr=1;
    gameStart=0;
    scoreObtained=0;
    gameLbl=1;

    switch (arc4random()%5) {
        case 0:
            cellColorIndex = [[NSMutableArray alloc] initWithObjects:
                              @"1",@"0",@"0",@"0",
                              @"0",@"1",@"0",@"0",
                              @"1",@"0",@"0",@"0",
                              @"0",@"0",@"1",@"0",
                              @"0",@"1",@"0",@"0", nil];
            break;
        case 1:
            cellColorIndex = [[NSMutableArray alloc] initWithObjects:
                              @"0",@"0",@"1",@"0",
                              @"1",@"0",@"0",@"0",
                              @"0",@"0",@"0",@"1",
                              @"1",@"0",@"0",@"0",
                              @"1",@"0",@"0",@"0", nil];
            break;
        case 2:
            cellColorIndex = [[NSMutableArray alloc] initWithObjects:
                              @"0",@"1",@"0",@"0",
                              @"0",@"0",@"0",@"1",
                              @"0",@"0",@"1",@"0",
                              @"0",@"1",@"0",@"0",
                              @"0",@"0",@"0",@"1", nil];
            break;
        case 3:
            cellColorIndex = [[NSMutableArray alloc] initWithObjects:
                              @"0",@"0",@"0",@"1",
                              @"0",@"1",@"0",@"0",
                              @"1",@"0",@"0",@"0",
                              @"0",@"0",@"1",@"0",
                              @"0",@"0",@"1",@"0", nil];
            break;
        case 4:
            cellColorIndex = [[NSMutableArray alloc] initWithObjects:
                              @"0",@"0",@"1",@"0",
                              @"0",@"1",@"0",@"0",
                              @"1",@"0",@"0",@"0",
                              @"0",@"0",@"1",@"0",
                              @"0",@"1",@"0",@"0", nil];
            break;
     
        default:
            cellColorIndex = [[NSMutableArray alloc] initWithObjects:
                              @"1",@"0",@"0",@"0",
                              @"0",@"1",@"0",@"0",
                              @"1",@"0",@"0",@"0",
                              @"0",@"0",@"1",@"0",
                              @"0",@"1",@"0",@"0", nil];
            break;
    }
}
-(int) getCellStatus:(int)Pos{
    int intValue = [[cellColorIndex objectAtIndex:Pos] intValue];
    return intValue;
}
-(void) setCellStatus:(int)Pos color:(int)value{
    if(value==0){
        cellColorIndex[Pos]=@"0";}
    else{
        cellColorIndex[Pos]=@"2";
    }
}
-(void) updateCells{
    int cellIndex = arc4random()%4;
   
   
    for(int row=4;row>0;row--){
        cellColorIndex[4*row+0]=cellColorIndex[4*(row-1)+0];
        cellColorIndex[4*row+1]=cellColorIndex[4*(row-1)+1];
        cellColorIndex[4*row+2]=cellColorIndex[4*(row-1)+2];
        cellColorIndex[4*row+3]=cellColorIndex[4*(row-1)+3];
        
        
    }
    for(int i=0;i<4;i++){
        if(i==cellIndex){
            cellColorIndex[i]=@"1";
        }
        else{
            cellColorIndex[i]=@"0";
        }
    }
}
@end
