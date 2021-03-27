//
//  DMTableViewCellObject.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/22/21.
//

import UIKit

class DMProfileCellObject: DMCellObject {
    let image:UIImage?
    let timestamp:String
    
    init(title: String, cellClass:AnyClass, image:UIImage?, timestamp: String) {
        self.image = image
        self.timestamp = timestamp
        super.init(title: title, cellClass: cellClass)
    }
}
