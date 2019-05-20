//
//  ViewController.swift
//  JWSDDay
//
//  Created by ClintJang on 20/05/2019.
//  Copyright © 2019 ClintJang. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    @IBAction func setting(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "SettingPopup", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "SettingPopupViewController") as? SettingPopupViewController {
            viewController.modalPresentationStyle = .overFullScreen
            present(viewController, animated: true) {}
        }
    }
    
}

private extension ViewController {
    /// Full initialization
    func initialize() {
        initializeLayout()
    }
    
    /// Layout initialization
    func initializeLayout() {}
}
