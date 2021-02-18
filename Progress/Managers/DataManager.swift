//
//  DataManager.swift
//  Progress
//
//  Created by xcv on 02/12/2020.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [Item] {
        var items = [Item]()
        
        do {
            items = try context.fetch(Item.fetchRequest())
            return items
        } catch {
            print(error)
        }
        return []
    }
    
    func editItem(item: Item, name: String?, type: String?, color: String?, start: String?, end: String?,  unit: String?, notes: String?) {
        item.name = name ?? item.name
        item.type = type ?? item.type
        item.color = color ?? item.color
        item.start = start ?? item.start
        item.end = end ?? item.end
        item.unit = unit ?? item.unit
        item.notes = notes ?? item.notes
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
        
    }
    
    func addItem(name: String, type: String, color: String, start: String, end: String, unit: String, notes: String) {
        let item = Item(context: context)
        item.id = UUID().uuidString
        item.name = name
        item.type = type
        item.color = color
        item.start = start
        item.end = end
        item.unit = unit
        item.notes = notes
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
        
        
    }
    
    func deleteObject(item: Item) {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id == %@", item.id)
        
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            try context.save()
        } catch  {
            print(error)
        }
    }

    func deleteRecords() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        if let result = try? context.fetch(fetchRequest) {
            for object in result {
                context.delete(object)
            }
        }
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
        
    }
    
    func getObjects() -> [GalleryDataSourceObject] {
        let items = fetchData()
        let dataSourceObjects = createDataSourceObjects(from: items)
        return dataSourceObjects
    }
}

extension DataManager {
    func createDataSourceObjects(from items: [Item]) -> [GalleryDataSourceObject] {
        var objects = [GalleryDataSourceObject]()
        
        for item in items {
            let itemType = ItemType.getItemType(from: item.type)
            
            let objectWithCategoryExist = objects.contains(where: {
                $0.sectionName == itemType
            })
            
            if !objectWithCategoryExist {
                let newObject = GalleryDataSourceObject(sectionName: itemType, items: [item])
                objects.append(newObject)
            } else {
                for object in objects {
                    if object.sectionName == itemType {
                        object.items.append(item)
                    }
                }
            }
        }
        
        return objects
    }
}
