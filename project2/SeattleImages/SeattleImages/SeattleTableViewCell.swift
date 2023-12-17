//
//  SeattleTableViewCell.swift
//  SeattleImages
//
//  Created by 李炳超 on 12/16/23.
//

import UIKit

class SeattleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSeattle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
