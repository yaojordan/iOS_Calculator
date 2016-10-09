//
//  ViewController.m
//  Caculator
//
//  Created by 姚宇鴻 on 2016/10/8.
//  Copyright © 2016年 JordanYao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize display_label;

- (void)viewDidLoad {
    //計算機初始化
    cal = [Calculation new];
    cal.isFirstOperand=1;
    isFirstDigit=1;
    hasTapEqual=0;
    [display_label setText:@"0."];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapAC:(id)sender {
    [display_label setText:@"0."];
    cal.operandA=0;
    cal.operandB=0;
    cal.isFirstOperand=1;
    result=0;
    operand=0;
    isFirstDigit=1;
    hasTapEqual=0;
}

- (IBAction)tapPlus:(id)sender {
    [self processCalc:'+'];
}

- (IBAction)tapMinus:(id)sender {
    [self processCalc:'-'];
}

- (IBAction)tapMultiply:(id)sender {
    [self processCalc:'*'];
}

- (IBAction)tapDivide:(id)sender {
    [self processCalc:'/'];
}

- (IBAction)tapEqual:(id)sender {
    if(cal.isFirstOperand!=1)
    {
        cal.operandB=operand;
        result=[cal calcResult];
        [self displayProcess:result];
        cal.operandA=result;
        hasTapEqual=1;
    }
}

- (IBAction)tapDigit:(id)sender {
    
    digit = [sender tag];
    if(isFirstDigit && digit==0)
        isFirstDigit=1;
    else{
        if(digitCount>=9)
            return;
    
        isFirstDigit = 0;
        operand = operand*10 + digit;
        [self displayProcess:operand];
    }
    digitCount++;
}

-(void)processCalc:(char)op{
    if(cal.isFirstOperand){
        cal.operandA = operand;
        cal.isFirstOperand=0;
    }
    else if (hasTapEqual){
        cal.operandA=result;
        cal.operandB=operand;
        hasTapEqual=0;
    }
    else{
        cal.operandB=operand;
        result=[cal calcResult];
        [self displayProcess:result];
        cal.operandA=result;
    }
    cal.op=op;
    operand=0;
    digitCount=0;
}

-(void)displayProcess:(double)num{
    NSMutableString *str=[NSMutableString stringWithFormat:@"%f", num];
    int zeroLength = [str length] - 1;
    int zeroIndex = zeroLength;
    BOOL zeroBreak = TRUE;
    while(zeroBreak){
        if([str characterAtIndex:zeroIndex]!='0'){
            zeroBreak=false;
        }else
            zeroIndex--;
    }
    [str deleteCharactersInRange:NSMakeRange(zeroIndex+1, zeroLength-zeroIndex)];
    [display_label setText:str];
}








@end
