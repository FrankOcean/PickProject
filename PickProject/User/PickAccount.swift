//
//  PickAccount.swift
//  PickProject
//
//  Created by puyang on 2018/7/1.
//  Copyright © 2018年 Frank. All rights reserved.
//

import Foundation

open class PickAccount {
    
    open let username: String
    open let email   : String
    open let user_id   : String
    open let user_token: String
    open let deviceid: String
    
    public init(username: String, email: String, user_id: String, user_token: String, deviceid: String) {
        self.username = username
        self.email    = email
        self.user_id  = user_id
        self.deviceid   = deviceid
        self.user_token = user_token
    }
    
    open func dictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["username"]   = username
        dict["email"]      = email
        dict["user_id"]    = user_id
        dict["deviceid"]   = deviceid
        dict["user_token"] = user_token
        return dict
    }
    
    public class PkAProfile {
        open var displayName: String?
        open let email: String
        open let avatar: Avatar
        
        init(email: String, displayName: String?, avatar: URL?) {
            self.email = email
            self.displayName = displayName
            self.avatar = Avatar(url: avatar)
        }
        
        enum ImageDownloadState {
            case notStarted
            case started
            case failedCanRetry
            case failedCanNotRetry
            case succeededMalformed
            case succeeded
        }
        
        open class Avatar {
            open var image: UIImage?
            open let url: URL?
            var currentImageState: ImageDownloadState = .notStarted
            
            init(url: URL?) {
                self.image = UIImage(named: "placeholder-avatar")  // 在这里给一个默认头像
                self.url = url
                self.updateAvatarImageState()
            }
            
            func updateAvatarImageState() {
                switch currentImageState {
                case .notStarted:
                    self.currentImageState = .started
                    self.downloadAvatar()
                    break
                case .failedCanRetry:
                    self.downloadAvatar()
                    break
                default:
                    break
                }
            }
            
            func downloadAvatar() {
                SDWebImageManager.shared().loadImage(with: url, options: [.continueInBackground, .lowPriority], progress: nil) { (image, _, error, _, success, _) in
                    if let error = error {
                        if (error as NSError).code == 404 || self.currentImageState == .failedCanRetry {
                            // Image is not found or failed to download a second time
                            self.currentImageState = .failedCanNotRetry
                        } else {
                            // This could have been a transient error, attempt to download the image only once more
                            self.currentImageState = .failedCanRetry
                            self.updateAvatarImageState()
                        }
                        return
                    }
                    
                    if success == true && image == nil {
                        self.currentImageState = .succeededMalformed
                        return
                    }
                    
                    self.image = image
                    self.currentImageState = .succeeded
//                    NotificationCenter.default.post(name: .FirefoxAccountProfileChanged, object: self)
                }
            }
        }
    }

    
}

