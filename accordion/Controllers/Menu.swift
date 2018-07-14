//
//  Menu.swift
//  accordion
//
//  Created by MacOtwoo3 on 09/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class MenuController: UIView{
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var validateBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
