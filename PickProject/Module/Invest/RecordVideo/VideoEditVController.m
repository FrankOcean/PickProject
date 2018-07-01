//
//  VideoEditVController.m
//  PickProject
//
//  Created by puyang on 2018/6/18.
//  Copyright © 2018年 Frank. All rights reserved.
//

#import "VideoEditVController.h"

@interface VideoEditVController ()

@end

@implementation VideoEditVController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.videoEditor.previewView];
    
}

//添加水印
- (void)setWaterMkWithImage:(UIImage *)waterMarkImage position:(CGPoint)position{
    [self.videoEditor setWaterMarkWithImage:waterMarkImage position:position];
}

//移除水印
- (void)clearWaterMk{
    [self.videoEditor clearWaterMark];
}

//添加、移除滤镜
/**
 *  @param colorImagePath 当前使用的滤镜的颜色表图的路径
 *  当 colorImagePath 为 nil 时，表示移除滤镜。
 */
- (void)addFiltor:(NSString *)colorImagePath{
    [self.videoEditor addFilter:colorImagePath];
}

//添加背景音乐
/**
 *  @param musicURL 当前使用的背景音乐的地址
 *  @param timeRange 当前使用的背景音乐的有效时间区域(start, duration)。
 *                   如果想使用整段音乐，可以将其设置为 kCMTimeRangeZero
 *                   或者 (kCMTimeZero, duration)。
 *  @param volume 当前使用的背景音乐的音量
 */
- (void)addMsc:(NSURL *)musicURL timeRange:(CMTimeRange)timeRange volume:(NSNumber *)volume{
    [self.videoEditor addMusic:musicURL timeRange:timeRange volume:volume];
}

// 更新背景音乐
/**
 *  @param timeRange 使用 kCMTimeRangeZero 时，表示不更新背景音乐的播放时间区域
 *  @param volume 使用 nil 时，表示不更新背景音乐的音量
 *  只更新 timeRange 时，[xxxObj updateMusic:timeRange volume:nil]
 *  只更新 volume    时，[xxxObj updateMusic:kCMTimeRangeZero volume:volume]
 */
- (void)updateMsc:(CMTimeRange)timeRange volume:(NSNumber *)volume{
    [self.videoEditor updateMusic:timeRange volume:volume];
}

/**
 视频数据回调
 通过 PLShortVideoEditor 的 Delegate 回调方法来处理播放时的视频数据，可以动态改变滤镜效果，pixelBuffer 格式为 kCVPixelFormatType_32BGRA
 */
//- (CVPixelBufferRef)shortVideoEditor:(PLShortVideoEditor *)editor didGetOriginPixelBuffer:(CVPixelBufferRef)pixelBuffer{
//}

- (PLShortVideoEditor *)videoEditor{
    if (!_videoEditor) {
        _videoEditor = [[PLShortVideoEditor alloc] init];
        _videoEditor.delegate = self;
    }
    return _videoEditor;
}

@end
