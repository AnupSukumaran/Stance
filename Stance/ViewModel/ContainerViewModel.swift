//
//  ContainerViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class ContainerViewModel: NSObject {

    static  let forFourS_M: CGFloat = 50
    static let forEightAnd6_M: CGFloat = 80
    static  let forPlus_M: CGFloat = 80
    static let forXXsPlus_M: CGFloat = 80
    
    
    var width: CGFloat = {
        let v = UIViewController().adjustViewForIPhonesOnly2(fourAndS: forFourS_M, fiveAndS: forFourS_M, sixSevenEight: forEightAnd6_M, forPlus: forPlus_M, xAndxs: forXXsPlus_M, xr: forXXsPlus_M, xsMax: forXXsPlus_M)
        
        return v ?? 0
    }()
    
    
    
    var menuItems: [MenuModel] = [MenuModel(imgIcon: UIImage(named: "Person"), itemLable: "Profile"),
                                  MenuModel(imgIcon: UIImage(named: "dumbbell"), itemLable: "My workouts"),
                                  MenuModel(imgIcon: UIImage(named: "checkList"), itemLable: "Programmes"),
                                  MenuModel(imgIcon: UIImage(named: "progress"), itemLable: "Progress"),
                                  MenuModel(imgIcon: UIImage(named: "LogOut"), itemLable: "Sign Out")]

}
