//
//  PhotoCell.swift
//  Tumbrl
//
//  Created by Arthur Burgin on 3/29/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    

    @IBOutlet var userPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
