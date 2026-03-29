//
//  CustomTableViewCell.swift
//  StarterProjectMultipleViews
//
//  Created by Brian Ma on 15/3/2026.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //rounding for icon to the table view for better UI
        iconImageView.layer.cornerRadius = iconImageView.frame.size.height / 2
        //cuts off bounding areas to the image
        iconImageView.clipsToBounds = true
    }
}
