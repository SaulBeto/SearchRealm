//
//  Cell.swift
//  SearchBar
//
//  Created by Saul Alberto Cortez Garcia on 1/14/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    static let reuseIdentifier = "cellProfile"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
}
