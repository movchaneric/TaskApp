//
//  ToDo+CoreDataProperties.swift
//  TaskApp
//
//  Created by eric on 4/26/20.
//  Copyright © 2020 ericm. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var name: String?
    @NSManaged public var dueDate: Date?

}
