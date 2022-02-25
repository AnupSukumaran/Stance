//
//  TotalTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 25/02/2022.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var addedReps: UILabel!
    @IBOutlet weak var ibsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(model: TimeModel?) {
        cellTitle.text = model?.totTitle
        addedReps.text = model?.addedReps ?? model?.addedTime ?? ""
        ibsLabel.text = model?.totIbs ?? model?.totTime ?? ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
