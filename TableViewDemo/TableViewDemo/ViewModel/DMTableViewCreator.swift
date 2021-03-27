//
//  DMTableViewCreator.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/27/21.
//

import UIKit

class DMTableViewCreator: NSObject {
    static func buildProfileCellObjectWithViewModel(viewModel: DMViewModel) {
        viewModel.createSection(header: "", footer: "", objects: [
            DMProfileCellObject(title: "Title1", cellClass: DMProfileTableViewCell.self, image: UIImage(named: "avt"), timestamp: "10h00"),
            DMProfileCellObject(title: "Title2", cellClass: DMProfileTableViewCell.self, image: UIImage(named: "avt"), timestamp: "10h00"),
            DMProfileCellObject(title: "Title3", cellClass: DMProfileTableViewCell.self, image: UIImage(named: "avt"), timestamp: "10h00")
        ])
        
    }
    
    static func buildBasicCellObjectWithViewModel(viewModel: DMViewModel) {
        viewModel.createSection(header: "", footer: "", objects: [
            DMBasicCellObject(title: "Basic title", cellClass: DMBasicTableViewCell.self, subtitle: "subtitle"),
            DMBasicCellObject(title: "Basic title2", cellClass: DMBasicTableViewCell.self, subtitle: "subtitle"),
            DMBasicCellObject(title: "Basic title3", cellClass: DMBasicTableViewCell.self, subtitle: "subtitle")
        ])
    }
}
