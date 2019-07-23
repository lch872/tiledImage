//
//  ViewController.m
//  transocks.work
//
//  Created by Da.Lan on 2019/7/22.
//  Copyright © 2019 Da.Lan. All rights reserved.
//

#import "ViewController.h"
#import "LCScrollView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LCScrollView *scrollView  = [[LCScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
}

@end
