//
//  ViewController.m
//  XLsn0wXib
//
//  Created by XLsn0w on 2018/5/26.
//  Copyright © 2018年 XLsn0w. All rights reserved.
//

#import "ViewController.h"
#import "XLsn0wNib.h"
#import "NibView.h"
#import "flagView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NibView* nibView = (NibView*)[XLsn0wNib loadNib:@"NibView"];
    nibView.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:nibView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
