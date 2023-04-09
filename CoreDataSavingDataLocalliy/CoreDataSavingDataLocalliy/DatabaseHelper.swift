//
//  DatabaseHelper.swift
//  CoreDataSavingDataLocalliy
//
//  Created by Mac on 09/04/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
  static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobail = object["mobail"]
        do{
            try context?.save()
        }catch{
            print("'data is not save")
        }
    }
    func getStudentData() -> [Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("can not get data")
        }
        return student
}
    func deletData(index:Int) -> [Student]{
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("'cannot delete data")
        }
        return student
    }
    func editData(object:[String:String],i:Int){
        var student = getStudentData()
        student[i].name = object["name"]
        student[i].address = object["address"]
        student[i].city = object["city"]
        student[i].mobail = object["mobail"]
        do{
            try context?.save()
        }catch{
            print("data is not edit")
        }
    }
}
