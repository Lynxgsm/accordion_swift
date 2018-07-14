//
//  CodeProduitView.swift
//  accordion
//
//  Created by Mac on 03/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
class CodeProduitView: UIView {
    let stuffView = ViewController()
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var getValue: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func getValueInput(_ sender: Any) {
        stuffView.getValueFromEachSection(value: inputText.text!, selector:5)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBAction func giveValue(_ sender: Any) {
    }
}

