//
//  BaseNavViewController.swift
//  TMProject
//
//  Created by Frank on 2018/5/25.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit

class BaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if(self.childViewControllers.count == 1){
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
