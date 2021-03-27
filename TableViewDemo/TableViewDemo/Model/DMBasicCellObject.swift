//
//  DMBasicCellObject.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/27/21.
//

import Foundation

class DMBasicCellObject: DMCellObject {
    var subtitle: String
    
    init(title: String, cellClass: AnyClass?, subtitle: String) {
        self.subtitle = subtitle
        super.init(title: title, cellClass: cellClass)  
    }
}
