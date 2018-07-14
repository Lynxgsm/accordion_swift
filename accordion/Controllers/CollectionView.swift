//
//  CollectionView.swift
//  accordion
//
//  Created by Mac on 03/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import DropDown

class CollectionView: UIView {
    let dropDown = DropDown()

    @IBOutlet weak var anneeBtn: UIButton!
    @IBOutlet weak var saisonBtn: UIButton!
    @IBOutlet weak var anneeView: UIView!
    @IBOutlet weak var saisonView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dropDown.anchorView = saisonView
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
    }
    
    @IBAction func anneeTouch(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func saisonTouch(_ sender: Any) {
        dropDown.show()
    }
}

