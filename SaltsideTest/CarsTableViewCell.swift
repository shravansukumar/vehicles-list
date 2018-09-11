//
//  CarsTableViewCell.swift
//  SaltsideTest
//
//  Created by SALTSIDE on 11/09/18.
//  Copyright © 2018 SALTSIDE. All rights reserved.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    
    var detailBackgroundView = UIView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        detailBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel?.textColor = UIColor.black
        
        detailTextLabel?.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
