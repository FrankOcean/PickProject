//
//  BaseModel.swift
//  PickProject
//
//  Created by puyang on 2018/6/11.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    override init() {
    
    }
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
