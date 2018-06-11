//
//  AdsModelSelectController.swift
//  PickProject
//
//  Created by puyang on 2018/6/12.
//  Copyright © 2018年 Frank. All rights reserved.
//

/*
 * 广告模式选取页面
 */

import UIKit

class AdsModelSelectController: BaseCollectionVController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = ["1","2","3"]
        self.colltionView?.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
