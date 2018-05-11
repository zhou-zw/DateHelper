//
//  ViewController.m
//  DateHelperDemo
//
//  Created by zzw on 2018/5/11.
//  Copyright © 2018年 zzw. All rights reserved.
//

#import "ViewController.h"
#import "NSString+TimeString.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)exchange:(UIButton *)sender {
    
    NSNumber *timeStamp = [NSNumber numberWithDouble:[self.inputTextField.text doubleValue]];
    self.outputLabel.text = [NSString stringWithTimeStamp:timeStamp];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
