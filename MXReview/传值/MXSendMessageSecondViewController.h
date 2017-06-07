//
//  MXSendMessageSecondViewController.h
//  MXReview
//
//  Created by 马霄 on 22/05/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sendMessageDelegate <NSObject>

- (void)sendMessage:(NSString *)message;

@end

@interface MXSendMessageSecondViewController : UIViewController

typedef void(^sendMessage)(NSString *message);

@property(nonatomic, weak) id <sendMessageDelegate> delegate;

@property (nonatomic, copy) sendMessage block;

@end
