//
//  DMTableViewCellObject.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/22/21.
//

import UIKit

class DMTableViewCellObject: NSObject {
    let image:UIImage?
    let title:String
    let timestamp:String
    
    init(image:UIImage?, title:String, timestamp:String) {
        self.image = image
        self.title = title
        self.timestamp = timestamp
    }
}
