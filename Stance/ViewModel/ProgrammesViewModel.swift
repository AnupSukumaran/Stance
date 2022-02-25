//
//  ProgrammesViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class ProgrammesViewModel: NSObject {
    
    var programesItems = [String]()
    
    var timeModelArr: [TimeModel] = [TimeModel(totTitle: "TOTAL VOLUME", addedReps: "+412", totIbs: "9,481 lbs"),
                                      TimeModel(totTitle: "TOTAL DURATION", totTime: "35:09"),
                                     TimeModel(totTitle: "TIME UNDER TENSION", totTime: "20:30", addedTime: "+1:02")]
    
    var moveModelArr = [MovementModel(excerciseTitle: "Squat w / Row", numSets: "4 Sets", reps: "10 Reps", ibs: "61lbs Max"),
                     MovementModel(excerciseTitle: "Pull Through", numSets: "4 Sets", reps: "10 Reps", ibs: "61lbs Max"),
                     MovementModel(excerciseTitle: "Cable Crossover", numSets: "4 Sets", reps: "10 Reps", ibs: "61lbs Max"),
                     MovementModel(excerciseTitle: "Standing Bicep Curl", numSets: "4 Sets", reps: "10 Reps", ibs: "61lbs Max")]
    
    var workSumSectionData = [WorkSumSectionData]()
    var workSumModel = [WorkSumModel]()
    
    var selectionHandler: ((WorkSumModel) -> Void)?

    
    init(programesItems: [String]) {
        self.programesItems = programesItems
        
        workSumSectionData = [WorkSumSectionData(timeModel: timeModelArr),
                              WorkSumSectionData(movSecTitle: "MOVEMENTS", movementModelArr: moveModelArr)]
        
        workSumModel = [WorkSumModel(id: 0, viewTitle: "Shoulder 04/10/21 - 18:30", caption: "Compared to the some workout 0s 20/08/21", workSumSectionData: workSumSectionData),
                        WorkSumModel(id: 1, viewTitle: "Back 03/10/21 - 18:30", caption: "Compared to the some workout 0s 20/08/21", workSumSectionData: workSumSectionData),
                        WorkSumModel(id: 2, viewTitle: "Arms 02/10/21 - 18:30", caption: "Compared to the some workout 0s 20/08/21", workSumSectionData: workSumSectionData),
                        WorkSumModel(id: 3, viewTitle: "Core 02/10/21 - 18:30", caption: "Compared to the some workout 0s 20/08/21", workSumSectionData: workSumSectionData),
                        WorkSumModel(id: 4, viewTitle: "Legs 01/10/21 - 18:30", caption: "Compared to the some workout 0s 20/08/21", workSumSectionData: workSumSectionData),
                        WorkSumModel(id: 5, viewTitle: "Core 01/10/21 - 18:30", caption: "Compared to the some workout 0s 20/08/21", workSumSectionData: workSumSectionData)]
        
    }
}


extension ProgrammesViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programesItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramTableViewCell", for: indexPath) as! ProgramTableViewCell
        
        cell.config(programesItems[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let workoutsData = workSumModel.filter({indexPath.row == ($0.id ?? 0)}).first {
            selectionHandler?(workoutsData)
        }
    }
    
    
}
