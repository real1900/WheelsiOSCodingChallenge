//
//  PhotoPickerViewController.h
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 3/29/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FireBaseManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoPickerViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) NSString * candidate_id;
@property (weak, nonatomic) FireBaseManager * fireBaseManager;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

NS_ASSUME_NONNULL_END

