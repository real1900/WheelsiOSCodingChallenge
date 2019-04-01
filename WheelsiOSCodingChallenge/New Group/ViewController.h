//
//  ViewController.h
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 3/27/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FireBaseManager.h"
#import "NumberFormatter.h"
#import "PaddedTextField.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet PaddedTextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet PaddedTextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet PaddedTextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet PaddedTextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) FireBaseManager * fireBaseManager;
@property (strong, nonatomic) NumberFormatter * numberFormatter;
@property (nonatomic) BOOL editMode;


@end


