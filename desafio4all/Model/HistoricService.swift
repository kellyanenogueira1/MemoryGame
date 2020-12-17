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
        var transacoes: [Historic] = []
        do {
            let request = Historic.fetchRequest() as NSFetchRequest<Historic>
            if predicate != nil {
                request.predicate = predicate
            }
            transacoes = try context.fetch(request)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return transacoes
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
}
