//
//  InvestRecordVController.m
//  PickProject
//
//  Created by puyang on 2018/6/18.
//  Copyright © 2018年 Frank. All rights reserved.
//

#import "InvestRecordVController.h"

@interface InvestRecordVController ()

@property (strong, nonatomic) PLShortVideoRecorder *shortVideoRecorder;

@end

@implementation InvestRecordVController

- (instancetype)init{
    if (self = [super init]) {}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 创建拍摄 recorder 对象
- (void)setUpRecorder{
    self.shortVideoRecorder = [[PLShortVideoRecorder alloc] initWithVideoConfiguration:self.videoConfiguration audioConfiguration:self.audioConfiguration];
    //  添加摄像头预览视图 将预览视图添加为当前视图的子视图
    [self.view addSubview:self.shortVideoRecorder.previewView];
}

//开始采集  在开始录制前需要开启采集，开启采集后才能看到摄像头预览
- (void)startSession{
    [self.shortVideoRecorder startCaptureSession];
}

//     设置拍摄时长     设置实际拍摄过程中的最大拍摄时长，最小拍摄时长
- (void)setUpRecoderMaxMinTimeWithMax:(CGFloat)maxTime Min: (CGFloat)minTime{
    // 单位为秒
    self.shortVideoRecorder.maxDuration = maxTime < 1 ? maxTime: 60.0f;
    self.shortVideoRecorder.minDuration = minTime < maxTime ? minTime: maxTime;
}

// 横屏拍摄 设置是否根据设备的方向自动确定竖屏、横屏拍摄
// 默认为 NO，不启用自动确定
// 注意：当 adaptationRecording 为 YES 时，可通过 deviceOrientationBlock 的回调，来获取设备方向，该属性初始化后修改无效
- (void)adaptationRecoding:(BOOL)adapt {
    self.shortVideoRecorder.adaptationRecording = adapt;
}

//背景音乐 设置拍摄时的背景音乐
- (void)setUpBackgroundMusicURL:(NSString *)audioURL MusicVolume:(CGFloat)musicVolume VideoVolume:(CGFloat)videoVolume{
    self.shortVideoRecorder.recoderRate = PLSVideoRecoderRateNormal; // 倍速正常
    [self.shortVideoRecorder mixAudio:[NSURL URLWithString:audioURL]];
    // 在退出当前拍摄页面进入下一页面前，需要执行下面的代码段对拍摄的视频进行处理
    [self.shortVideoRecorder mixWithMusicVolume:musicVolume videoVolume:videoVolume completionHandler:^(AVMutableComposition * _Nullable composition, AVAudioMix * _Nullable audioMix, NSError * _Nullable error) {
        //  注意：需在completionHandler中使用AVAssetExportSession对原视频进行处理，否则无效，点击此处查看示例代码 https://github.com/pili-engineering/PLShortVideoKit/blob/master/Example/PLShortVideoKitDemo/RecordViewController.m
    }];
}

//视频草稿 加载视频草稿，即拍摄了一段视频保存到了草稿箱，在下次拍摄时，可以从草稿箱读取视频继续拍摄或编辑。
- (void)storeVideoDraftWithURL:(NSURL *)draftVideoURL {
    [self.shortVideoRecorder insertVideo:draftVideoURL];
}

// 截图 在预览时，可以截取预览时的图像。
- (void)getScreenShot {
    [self.shortVideoRecorder getScreenShotWithCompletionHandler:^(UIImage * _Nullable image) {
        NSLog(@"%@",image);
    }];
}

//开始拍摄 录制的视频的存放地址由 SDK 内部自动生成
// - Parameter customFileURL: 录制的视频的存放地址，该参数可以在外部设置，录制的视频会保存到该位置
- (void)startRecordingWithURL:(NSURL *)customFileURL {
    if (customFileURL.absoluteString.length >= 4) {
        [self.shortVideoRecorder startRecording:customFileURL];
    }else{
        [self.shortVideoRecorder startRecording];
    }
}

//停止拍摄
- (void)stopRecoding {
    [self.shortVideoRecorder stopRecording];
}

//停止采集
- (void)stopSession {
    [self.shortVideoRecorder stopCaptureSession];
}

- (PLSVideoConfiguration *)videoConfiguration{
    if (!_videoConfiguration) {
        _videoConfiguration = [PLSVideoConfiguration defaultConfiguration];
    }
    return _videoConfiguration;
}

- (PLSAudioConfiguration *)audioConfiguration{
    if (!_audioConfiguration) {
        _audioConfiguration = [PLSAudioConfiguration defaultConfiguration];
    }
    return _audioConfiguration;
}

@end
