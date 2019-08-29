//
//  CutomView.swift
//  CoreDataProject
//
//  Created by Anurag Kashyap on 29/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    static let sharedInstance = CustomView()
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var ageTf: UITextField!
    @IBOutlet weak var mobileTf: UITextField!
    @IBOutlet weak var cityTf: UITextField!
    @IBOutlet weak var updateButtonOutlet: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("View has not been implemented")
    }
    
    private func updateView(){
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.parentView)
    }
    
    @IBAction func UpdateButtonAction(_ sender: UIButton) {
        
        print("Clicked Here")
    }
    
}


