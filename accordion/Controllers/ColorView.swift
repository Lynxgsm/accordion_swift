//
//  ColorView.swift
//  accordion
//
//  Created by Mac on 03/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ColorView: UIView {
    var colors = [UIColor](arrayLiteral: UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green)
    @IBOutlet weak var colorCollection: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

