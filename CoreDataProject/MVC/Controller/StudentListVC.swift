//
//  StudentListVc.swift
//  CoreDataProject
//
//  Created by Anurag Kashyap on 29/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit
import  CoreData

class StudentListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var studentListArray : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentListArray = DatabaseHelper.sharedInstance.fetchDataFromEntity(fromEntity: "Student")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Student's List"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}

extension StudentListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
        cell.studentValue = (studentListArray[indexPath.row] as! Student)
        return cell
    }
}

extension StudentListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            studentListArray = DatabaseHelper.sharedInstance.delete(atIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
}
