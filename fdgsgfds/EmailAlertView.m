//
//  EmailAlertView.m
//  rlm-referral
//
//  Created by LiuBliss on 15/10/24.
//  Copyright © 2015年 Neatly. All rights reserved.
//

#import "EmailAlertView.h"

@interface EmailAlertView ()
{
    CGFloat alertHeight;
}
@end

@implementation EmailAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    
    return self;
}

- (void)initViewTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
    UIFont *font = [UIFont fontWithName:@"Texta-Regular" size:14];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width - 20, 30)];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = font;
    [self addSubview:titleLabel];
    alertHeight += titleLabel.frame.size.height + titleLabel.frame.origin.y;
    CGSize size = CGSizeMake(self.bounds.size.width - 20,CGFLOAT_MAX);
    CGSize messageHeight = [self sizeForString:message font:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, alertHeight + 5, self.bounds.size.width - 20, messageHeight.height)];
    messageLabel.numberOfLines = 0;
    messageLabel.text = message;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = font;
    [self addSubview:messageLabel];
    alertHeight += messageHeight.height;
    UIView *line1View = [[UIView alloc] initWithFrame:CGRectMake(0, alertHeight + 5, self.bounds.size.width, 0.5)];
    line1View.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1View];
    alertHeight += line1View.frame.size.height;
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, alertHeight, self.bounds.size.width / 2 - 0.5 / 2, 40)];
    [cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    cancelButton.tag = 100;
    [cancelButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    UIView *line2View = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 - 0.5 / 2, alertHeight + 5, 0.5, 40)];
    line2View.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line2View];
    UIButton *otherButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 + 0.5 / 2, alertHeight, self.bounds.size.width / 2 - 0.5 / 2, 40)];
    [otherButton setTitle:otherButtonTitles forState:UIControlStateNormal];
    [otherButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    otherButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    otherButton.tag = 200;
    [otherButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:otherButton];
}

- (void)layoutSubviews {
    //屏蔽系统的ImageView 和 UIButton
    [super layoutSubviews];
    for (UIView *v in [self subviews]) {
        if ([v class] == [UIImageView class]){
            [v setHidden:YES];
        }
        
        
        if ([v isKindOfClass:[UIButton class]] ||
            [v isKindOfClass:NSClassFromString(@"UIThreePartButton")]) {
            [v setHidden:YES];
        }
    }
    
    UIFont *font = [UIFont fontWithName:@"Texta-Regular" size:14];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width - 20, 30)];
    titleLabel.text = @"Reset Password";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = font;
    [self addSubview:titleLabel];
    alertHeight += titleLabel.frame.size.height + titleLabel.frame.origin.y;
    CGSize size = CGSizeMake(self.bounds.size.width - 20,CGFLOAT_MAX);
    NSString *message = @"Please enter your email";
    CGSize messageHeight = [self sizeForString:message font:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, alertHeight + 5, self.bounds.size.width - 20, messageHeight.height)];
    messageLabel.numberOfLines = 0;
    messageLabel.text = message;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = font;
    [self addSubview:messageLabel];
    alertHeight += messageHeight.height;
    UIView *line1View = [[UIView alloc] initWithFrame:CGRectMake(0, alertHeight + 5, self.bounds.size.width, 0.5)];
    line1View.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1View];
    alertHeight += line1View.frame.size.height;
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, alertHeight, self.bounds.size.width / 2 - 0.5 / 2, 40)];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    cancelButton.tag = 100;
    [cancelButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    UIView *line2View = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 - 0.5 / 2, alertHeight + 5, 0.5, 40)];
    line2View.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line2View];
    UIButton *otherButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 + 0.5 / 2, alertHeight, self.bounds.size.width / 2 - 0.5 / 2, 40)];
    [otherButton setTitle:@"OK" forState:UIControlStateNormal];
    [otherButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    otherButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    otherButton.tag = 200;
    [otherButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:otherButton];
}

- (CGSize)sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        CGRect boundingRect = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [string sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
}

- (void)show
{
    [super show];
    self.frame = CGRectMake(350, 300, 320, 191);
}

- (void)selectButton:(UIButton *)sender
{
    
}

@end
