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
import CardParts

class AdsModelSelectController: CardPartsViewController {
    
    let cardPartTextView = CardPartTextView(type: .normal)
    let emojis: [String] = ["😎", "🤪", "🤩"]
    let titles: [String] = ["图片", "视频", "图片+视频"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.darkGray
        
        cardPartTextView.text = "这是模式选择页面"
        
        var stackViews: [CardPartStackView] = []
        var i = 0
        for t in titles {
            
            i+=1
            
            let sv = CardPartStackView()
            sv.axis = .vertical
            sv.spacing = 8
            stackViews.append(sv)
            
            let title = CardPartTextView(type: .normal)
            title.text = "\(t)"
            title.textAlignment = .center
            sv.addArrangedSubview(title)
            
            let emoji = CardPartTextView(type: .normal)
            emoji.text = self.emojis[Int(arc4random_uniform(UInt32(self.emojis.count)))]
            emoji.textAlignment = .center
            sv.addArrangedSubview(emoji)
            
            let btn = CardPartButtonView()
            btn.setTitle("选择广告模式", for: .normal)
            btn.contentHorizontalAlignment = .center
            btn.backgroundColor = UIColor.blue
            btn.tag = 100 + i
            btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
            sv.addArrangedSubview(btn)
        }
        
        let cardPartPagedView = CardPartPagedView(withPages: stackViews, andHeight: UIScreen.main.bounds.size.height-64)
        cardPartPagedView.backgroundColor = UIColor.cyan
        
        setupCardParts([cardPartTextView, cardPartPagedView])
    }
    
    @objc func btnClick(_ sender: UIButton) {
        let tag = sender.tag - 100
        switch tag {
        case 1: print("图片")
        case 2: self.navigationController?.pushViewController(InvestVideoEditController(), animated: true)
        case 3: print("图片+视频")

        default:
            print("Error")
        }
    }
   
  

}
