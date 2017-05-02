//
//  ViewController.swift
//  FormValidation
//
//  Created by Gabriel Vieira on 27/04/17.
//  Copyright © 2017 Gabriel Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var form : GVForm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let setup = TextFieldSetup(name: "Email", requiredErrorMessage: "gere requerido", validateErrorMessage: "digita certo caralho", regexValidation: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        
        let gere = GVTextField.init(setup: setup, frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        gere.backgroundColor = .red
                
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
}


// Padrao Apple de Delegate

extension ViewController : GVFormDelegate {
    
    func formDidValidated(_ form: GVTextField) {
        print(form.setup?.name)
    }
    
    func formDidError(_ form: GVTextField, didFailWith error: NSError) {
        print(error.userInfo["message"]!)
    }
}




extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

