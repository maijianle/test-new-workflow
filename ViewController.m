//
//  ViewController.m
//  Test1Alert
//
//  Created by LiuBliss on 15/10/24.
//  Copyright © 2015年 LiuBliss. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"

@interface ViewController ()<CustomAlertViewControllerDelegate>
{
    BOOL isf;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isf = NO;
}
- (IBAction)testButton:(id)sender {
    CustomViewController *custom = [[CustomViewController alloc] initWithTitle:@"Reset Password" message:@"Please enter your email address" delegate:self cancelButtonTitle:@"Ccccc" otherButtonTitles:@"OK" alertViewStyleType:AlertViewStyleSecureTextInput];
    
    [self presentViewController:custom animated:YES completion:nil];
}

- (void)customAlertView:(CustomViewController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex titleText:(NSString *)titleText
{
   
    [alertView dismissViewControllerAnimated:YES completion:nil];
}

- (void)didEnterBackground:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [self.presentedViewController dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
