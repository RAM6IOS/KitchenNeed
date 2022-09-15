//
//  Prospect.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 25/8/2022.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = ""
    var details = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]

   init() {
        self.people = []
    }
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}

