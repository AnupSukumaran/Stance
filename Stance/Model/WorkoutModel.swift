//
//  WorkoutModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit


class WorkOuts {
    
    var exeImg: UIImage?
    var equipmentStatus: Bool?
    var exeName: String?
    var reps: String?
    var forRest: Bool = false
    var refreshActive: Bool = false
    
    internal init(exeImg: UIImage? = nil, equipmentStatus: Bool? = nil, exeName: String? = nil, reps: String? = nil,forRest: Bool = false, refreshActive: Bool = false) {
        self.exeImg = exeImg
        self.equipmentStatus = equipmentStatus
        self.exeName = exeName
        self.reps = reps
        self.forRest = forRest
        self.refreshActive = refreshActive
    }
    
}

class SectionData {
    
    var sectionTitle: String?
    var numOfExcercises: String?
    var workoutMins: String?
    var workouts = [WorkOuts]()
    
    internal init(sectionTitle: String? = nil, numOfExcercises: String? = nil, workoutMins: String? = nil, workouts: [WorkOuts] = []) {
        
        self.sectionTitle = sectionTitle
        self.numOfExcercises = numOfExcercises
        self.workoutMins = workoutMins
        self.workouts = workouts
        
    }
    
}

class WorkoutModel: NSObject {
    
    var id: Int?
    var workOutTitle: String?
    var numOfSections: String?
    var numOfExcercises: String?
    var workoutMins: String?
    var sectionData = [SectionData]()
    

    internal init(id: Int? = nil, workOutTitle: String? = nil, numOfSections: String? = nil, numOfExcercises: String? = nil, workoutMins: String? = nil, sectionData: [SectionData] = []) {
        self.id = id
        self.workOutTitle = workOutTitle
        self.numOfSections = numOfSections
        self.numOfExcercises = numOfExcercises
        self.workoutMins = workoutMins
        self.sectionData = sectionData
    }
    
}
