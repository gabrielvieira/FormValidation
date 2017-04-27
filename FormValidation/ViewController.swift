//
//  ViewController.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController , GVFormDelegate {

    var form : GVForm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gere = GVTextField.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        gere.backgroundColor = .red
        
        gere.required = true
        gere.regexValidation = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        gere.requiredErrorMessage = "gere requerido"
        gere.validateErrorMessage = "digita certo caralho"
//        gere.validade = false
        gere.name = "Email"
        
        self.form = GVForm.init(fields: [gere])
        self.form?.delegate = self
        
        view.addSubview(gere)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func click(_ sender: Any) {
        form?.validate()
    }
    
    func formValid(){
        print("Form valido")
        form?.clear()
    }
    
    func formError( errorMessage : String ){
        print("form invalido")
        print(errorMessage)
    }
}

