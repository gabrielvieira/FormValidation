//
//  GVTextField.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import UIKit

class GVTextField: UITextField {

    var required = false
    var validade = true
    var requiredErrorMessage : String?
    var validateErrorMessage : String?
    var regexValidation : String?
    var name : String?
    
    required override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
