//
//  Calculation.h
//  Caculator
//
//  Created by 姚宇鴻 on 2016/10/8.
//  Copyright © 2016年 JordanYao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculation : NSObject
{
    double operandA;
    double operandB;
    double result;
    char op;
    bool isFirstOperand;
}

@property double operandA;
@property double operandB;
@property double result;
@property char op;
@property bool isFirstOperand;
-(double) calcResult;

@end
