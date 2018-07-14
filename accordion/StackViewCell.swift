//
//  StackViewCell.swift
//  accordion
//
//  Created by Mac on 03/07/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class StackViewCell: UITableViewCell {
    
    @IBOutlet weak var openView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var drop: UIImageView!
    var cellExists:Bool = false
    @IBOutlet weak var stuffView: UIView!{
        didSet{
            stuffView?.isHidden = true
            stuffView?.alpha = 0
        }
    }
    
    @IBOutlet weak var open: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func animate(duration:Double, c:@escaping()->Void){
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: duration, animations: {
                self.stuffView.isHidden = !self.stuffView.isHidden
                if self.stuffView.alpha == 1{
                    self.stuffView.alpha = 0.5
                    self.drop.transform = CGAffineTransform(rotationAngle: 0)
                }else{
                    self.stuffView.alpha = 1
                    self.drop.transform = CGAffineTransform(rotationAngle: .pi/2)
                }
            })
        }, completion:{
            (finished:Bool) in
            print("animation complete")
            c()
        })
    }
    
}
