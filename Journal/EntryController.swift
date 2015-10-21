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
    
    func saveToPersistentStorage() {
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
    }
    
    func loadPersistentStorage() {
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
            
        }
    }
}
