//
//  ViewController.m
//  ProgressView
//
//  Created by huixinming on 2/15/16.
//  Copyright © 2016 huixinming. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ProgressView *view = [[ProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //view.backgroundColor = [UIColor greenColor];
    view.progress = 0.5;
    [self.view addSubview:view];
    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
