//
//  PhotoPickerViewController.m
//  WheelsiOSCodingChallenge
//
//  Created by Suleman Imdad on 3/29/19.
//  Copyright © 2019 Suleman Imdad. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "ViewController.h"

@interface PhotoPickerViewController ()

@end

@implementation PhotoPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fireBaseManager = [FireBaseManager sharedManager];
    self.saveButton.enabled = FALSE;
    self.imageView.layer.cornerRadius = self.imageView.layer.bounds.size.height/2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imageView.layer.borderWidth = 1.0;
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
    self.saveButton.enabled = TRUE;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"goToProfileView"]){
        ViewController * viewController = (ViewController *)segue.destinationViewController;
        viewController.editMode = TRUE ;
    }
}

- (IBAction)saveAction:(id)sender {
    self.saveButton.enabled = FALSE;
    NSString *imageData = [UIImagePNGRepresentation(self.imageView.image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [self performSegueWithIdentifier:@"goToProfileView" sender:sender];
    [self.fireBaseManager setFireValue:imageData ForKey:@"imageName" andCompletionHandler:^(BOOL success) {
    }];
}

@end

