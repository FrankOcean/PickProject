//
//  ViewController.swift
//  TMProject
//
//  Created by Frank on 2018/5/25.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit
import LifetimeTracker

class DetailItem: LifetimeTrackable {
    
    class var lifetimeConfiguration: LifetimeConfiguration {
        return LifetimeConfiguration(maxCount: 3, groupName: "Detail Item", groupMaxCount: 3)
    }
    
    init() {
        self.trackLifetime()
    }
}

class BaseViewController: UIViewController, LifetimeTrackable {
  
    fileprivate var statusBarShouldLight = false

    static var lifetimeConfiguration = LifetimeConfiguration(maxCount: 1, groupName: "VC")

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        trackLifetime()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        trackLifetime()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = .white
        self.navBarBgAlpha = 1
        self.navBarTintColor = .black
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if statusBarShouldLight {
            return .lightContent
        } else {
            return .default
        }
    }
    
}

