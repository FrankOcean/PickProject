//
//  BaseCollectionVController.swift
//  TMProject
//
//  Created by Frank on 2018/5/25.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit
import Alamofire

class BaseCollectionVController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var colltionView: UICollectionView?
    var dataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        colltionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        colltionView!.register(Home_Cell.self, forCellWithReuseIdentifier:"cell")
        colltionView?.delegate = self;
        colltionView?.dataSource = self;
        
        colltionView?.backgroundColor = UIColor.white
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width-50, height: 400)
        self.view.addSubview(colltionView!)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! Home_Cell
        cell.titleLabel!.text = "ssdfaskjdflksajklfdjs"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    
    class Home_Cell: UICollectionViewCell {
        
        let width = UIScreen.main.bounds.size.width
        var imgView : UIImageView?//cell上的图片
        var titleLabel:UILabel?//cell上title
        var priceLabel:UILabel?//cell上价格
        var readLabel:UILabel?//cell上的阅读量
        
        override init(frame: CGRect) {
            
            super.init(frame: frame)
            //初始化各种控件
            imgView = UIImageView(frame: CGRect(x: 0, y: 40, width: 200, height: 400))
            self.addSubview(imgView!)
            titleLabel = UILabel(frame: CGRect(x: 5, y: 20, width: (width-40)/2, height: 50))
            titleLabel?.numberOfLines = 0
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
            self .addSubview(titleLabel!)
            
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
  
}
