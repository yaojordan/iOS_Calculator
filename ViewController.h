//
//  ViewController.h
//  Caculator
//
//  Created by 姚宇鴻 on 2016/10/8.
//  Copyright © 2016年 JordanYao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculation.h"

@interface ViewController : UIViewController
{
    __weak IBOutlet UILabel *display_label;
    Calculation *cal;
    bool isFirstDigit;
    bool hasTapEqual;
    double operand;
    double result;
    int digitCount;
    int digit;
}
@property (weak, nonatomic) IBOutlet UILabel *display_label;
-(void)processCalc:(char)op;
-(void)displayProcess:(double)num;
- (IBAction)tapAC:(id)sender;
- (IBAction)tapPlus:(id)sender;
- (IBAction)tapMinus:(id)sender;
- (IBAction)tapMultiply:(id)sender;
- (IBAction)tapDivide:(id)sender;
- (IBAction)tapDigit:(id)sender;
- (IBAction)tapEqual:(id)sender;


@end

