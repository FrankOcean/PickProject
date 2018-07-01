//
//  VideoEditVController.h
//  PickProject
//
//  Created by puyang on 2018/6/18.
//  Copyright © 2018年 Frank. All rights reserved.
//
// 编辑预览
// 编辑类 PLShortVideoEditor 支持渲染音视频、水印、滤镜、背景音乐

#import <UIKit/UIKit.h>
#import <PLShortVideoKit/PLShortVideoKit.h>

@interface VideoEditVController : UIViewController<PLShortVideoEditorDelegate>

@property (strong, nonatomic) PLShortVideoEditor *videoEditor;

@end
