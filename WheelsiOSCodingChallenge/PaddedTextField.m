//
//  PaddedTextField.m
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 4/1/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import "PaddedTextField.h"

@implementation PaddedTextField

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 8,
                      bounds.size.width - 20, bounds.size.height - 16);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}
@end

