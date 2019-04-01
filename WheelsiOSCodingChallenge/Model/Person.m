//
//  User.m
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 4/1/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

@synthesize firstName, lastName, phoneNumber, emailAddress, image, candidate_id;


- (id)initWithName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber emailAddress:(NSString *)emailAddress  {
    if ((self = [super init])) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
        self.emailAddress = emailAddress;
    }
    return self;
}




@end

