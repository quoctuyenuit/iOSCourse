//
//  DMSection.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/27/21.
//

import UIKit

class DMSection: NSObject {
    var headerTitle: String? = nil
    var footerTitle: String? = nil
    let objects: NSMutableArray = NSMutableArray()
    
    init(header: String?, footer: String?) {
        self.headerTitle = header
        self.footerTitle = footer
    }
    
    func addObject(object: AnyObject) {
        self.objects.add(object)
    }
    
    func addArrangeObjects(objects: [Any]) {
        self.objects.addObjects(from: objects)
    }
    
    func remove(object: AnyObject) {
        self.objects.remove(object)
    }
    
    func removeArrange(objects: [Any]) {
        self.objects.removeObjects(in: objects)
    }
    
    func object(at index:NSInteger) -> AnyObject {
        return self.objects.object(at: index) as AnyObject
    }
    
    func numberOfObject() -> NSInteger {
        return self.objects.count
    }
}
