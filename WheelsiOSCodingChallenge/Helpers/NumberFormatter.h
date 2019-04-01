//
//  NumberFormatter.h
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 4/1/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NumberFormatter : NSObject


- (NSString *)formatNumber:(NSString *)mobileNumber;
- (int)getLength:(NSString *)mobileNumber;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@end
