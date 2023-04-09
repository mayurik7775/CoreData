//
//  Student+CoreDataProperties.swift
//  CoreDataSavingDataLocalliy
//
//  Created by Mac on 09/04/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobail: String?

}

extension Student : Identifiable {

}
