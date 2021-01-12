//
//  Item+CoreDataProperties.swift
//  Progress
//
//  Created by xcv on 02/12/2020.
//
//

import Foundation
import CoreData

extension Item {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String
    @NSManaged public var color: String
    @NSManaged public var type: String
    @NSManaged public var notes: String
    @NSManaged public var id: String


}

extension Item : Identifiable {
}

