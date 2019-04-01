//
//  ViewController.m
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 3/27/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "NumberFormatter.h"


@interface ViewController ()

@end

@implementation ViewController

- (BOOL)editMode {
    return _editMode ? _editMode : FALSE;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberFormatter = [[NumberFormatter alloc] init];
    self.phoneNumberTextField.delegate = self;
    self.fireBaseManager = [FireBaseManager sharedManager];

    if (self.editMode == FALSE) {
        self.titleLabel.text = @"Please enter your information";
        self.imageView.hidden = TRUE;
        [self.actionButton setTitle:@"Next" forState:UIControlStateNormal];
    } else {


        self.firstNameTextField.text = self.fireBaseManager.person.firstName;
        self.lastNameTextField.text = self.fireBaseManager.person.lastName;
        self.phoneNumberTextField.text = self.fireBaseManager.person.phoneNumber;
        self.emailTextField.text = self.fireBaseManager.person.emailAddress;
        self.imageView.image = self.fireBaseManager.person.image;

        [self.actionButton setTitle:@"Update" forState:UIControlStateNormal];
        self.titleLabel.text = @"Update Profile";
        self.imageView.layer.cornerRadius = self.imageView.layer.bounds.size.height/2;
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.imageView.layer.borderWidth = 1.0;

    }
}

- (IBAction)saveButtonPressedAction:(id)sender {

    [self.activityIndicator startAnimating];
    self.actionButton.enabled = FALSE;

    Person * person = self.fireBaseManager.person;
    person.firstName = self.firstNameTextField.text;
    person.lastName = self.lastNameTextField.text;
    person.emailAddress = self.emailTextField.text;
    person.phoneNumber = self.phoneNumberTextField.text;
    person.candidate_id = [NSString stringWithFormat:@"%@-%@", person.firstName, person.lastName];

    if (person.firstName == nil
        || person.lastName == nil
        || person.emailAddress == nil
        || person.phoneNumber == nil){
        return;

    }

    NSMutableDictionary * dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:person.firstName forKey:@"firstName"];
    [dictionary setValue:person.lastName forKey:@"lastName"];
    [dictionary setValue:person.emailAddress forKey:@"email"];
    [dictionary setValue:person.phoneNumber forKey:@"phone"];

    if (self.editMode == TRUE) {

        NSString *imageData = [UIImagePNGRepresentation(self.imageView.image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [dictionary setValue:imageData forKey:@"imageName"];
    }


    [self.fireBaseManager setFireValues:dictionary andCompletionHandler:^(BOOL success) {

        [self.activityIndicator stopAnimating];
        self.actionButton.enabled = TRUE;
        if (success == true) {
            if (self.editMode == FALSE) {
                [self performSegueWithIdentifier:@"goToProfileImageVC" sender:sender];
            }else {
                [self showAlert:@"Data saved successfully!"];

            }
        } else {
            [self showAlert:@"Something went wrong!"];
        }

    }];
}

-(void)showAlert:(NSString *)message{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:nil
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];

    [alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)imageTapped:(UITapGestureRecognizer *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    self.fireBaseManager.person.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag != 99) {
        return TRUE;
    }
    return [self.numberFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

@end


