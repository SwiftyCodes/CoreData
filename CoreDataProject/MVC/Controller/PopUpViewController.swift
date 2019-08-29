//
//  PopUpViewController.swift
//  CoreDataProject
//
//  Created by Anurag Kashyap on 29/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit


protocol PopUpViewControllerDelegate {
    func studentDataPassBack(studentData: Student, row: Int)
}

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    
    var studentValue : Student?
    var delegate : PopUpViewControllerDelegate?
    var row : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let studentVal = studentValue {
            nameTF.text = studentVal.name
            ageTF.text = "\(studentVal.age)"
            mobileTF.text = studentVal.number
            cityTF.text = studentVal.city
        }
        
    }
    
    @IBAction func UpdateButtonAction(_ sender: UIButton) {
        studentValue?.name = nameTF.text
        studentValue?.age = Int16(ageTF.text!)!
        studentValue?.number = mobileTF.text
        studentValue?.city = cityTF.text
        if let studentVal = studentValue, let rowValue = row{
            delegate?.studentDataPassBack(studentData: studentVal, row: rowValue)
            DatabaseHelper.sharedInstance.update(objectOf: studentVal, atIndex: rowValue)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
