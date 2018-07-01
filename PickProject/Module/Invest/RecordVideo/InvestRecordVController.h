//
//  InvestRecordVController.h
//  PickProject
//
//  Created by puyang on 2018/6/18.
//  Copyright © 2018年 Frank. All rights reserved.
//
//  录制

#import <UIKit/UIKit.h>
#import <PLShortVideoKit/PLShortVideoKit.h>

@interface InvestRecordVController : UIViewController

@property (strong, nonatomic) PLSVideoConfiguration *videoConfiguration;
@property (strong, nonatomic) PLSAudioConfiguration *audioConfiguration;

@end
