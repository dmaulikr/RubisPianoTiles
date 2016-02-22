//
//  ViewController.m
//  PiyanoTiles
//
//  Created by Developer8 on 2/17/16.
//  Copyright © 2016 Mohan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     _buttonPlay.enabled=false;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPlay:(id)sender {
    TilesPageViewController *stv = [TilesPageViewController new];
    stv = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayBody"];
    [stv setUserName:[NSString stringWithFormat:@"HI %@",_textUserName.text]];
    [self.navigationController pushViewController:stv animated:true];
    

}

- (IBAction)textChanged:(id)sender {
    if([_textUserName.text length]>3&&[_textUserName.text length]<15){
        _buttonPlay.enabled=true;
    }
    else{
          _buttonPlay.enabled=false;
    }
}
@end
