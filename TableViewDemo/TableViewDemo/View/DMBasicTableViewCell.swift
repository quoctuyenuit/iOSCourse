//
//  DMBasicTableViewCell.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/27/21.
//

import UIKit

class DMBasicTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = UILabel()
    let subtitleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self._setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _setupView() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = UIColor.black
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.textColor = UIColor.black
        self.subtitleLabel.textAlignment = NSTextAlignment.right
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.subtitleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
        ]);
        
        NSLayoutConstraint.activate([
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            self.subtitleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.subtitleLabel.leftAnchor.constraint(greaterThanOrEqualTo: self.titleLabel.rightAnchor, constant: 8)
        ]);
    }
    
}

extension DMBasicTableViewCell: DMTableViewCellProtocol {
    func shouldUpdateWithObject(object: AnyObject) {
        if let cellObject = object as? DMBasicCellObject {
            self.titleLabel.text = cellObject.title
            self.subtitleLabel.text = cellObject.subtitle
        }
    }
}
