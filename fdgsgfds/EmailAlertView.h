//
//  EmailAlertView.h
//  rlm-referral
//
//  Created by LiuBliss on 15/10/24.
//  Copyright © 2015年 Neatly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailAlertView : UIAlertView

- (void)initViewTitle:(nullable  NSString *)title message:(nullable NSString *)message delegate:(nullable id)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles;

@end
