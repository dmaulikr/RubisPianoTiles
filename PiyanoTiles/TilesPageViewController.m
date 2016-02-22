//
//  TilesPageViewController.m
//  PiyanoTiles
//
//  Created by Developer8 on 2/17/16.
//  Copyright © 2016 Mohan. All rights reserved.
//

#import "TilesPageViewController.h"

@interface TilesPageViewController (){
    int preSelect;
    int PopMsg;
}

@end

@implementation TilesPageViewController
//w-414 h-910 pos x=0 y=-174
- (void)viewDidLoad {
    [super viewDidLoad];
    [self startGame];
    resumeStatus=0;
}
-(void)startGame;{
   
    logicObj=[LogicTiles new];
    [logicObj startGame];
    PopMsg=1;
    _labelName.text=name;
    [_labelStep setText:[NSString stringWithFormat:@"Step : %i",[logicObj getGameLbl]]];
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
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    preSelect=-1;
    return 20;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
 //   [collectionView cellForItemAtIndexPath:indexPath].backgroundColor=[UIColor redColor] ;
       cell.backgroundColor =  [self colorValue:(int)indexPath.row];
     cell.textLabel.text=@"";
    if([logicObj getGameStart]==0){
    for(int i=16;i<20;i++){
        if([logicObj getCellStatus:i]==1 && indexPath.row==i){
            cell.textLabel.text=@"Start";
            break;
        }
        
    }
    }
    return cell;
}
-(UIColor *) colorValue:(int)index{
    int mainValue =[logicObj getCellStatus:index];
    switch (mainValue) {
        case 0:
            return [UIColor whiteColor];
            break;
        case 1:
            return [UIColor blackColor];
            break;
        case 2:
            return [UIColor redColor];
            break;
            
        default:
            return [UIColor whiteColor];
            break;
    }
}

- (IBAction)buttonExit:(id)sender {
    exit(0);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if([logicObj getGameStart]!=3){
       
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    // Set the index once user taps on a cell
    cell.backgroundColor = [UIColor whiteColor];
    if([logicObj getCellStatus:(int)indexPath.row]==1 && [logicObj getGameStart]==0){
     [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        [logicObj setGameStart:1];
          [logicObj setCellStatus:(int)indexPath.row color:0];
         [logicObj setScore];
        resumeStatus=0;
    }
    else if([logicObj getCellStatus:(int)indexPath.row]!=1  && preSelect !=(int)indexPath.row){
      //  game end
         cell.backgroundColor = [UIColor redColor];
       [logicObj setGameStart:3];
       PopMsg=1;
    }
    else{
        [logicObj setCellStatus:(int)indexPath.row color:0];
         [logicObj setScore];
    }
         preSelect =(int)indexPath.row;
    }
}
double timerInterval = 0;

- (NSTimer *) timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:timerInterval target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
    }
    return _timer;
}
-(void)onTick:(NSTimer*)timer
{
    [_labelStep setText:[NSString stringWithFormat:@"Step : %i",[logicObj getGameLbl]]];
    [self
     setTitle:[NSString stringWithFormat:@"Score:%i",[logicObj getScore]]];
    if([logicObj getGameStart]!=3 ){
        if(resumeStatus==0){
    CGRect frame = self.collectionView.frame;
    frame.origin.x=0;
    frame.origin.y=self.collectionView.frame.origin.y+[logicObj getSpeedInr];
    if(frame.origin.y>=-[logicObj getSpeedInr]){
        frame.origin.y =  -174;
        for(int i=16;i<20;i++){
            if([logicObj getCellStatus:i]==1){
                [logicObj setCellStatus:i color:3];
                [logicObj setGameStart:3];
                PopMsg=1;
                }
        }
        if([logicObj getGameStart]!=3){
            [logicObj updateCells];
        }
        [_collectionView reloadData];
        [logicObj setScore];

    }
    self.collectionView.frame = frame;
        }
            }
    else{
      
        if(PopMsg==1){
            PopMsg=0;
            alertView = [[UIAlertView alloc] initWithTitle:@"Missed!"
                                                   message:@"Hey Nice Hope You Enjoy A Lot and Sorry You Missed So rubi Stop the Game Its Out of Rule.. "
                                                  delegate:self
                                         cancelButtonTitle:@"Bye Bye Rubi"
                                         otherButtonTitles:@"Play Again Rubi", nil];
            
            [alertView show];
        }
}
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    if(buttonIndex==0){
        exit(0);
    }
    else{
        resumeStatus=1;
        [self startGame];
        CGRect frame = self.collectionView.frame;
        frame.origin.x=0;
        frame.origin.y =  -174;
        self.collectionView.frame = frame;
        [_collectionView reloadData];

    }
}

-(void)setUserName:(NSString *)tName{
    name =tName;
}
@end
