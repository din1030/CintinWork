//
//  GeneralViewController.h
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CintinGlobalData.h"

@interface GeneralViewController : UIViewController

@property NSNumber *prevCharID;
@property (strong, nonatomic) IBOutlet UIView *hintView;
@property (strong, nonatomic) IBOutlet UILabel *hintString;
- (IBAction)clickHintClose:(id)sender;
- (IBAction)clickHintBtn:(id)sender;

@end
