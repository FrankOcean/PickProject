//
//  CombinationVController.swift
//  TMProject
//
//  Created by Frank on 2018/5/25.
//  Copyright © 2018年 Frank. All rights reserved.
//

/*
 投放首页
 功能: 1.进度管理
      2.广告模式选取入口
      3.投放地点选择
      4.投放时间段选择
      5.总价统计
 */

import UIKit

class InvestVController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topTableView: UITableView!
    let topArr:[String] = ["广告画面", "投放地点"]
    let topArrB:[String] = ["请上传", "请选择"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBarBgAlpha = 0
        
        self.view!.addSubview(topTableView)
        topTableView.dataSource = self
        topTableView?.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let title :String = topArr[indexPath.row]
        cell.textLabel!.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(AdsModelSelectController(), animated: true)
        }
    }

}
