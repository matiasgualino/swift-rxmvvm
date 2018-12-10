//
//  ViewController.swift
//  RxMVVM
//
//  Created by Matias Gualino on 07/12/2018.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: PersonalDataViewModel!
    
    var customView: PersonalDataView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let customView = PersonalDataView(containerView: self.view)
        customView.viewModel = self.viewModel as? PersonalDataViewModel
        self.customView = customView
    }
    
}

