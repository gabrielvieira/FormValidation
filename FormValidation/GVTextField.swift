//
//  GVTextField.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import UIKit


enum GVTextFieldType {
    case email
    case tel
    case gere
}


class GVTextField: UITextField {
    
    var required = false
    var validate = true
    var requiredErrorMessage : String?
    var validateErrorMessage : String?
    var regexValidation : String?
    var name : String = "Field"
    
    func setType(_ type : GVTextFieldType){
        
        switch type {
        case .email:
            self.email()
            break
            
        default:
            
            break
            
        }
    }
    
    private func email(){
        
        self.required = true
        self.regexValidation = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        self.name = "Email"
    }
    
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
