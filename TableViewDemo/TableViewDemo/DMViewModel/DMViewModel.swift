//
//  DMViewModel.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/27/21.
//

import UIKit

class DMViewModel: NSObject {
    var sections: [DMSection] = [DMSection]()
    
    func _section(at index: NSInteger) -> DMSection {
        return self.sections[index]
    }
    
    func createSection(header: String, footer: String) {
        self.sections.append(DMSection(header: header, footer: footer))
    }
    
    func createSection(header: String, footer: String, objects: [Any]) {
        self.createSection(header: header, footer: footer)
        self._section(at: self.sections.count - 1).addArrangeObjects(objects: objects)
    }
    
    func numberOfSections() -> NSInteger {
        return self.sections.count
    }
    
    func numberOfRow(in section: NSInteger) -> NSInteger {
        return self._section(at: section).numberOfObject()
    }
    
    func object(row index: NSInteger, section: NSInteger) -> AnyObject {
        return self._section(at: section).object(at: index)
    }
}
