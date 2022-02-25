//
//  UIViewController+Ext.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 24/02/2022.
//

import UIKit


extension UIViewController {
    
    static var repCntViewCntr: RepCounterViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepCounterViewController") as! RepCounterViewController
        vc.viewModel = RepCounterViewModel(secs: 2)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static var restViewCntr: RestViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RestViewController") as! RestViewController
        vc.viewModel = RepCounterViewModel(secs: 3)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static func restViewCntrCall(delegate: RepCounterViewModelDelegate) -> RestViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RestViewController") as! RestViewController
        vc.viewModel = RepCounterViewModel(secs: 3, delegate: delegate)
        vc.modalPresentationStyle = .fullScreen
        return vc
        
    }
    
}
