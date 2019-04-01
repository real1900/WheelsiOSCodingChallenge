//
//  User.m
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 4/1/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface Person : NSObject
@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* phoneNumber;
@property (nonatomic, strong) NSString* emailAddress;
@property (nonatomic, strong) UIImage *image;
@property (strong, nonatomic) NSString * candidate_id;
- (id)initWithName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber emailAddress:(NSString *)emailAddress;

@end
