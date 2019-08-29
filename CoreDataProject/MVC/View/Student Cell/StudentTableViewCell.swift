//
//  StudentTableViewCell.swift
//  CoreDataProject
//
//  Created by Anurag Kashyap on 29/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit
import CoreData

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var studentValue : Student? {
        didSet{
            configureCell()
        }
    }
    
    func configureCell() {
        nameLabel.text = studentValue?.name
        ageLabel.text = "\(studentValue?.age ?? 0)"
        mobileLabel.text = studentValue?.number
        cityLabel.text = studentValue?.city
    }
}
