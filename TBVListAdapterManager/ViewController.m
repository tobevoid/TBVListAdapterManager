//
//  ViewController.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/6/20.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "TBVListAdapterManager.h"
#import "TBVListTelephoneValidator.h"
#import "ViewController.h"

@interface ViewController ()
@property (assign, nonatomic) TBVListAdapterManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [[TBVListTelephoneValidator new] validateValue:@"010-86551122" name:@"asdf"]);
}


@end
