//
//  Calculation.m
//  Caculator
//
//  Created by 姚宇鴻 on 2016/10/8.
//  Copyright © 2016年 JordanYao. All rights reserved.
//

#import "Calculation.h"

@implementation Calculation
@synthesize operandA, operandB, result, op, isFirstOperand;

-(double)calcResult{
    switch (op) {
        case '+':
            result = operandA + operandB;
            break;
        case '-':
            result = operandA - operandB;
            break;
        case '*':
            result = operandA * operandB;
            break;
        case '/':
            result = operandA / operandB;
            break;
    }
    return result;
}

@end
