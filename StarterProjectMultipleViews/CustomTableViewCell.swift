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
            
            // Let's keep the profile image perfectly circular!
            // Make sure your UIImageView in the Storyboard is a perfect square (e.g., 60x60)
            iconImageView.layer.cornerRadius = iconImageView.frame.size.height / 2
            iconImageView.clipsToBounds = true
        }
}
