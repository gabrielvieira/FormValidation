//
//  GVForm.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import Foundation

protocol GVFormDelegate {
    
    func formDidValidated(_ form: GVTextField)
    func formDidError(_ form:GVTextField, didFailWith error: NSError)
}

class GVForm {
    
    var delegate: GVFormDelegate?
    var fields : [GVTextField] = []
    
    required init(fields : [GVTextField]) {
        self.fields = fields
    }
    
    fileprivate func createError(textField:GVTextField, message:String) -> NSError {
        
        if (textField.setup?.name) != nil {
            return NSError(domain: (textField.setup?.name)!, code: 42, userInfo: ["message":message])
        }
        
        return NSError(domain: "invalid textfield", code: 666, userInfo: ["message":message])
    }
    
    func validate() {
    
        for field in self.fields {
        
            let genericError = self.createError(textField: field, message: "Invalid TextField")
            
            guard let required = field.setup?.required else {
                self.delegate?.formDidError(field, didFailWith: genericError)
                return
            }
            
            guard let validate = field.setup?.validate else {
                self.delegate?.formDidError(field, didFailWith: genericError)
                return
            }
            
            if required {
                
                if field.text == "" {
                    
                    if (field.setup?.requiredErrorMessage) != nil {
                        
                        let error = self.createError(textField: field, message: (field.setup?.requiredErrorMessage)!)
                        
                        delegate?.formDidError(field, didFailWith: error)
                    }
                    else{
                        let error = self.createError(textField: field, message: "\(String(describing: field.setup?.name)) is not valid!")
                        delegate?.formDidError(field, didFailWith: error)
                    }

                    return
                }
            }
            
            if validate {
                
                if let regex = field.setup?.regexValidation{
                    
                    let validText = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: field.text)
                    
                    if !validText{
                        
                        if (field.setup?.validateErrorMessage) != nil {
                            let error = self.createError(textField: field, message: (field.setup?.validateErrorMessage)!)
                            delegate?.formDidError(field, didFailWith: error)
                        }
                        else{
                            let error = self.createError(textField: field, message: "\(String(describing: field.setup?.name)) is not valid!")
                            delegate?.formDidError(field, didFailWith: error)
                        }
                        
                        return
                    }
                }
            }
            
        delegate?.formDidValidated(field)
        
        }
    }
    
    func clear(){
    
        for field in self.fields{
            
            field.text = ""
        }
    }
}
