//
//  DataController.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 24/7/2022.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "KitchenNeedModel")
    
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
