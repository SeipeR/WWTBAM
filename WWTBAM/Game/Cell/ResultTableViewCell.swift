//
//  ResultTableViewCell.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 18.08.2021.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(result: String, date: String) {
        resultLabel.text = result
        dateLabel.text = date
    }
    
}
