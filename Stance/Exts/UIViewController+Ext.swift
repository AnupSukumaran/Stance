//
//  UIViewController+Ext.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 24/02/2022.
//

import UIKit
import SidebarOverlay

extension UIViewController {
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    static var signInVC: SignInViewController {
        let signInVC = mainStoryBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        signInVC.viewModel = SignInViewModel()
        
        return signInVC
    }
    
    static var homeVC: HomeViewController {
        
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.viewModel = HomeViewModel()
    
        return vc
    }
    
    static var profileVC: ProfileViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.viewModel = ProfileViewModel(fromSignIn: true)
        return vc
    }
    
    
    
    static var repCntViewCntr: RepCounterViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "RepCounterViewController") as! RepCounterViewController
        vc.viewModel = RepCounterViewModel(secs: 2)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static var restViewCntr: RestViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "RestViewController") as! RestViewController
        vc.viewModel = RepCounterViewModel(secs: 3)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static var childOneVC: ChildOneViewController {
        let child_1 = mainStoryBoard.instantiateViewController(withIdentifier: "ChildOneViewController") as! ChildOneViewController
        child_1.viewModel = HomeViewModel()
        return child_1
    }
    
    static var childTwoVC: ChildTwoViewController {
        let child_2 = mainStoryBoard.instantiateViewController(withIdentifier: "ChildTwoViewController") as! ChildTwoViewController
        child_2.viewModel = HomeViewModel()
        return child_2
    }
    static var childThreeVC: ChildThreeViewController {
        let child_3 = mainStoryBoard.instantiateViewController(withIdentifier: "ChildThreeViewController") as! ChildThreeViewController
        child_3.viewModel = HomeViewModel()
        return child_3
    }
    
    static var leftMenuVC: LeftMenuViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
        
        let menuItems: [MenuModel] = [MenuModel(imgIcon: UIImage(named: "Person"), itemLable: "Profile"),
                                      MenuModel(imgIcon: UIImage(named: "dumbbell"), itemLable: "My workouts"),
                                      MenuModel(imgIcon: UIImage(named: "checkList"), itemLable: "Programmes"),
                                      MenuModel(imgIcon: UIImage(named: "progress"), itemLable: "Progress"),
                                      MenuModel(imgIcon: UIImage(named: "LogOut"), itemLable: "Sign Out")]
        
        vc.viewModel = LeftMenuViewModel(menuItems: menuItems)
        return vc
    }
    
   
    static var myWorkoutVC: MyWorkoutViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "MyWorkoutViewController") as! MyWorkoutViewController
        let workoutItems: [MenuModel] = [MenuModel(imgIcon: UIImage(named: "Chest"), itemLable: "Chest"),
                                      MenuModel(imgIcon: UIImage(named: "Arms"), itemLable: "Arms"),
                                      MenuModel(imgIcon: UIImage(named: "Legs"), itemLable: "Legs"),
                                      MenuModel(imgIcon: UIImage(named: "Back"), itemLable: "Back"),
                                      MenuModel(imgIcon: UIImage(named: "Shoulders"), itemLable: "Shoulders"),
                                      MenuModel(imgIcon: UIImage(named: "Core"), itemLable: "Core"),
                                      MenuModel(imgIcon: UIImage(named: "Custom Programme"), itemLable: "Custom Programme")]
        vc.viewModel = MyWorkoutViewModel(workoutItems: workoutItems)
        return vc
    }
    
    static var programmesVC: ProgrammesViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "ProgrammesViewController") as! ProgrammesViewController
        let programesItems = ["Shoulders - 04/10", "Back - 03/10", "Arms - 02/10", "Core - 02/10", "Legs - 01/10", "Core - 01/10"]
        vc.viewModel = ProgrammesViewModel(programesItems: programesItems)
        return vc
    }
    
    static var inWorkOutVC: InWorkOutViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "InWorkOutViewController") as! InWorkOutViewController
        return vc
    }
    
    static func startWorkOutVC(model: WorkoutModel) -> StartWorkOutViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "StartWorkOutViewController") as! StartWorkOutViewController
        vc.viewModel = StartWorkOutViewModel(workoutModel: model)
        return vc
    }
    
    static func restViewCntrCall(setCount: Int, delegate: RepCounterViewModelDelegate) -> RestViewController {
        
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "RestViewController") as! RestViewController
        vc.viewModel = RepCounterViewModel(secs: 3, setCnt: setCount, delegate: delegate)
        vc.modalPresentationStyle = .fullScreen
        return vc
        
    }
    
    static func callVCWorkOutSummViewCntr(viewModel: WorkOutSummViewModel) -> WorkOutSummViewController {
        
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "WorkOutSummViewController") as! WorkOutSummViewController
        vc.viewModel = viewModel
        vc.modalPresentationStyle = .fullScreen
        return vc
        
    }
    
    static func callLeftMenuVC(menuItems: [MenuModel]) -> LeftMenuViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
        vc.viewModel = LeftMenuViewModel(menuItems: menuItems)
        return vc
    }
    
    
}


