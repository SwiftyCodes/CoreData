//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Anurag Kashyap on 29/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class StudentVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: Save Action
    @IBAction func saveDetailsButtonAction(_ sender: UIButton) {
        let age = Int(ageTF.text!)
        guard let studentName = nameTF.text, let studentAge = age, let studentMobileNo = mobileTF.text, let studemtCity = cityTF.text else {print("Please fill all details for the student"); return}
        let studentDict = ["name":studentName,"age":studentAge,"number":studentMobileNo,"city":studemtCity] as [String : Any]
        DatabaseHelper.sharedInstance.create(objectOf: studentDict)
    }
    
    
    @IBAction func showStudentList(_ sender : UIButton) {
        performSegue(withIdentifier: "goToStudentListVC", sender: nil)
    }
}

