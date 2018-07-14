//
//  TailleView.swift
//  accordion
//
//  Created by Mac on 03/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import TextFieldEffects

class TailleView: UIView, UITextFieldDelegate{
    
    
    @IBOutlet weak var regionTxt: HoshiTextField!
    @IBOutlet weak var tailleText: HoshiTextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tailleText.keyboardType = UIKeyboardType.numberPad
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
