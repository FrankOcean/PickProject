//
//  ThemeViewController.swift
//  TMProject
//
//  Created by puyang on 2018/5/27.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit
import CardParts

class ThemeViewController: CardsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Comment out one of the loadCard functions to change cards and/or their order
        let cards: [CardPartsViewController] = [
            ThemedCardController(title: "These"),
            ThemedCardController(title: "Are"),
            ThemedCardController(title: "Themed"),
            ThemedCardController(title: "Cards!")
        ]
        
        loadCards(cards: cards)
    }
}
