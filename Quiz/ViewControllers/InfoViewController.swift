//
//  InfoViewController.swift
//  Quiz
//
//  Created by Denis Voropanov on 08.08.2022.
//

import UIKit

class InfoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var groupTextField: UITextField!
    @IBOutlet weak var teacherSurnameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        surnameTextField.delegate = self
        groupTextField.delegate = self
        teacherSurnameTextField.delegate = self
    }
    
    public var nameOfStudent: ((String?) -> Void)?
    
    @IBAction func saveNewInfo(_ sender: Any) {
        nameOfStudent?(nameTextField.text)
    }
    
    
    
    
    
}

extension InfoViewController : UITextViewDelegate {
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



