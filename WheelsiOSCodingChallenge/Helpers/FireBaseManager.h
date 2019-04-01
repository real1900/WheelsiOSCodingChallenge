//
//  FireBaseManager.h
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 3/31/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Person.h"

@import Firebase;





@interface FireBaseManager : NSObject {}

@property (strong, nonatomic) FIRDatabaseReference *databaseReference;
@property (strong, nonatomic) Person * person;


+ (id)sharedManager;
-(void)setFireValue:(id)value ForKey:(NSString *)key andCompletionHandler:(void (^)(BOOL success))completionHandler;
-(void)setFireValues:(NSDictionary *)dictionary andCompletionHandler:(void (^)(BOOL success))completionHandler;
@end
