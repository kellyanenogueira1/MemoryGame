//
//  HistoricService.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 17/12/20.
//

import Foundation
import CoreData
struct HistoricService {
    static let shared = HistoricService()
    
    func fetch(context: NSManagedObjectContext, predicate: NSPredicate?) -> [Historic] {
        var historic: [Historic] = []
        do {
            let request = Historic.fetchRequest() as NSFetchRequest<Historic>
            if predicate != nil {
                request.predicate = predicate
            }
            historic = try context.fetch(request)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return historic
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    
    func createNewHistoric(context: NSManagedObjectContext, level: Int, timeString: String) {
        let newHistoric = Historic(context: context)
        newHistoric.id = UUID()
        newHistoric.date = Date()
        newHistoric.level = Int16(level)
        newHistoric.time = timeString
    }
    
    func removeAll(context: NSManagedObjectContext ){
            let items = fetch(context: context, predicate: NSPredicate(value: true))

            for item in items {
                context.delete(item)
            }
            save(context: context)
    }
}
