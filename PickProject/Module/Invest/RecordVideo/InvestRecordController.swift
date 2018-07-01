//
//  InvestRecordController.swift
//  PickProject
//
//  Created by puyang on 2018/6/13.
//  Copyright © 2018年 Frank. All rights reserved.
//
/*
 * 视频录制
 */

import UIKit

class InvestRecordController: BaseViewController , PLShortVideoEditorDelegate{
  
    var videoConfiguration: PLSVideoConfiguration = PLSVideoConfiguration.default()
    var audioConfiguration: PLSAudioConfiguration = PLSAudioConfiguration.default()
    var shortVideoRecoder : PLShortVideoRecorder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 创建拍摄 recorder 对象
    func setUpRecorder() {
        shortVideoRecoder = PLShortVideoRecorder.init(videoConfiguration: videoConfiguration, audioConfiguration: audioConfiguration)
        //  添加摄像头预览视图 将预览视图添加为当前视图的子视图
        self.view.addSubview((self.shortVideoRecoder?.previewView)!)
    }
    
    //开始采集  在开始录制前需要开启采集，开启采集后才能看到摄像头预览
    func startSession() {
        self.shortVideoRecoder?.startCaptureSession()
    }
    
    //     设置拍摄时长     设置实际拍摄过程中的最大拍摄时长，最小拍摄时长
    func setUpRecoderMaxTime(_ minTime: CGFloat, _ maxTime: CGFloat) {
        self.shortVideoRecoder?.minDuration = minTime
        self.shortVideoRecoder?.maxDuration = maxTime
    }
    
    // 横屏拍摄 设置是否根据设备的方向自动确定竖屏、横屏拍摄
    // 默认为 NO，不启用自动确定
    // 注意：当 adaptationRecording 为 YES 时，可通过 deviceOrientationBlock 的回调，来获取设备方向，该属性初始化后修改无效
    func adaptationRecoding(_ adapt: Bool) {
        self.shortVideoRecoder?.adaptationRecording = adapt
    }
    
    // 6.1.8 背景音乐 设置拍摄时的背景音乐
    func setUpBackgroundMusic(_ audioURL:String, _ musicVolume: Float, _ videoVolume: Float) {
        self.shortVideoRecoder?.mixAudio(URL.init(string: audioURL))
        // 在退出当前拍摄页面进入下一页面前，需要执行下面的代码段对拍摄的视频进行处理
        self.shortVideoRecoder?.mix(withMusicVolume: musicVolume, videoVolume: videoVolume, completionHandler: { (composition, audioMix, error) in
            
        })
        //[self.shortVideoRecorder mixWithMusicVolume:0.3 videoVolume:0.8 completionHandler:^(AVMutableComposition * _Nullable composition, AVAudioMix * _Nullable audioMix, NSError * _Nullable error) {  }];
        //  注意：需在completionHandler中使用AVAssetExportSession对原视频进行处理，否则无效，点击此处查看示例代码 https://github.com/pili-engineering/PLShortVideoKit/blob/master/Example/PLShortVideoKitDemo/RecordViewController.m
    }
    
    //6.1.9视频草稿 加载视频草稿，即拍摄了一段视频保存到了草稿箱，在下次拍摄时，可以从草稿箱读取视频继续拍摄或编辑。
    func storeVideoDraft(_ draftVideoURL: URL) {
        self.shortVideoRecoder?.insertVideo(draftVideoURL)
    }
    
    //6.1.10 截图 在预览时，可以截取预览时的图像。
    func getScreenShot() -> UIImage? {
        var imageCopy: UIImage?
        self.shortVideoRecoder?.getScreenShot(completionHandler: { (image) in
            imageCopy = image?.copy() as! UIImage?
        })
        return imageCopy
        //[self.shortVideoRecorder getScreenShotWithCompletionHandler:^(UIImage * _Nullable image) {}
    }
    
    /// 6.1.11 开始拍摄 录制的视频的存放地址由 SDK 内部自动生成
    ///
    /// - Parameter customFileURL: 录制的视频的存放地址，该参数可以在外部设置，录制的视频会保存到该位置
   
    func startRecording(_ customFileURL: URL) {
        self.shortVideoRecoder?.startRecording(customFileURL)
    }
    
    func startRecoding() {
        self.shortVideoRecoder?.startRecording()
    }
    
    
    ///6.1.12 停止拍摄
    func stopRecoding() {
        self.shortVideoRecoder?.stopRecording()
    }
    
    /// 停止采集
    func stopSession() {
        self.shortVideoRecoder?.stopCaptureSession()
    }
    /*

     
     */

    


}
