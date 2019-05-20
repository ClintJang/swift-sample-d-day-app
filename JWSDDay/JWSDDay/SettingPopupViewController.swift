//
//  SettingPopupViewController.swift
//  JWSDDay
//
//  Created by ClintJang on 20/05/2019.
//  Copyright © 2019 ClintJang. All rights reserved.
//

import UIKit

final class SettingPopupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    @IBAction func confirm(_ sender: Any) {
        dismiss(animated: true) {}
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true) {}
    }
}


private extension SettingPopupViewController {
    /// Full initialization
    func initialize() {
        initializeLayout()
    }
    
    /// Layout initialization
    func initializeLayout() {}
}

