//
//  DatabaseHelper.swift
//  CoreDataProject
//
//  Created by Anurag Kashyap on 29/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static let sharedInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    private init(){}
    
    //MARK: Create
    func create(objectOf object: [String:Any]) -> Bool {
        let studentObject = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        studentObject.name = object["name"] as? String
        studentObject.age = Int16(object["age"] as! Int)
        studentObject.number = object["number"] as? String
        studentObject.city = object["city"] as? String
        
        do{
            try context?.save()
            print("Data Saved Successfully")
            return true
        }catch{
            print("Error saving data")
            return false
        }
    }
    
    
    //MARK: Create
    func fetchDataFromEntity(fromEntity entity: String) -> [NSManagedObject] {
        var allStudent = [NSManagedObject]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        do {
            allStudent = try (context?.fetch(fetchRequest))!
        }catch {
            print("Not able to fetch data from store")
        }
        return allStudent
    }
    
    //MARK: Delete from Index
    func delete(atIndex index: Int) -> [NSManagedObject] {
        
        var allStudent = fetchDataFromEntity(fromEntity: "Student")
        context?.delete(allStudent[index]) // Remove data from Entity
        allStudent.remove(at: index) // Remove data from Array
        
        do{
            try context?.save()
            print("Data Saved Successfully")
        }catch{
            print("Error Deleting data")
        }
        
        return allStudent
    }
    
    //MARK: Update
    func update(objectOf object: Student, atIndex i: Int) {
        var allStudent = fetchDataFromEntity(fromEntity: "Student") as! [Student]
        allStudent[i] = object
        do{
            try context?.save()
            print("Data Edited Successfully")
        }catch{
            print("Error Editing data")
        }
        
    }
}
