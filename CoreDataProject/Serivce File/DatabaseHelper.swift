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
    func create(objectOf object: [String:Any]) {
        let studentObject = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        studentObject.name = object["name"] as? String
        studentObject.age = Int16(object["age"] as! Int)
        studentObject.number = object["number"] as? String
        studentObject.city = object["city"] as? String
        
        do{
            try context?.save()
            print("Data Saved Successfully")
        }catch{
            print("Error saving data")
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
    
    //MARK: Delete
    func delete(objectOf object: [String:String]) {
        
    }
    
    //MARK: Update
    func update(objectOf object: [String:String]) {
        
    }
}
