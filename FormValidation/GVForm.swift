//
//  GVForm.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import Foundation

protocol GVFormDelegate {
    func formValid()
    func formError( errorMessage : String )
}

class GVForm {
    
    var delegate: GVFormDelegate?
    var fields : [GVTextField] = []
    
    required init(fields : [GVTextField]) {
        self.fields = fields
    }
    
    func validate(){
    
        for field in self.fields{
        
            if field.required {
                
                if field.text == "" {
                    
                    if let errorMessage = field.requiredErrorMessage{
                        delegate?.formError(errorMessage: errorMessage)
                    }
                    else{
                        delegate?.formError(errorMessage: "\(field.name) is empty!")
                    }

                    return
                }
            }
            
            if field.validate {
                
                if let regex = field.regexValidation{
                    
                    let validText = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: field.text)
                    
                    if !validText{
                        
                        if let errorMessage = field.validateErrorMessage{
                            delegate?.formError(errorMessage: errorMessage)
                        }
                        else{
                            delegate?.formError(errorMessage: "\(field.name) is not valid!")
                        }
                        
                        return
                    }
                }
            }
        }
        
        delegate?.formValid()
    }
    
    func clear(){
    
        for field in self.fields{
            
            field.text = ""
        }
    }
}
