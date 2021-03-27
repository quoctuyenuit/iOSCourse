//
//  DMCellObject.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/27/21.
//

import UIKit

class DMCellObject: NSObject {
    let title: String
    let cellClass: AnyClass?
    
    init(title: String, cellClass: AnyClass?) {
        self.title = title
        self.cellClass = cellClass
        super.init()
    }
}
