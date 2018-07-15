//
//  AdressSelectVController.swift
//  PickProject
//
//  Created by puyang on 2018/7/14.
//  Copyright © 2018年 Frank. All rights reserved.
//
/*
 *  投放地点
 */

import UIKit

class AdressSelectVController: BaseViewController {

    @IBOutlet weak var tableView: ExpandableTableView!
    
    var cell: UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: SubAdressSelCell.ID)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.expandableDelegate = self
        tableView.animation = .automatic
        
        tableView.register(UINib(nibName: "SubAdressSelCell", bundle: nil), forCellReuseIdentifier: SubAdressSelCell.ID)
        tableView.register(UINib(nibName: "AdressSelectCell", bundle: nil), forCellReuseIdentifier: AdressSelectCell.ID)
        
        tableView.openAll()
    }
    
    deinit {
        print("没有循环引用")
    }
    
}

extension AdressSelectVController: ExpandableDelegate {
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: SubAdressSelCell.ID) as! SubAdressSelCell
                cell1.numberLabel.text = "First: 535347892735"
                let cell2 = tableView.dequeueReusableCell(withIdentifier: SubAdressSelCell.ID) as! SubAdressSelCell
                cell2.numberLabel.text = "Sceond: 535347892735"
                let cell3 = tableView.dequeueReusableCell(withIdentifier: SubAdressSelCell.ID) as! SubAdressSelCell
                cell3.numberLabel.text = "Third: 535347892735"
                return [cell1, cell2, cell3]
                
            case 2:
                return [cell, cell]
            case 3:
                return [cell]
                
            default:
                break
            }
        default:
            break
        }
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return [44, 44, 44]
                
            case 2:
                return [44, 44, 44]
                
            case 3:
                return [44]
                
            default:
                break
            }
        default:
            break
        }
        return nil
        
    }
    
    func numberOfSections(in tableView: ExpandableTableView) -> Int {
        return 2
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        //        print("didSelectRow:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        //        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? SubAdressSelCell {
            print("\(cell.numberLabel.text ?? "")")
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0, 2, 3:
                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: AdressSelectCell.ID) else { return UITableViewCell() }
                return cell
                
            case 1, 4:
                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: AdressSelectCell.ID)  else { return UITableViewCell() }
                return cell
                
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0, 1, 2, 3, 4:
                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: AdressSelectCell.ID) else { return UITableViewCell() }
                return cell
                
            default:
                break
            }
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0, 2, 3:
                return 120
                
            case 1, 4:
                return 120
                
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0, 1, 2, 3, 4:
                return 120
                
            default:
                break
            }
        default:
            break
        }
        
        return 120
    }
    
//    func expandableTableView(_ expandableTableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        let cell = expandableTableView.cellForRow(at: indexPath)
//        cell?.contentView.backgroundColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
//        cell?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func expandableTableView(_ expandableTableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        //        let cell = expandableTableView.cellForRow(at: indexPath)
        //        cell?.contentView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        //        cell?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    }
    
    //    func expandableTableView(_ expandableTableView: ExpandableTableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Section \(section)"
    //    }
    //
    //    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 33
    //    }
}

