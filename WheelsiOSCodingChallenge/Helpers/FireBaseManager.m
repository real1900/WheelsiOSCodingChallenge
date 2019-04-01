//
//  FireBaseManager.m
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 3/31/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FireBaseManager.h"


@implementation FireBaseManager

@synthesize databaseReference;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static FireBaseManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        [FIRApp configure];
        self.databaseReference = [[FIRDatabase database] reference];
        self.person = [[Person alloc] init];
    }

    
    return self;
}

-(void)setFireValue:(id)value ForKey:(NSString *)key andCompletionHandler:(void (^)(BOOL success))completionHandler{

    [[[databaseReference child:@"coding-challenge"] child:self.person.candidate_id] setValue:@{key: value} withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {

        if (error) {
            NSLog(@"%@ could not be saved: %@",key,  [error localizedDescription]);
            completionHandler(FALSE);
        } else {
            NSLog(@"%@ saved successfully.",key);
            completionHandler(TRUE);
        }
    }];
}

-(void)setFireValues:(NSDictionary *)dictionary andCompletionHandler:(void (^)(BOOL success))completionHandler{

    [[[databaseReference child:@"coding-challenge"] child:self.person.candidate_id] updateChildValues:dictionary withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (error != nil) {
            // Uh-oh, an error occurred!
            NSLog(@"%@",[error localizedDescription]);
            completionHandler(FALSE);
        } else {
            // Metadata contains file metadata such as size, content-type, and download URL.
            NSLog(@"data saved successfully for %@.",self.person.candidate_id);
            completionHandler(TRUE);
        }

    }];

}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
