//
//  GVTextField.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import UIKit

public struct TextFieldSetup {
    
    var required = false
    var validate = true
    var requiredErrorMessage : String
    var validateErrorMessage : String
    var regexValidation : String
    var name : String

    init(name:String, required:Bool = true, validate:Bool = true, requiredErrorMessage:String, validateErrorMessage:String, regexValidation:String) {
        
        self.name = name
        self.required = required
        self.validate = validate
        self.requiredErrorMessage = requiredErrorMessage
        self.validateErrorMessage = validateErrorMessage
        self.regexValidation = regexValidation
        
    }
}


class GVTextField: UITextField {

    var setup:TextFieldSetup?
    
    convenience init(setup:TextFieldSetup, frame: CGRect) {
        self.init(frame: frame)
        self.setup = setup
    }
    
    override init(frame: CGRect) {
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
