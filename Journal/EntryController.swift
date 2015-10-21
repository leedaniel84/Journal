//
//  EntryController.swift
//  Journal
//
//  Created by Daniel Lee on 10/21/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit
import Foundation


class EntryController {
    let entriesKey = "entries"
    
    static let sharedController = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    func removeEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            
        }
    }
}
