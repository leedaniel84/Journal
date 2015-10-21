//
//  Entry.swift
//  Journal
//
//  Created by Daniel Lee on 10/21/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class Entry: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    var titleText: String
    var bodyText: String
    var timeStamp: NSDate
    
    init(timeStamp: NSDate = NSDate(), titleText: String, bodyText: String) {
        self.timeStamp = timeStamp
        self.bodyText = bodyText
        self.titleText = titleText
        
    }
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let timeStamp = dictionary[timeStampKey] as? NSDate,
            let bodyText = dictionary[bodyTextKey] as? String,
            let titleText = dictionary[titleKey] as? String else {
                
                self.timeStamp = NSDate()
                self.bodyText = ""
                self.titleText = ""
                
                return nil
        }
        
        self.timeStamp = timeStamp
        self.bodyText = bodyText
        self.titleText = titleText
    }
        
        func dictionaryCopy() -> Dictionary<String, AnyObject> {
            let dictionary = [
                timeStampKey : self.timeStamp,
                titleKey : self.titleText,
                bodyTextKey : self.bodyText
            ]
            return dictionary
        }
    }

    func == (lhs: Entry, rhs: Entry) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}