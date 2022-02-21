//
//  WorkOutExeTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class WorkOutExeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var workoutImg: UIImageView!
    @IBOutlet weak var equipStatusStackView: UIStackView!
    @IBOutlet weak var equipIndicImg: UIImageView!
    @IBOutlet weak var equipment1: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var reloadImg: UIImageView!
    
    var workOuts: WorkOuts?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(workOuts: WorkOuts?) {
        workoutImg.layer.cornerRadius = 10
        self.workOuts = workOuts
        workoutImg.image = workOuts?.exeImg
        equipStatusStackView.isHidden = workOuts?.equipmentStatus == nil
        reloadImg.isHidden = equipStatusStackView.isHidden
        if let equipStatus = workOuts?.equipmentStatus {
            let color: UIColor = equipStatus ? .green : .red
            equipIndicImg.tintColor = color
            equipment1.textColor = color
            equipment1.text = equipStatus ? "Equipment Ready" : "Equipment in use"
            reloadImg.tintColor = equipStatus ? .lightGray : .black
        }
        reloadImg.isHidden = workOuts?.forRest ?? false
        
        workLabel.text = workOuts?.exeName
        repsLabel.text = workOuts?.reps
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
