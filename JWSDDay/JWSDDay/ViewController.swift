//
//  ViewController.swift
//  JWSDDay
//
//  Created by ClintJang on 20/05/2019.
//  Copyright © 2019 ClintJang. All rights reserved.
//

import UIKit
import SwiftDate

final class ViewController: UIViewController {
    deinit {
        // Just..
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private struct Temp {
        static let goalDateString = "2019-12-25"
        static let goalDate: Date = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: goalDateString)!
            return date
        }()
    }
    
    private struct DesignGuide {}
    
    /// Remaining date label
    @IBOutlet weak var remainingDateLabel: UILabel!
    
    var timer: Timer?
    
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
        initializeTimer()
    }
    
    /// Layout initialization
    func initializeLayout() {
        updateDateLabel()
    }
    
    /// Timer initialization
    func initializeTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateDateLabel()
        }
    }
}

private extension ViewController {
    /// update date label
    func updateDateLabel() {
        remainingDateLabel.text = calculateDate()
    }
    
    /// Calculate the remaining dates.
    ///
    /// - returns: remaining dates
    func calculateDate() -> String {
        // init
        let today = Date()
        let startDate = today
        let endDate = Temp.goalDate
        
        var remainingValueAfterDivision = 0
        var interval: TimeInterval = 0
        var days: Int = 0
        var hours: Int = 0
        var minutes: Int = 0
        var seconds: Int = 0
        
        let divide86400: Int = 24 /*hour*/ * 60 /*minute*/ * 60 /*second*/
        let divide3600: Int = 60 /*minute*/ * 60 /*second*/
        let divide60: Int = 60 /*second*/
        
        // calculate
        interval = endDate.timeIntervalSince(startDate)
        days = Int(interval) / divide86400
        remainingValueAfterDivision = Int(interval) % divide86400
        hours = remainingValueAfterDivision / divide3600
        remainingValueAfterDivision = remainingValueAfterDivision % divide3600
        minutes = remainingValueAfterDivision / divide60
        remainingValueAfterDivision = remainingValueAfterDivision % divide60
        seconds = remainingValueAfterDivision
        
        return "\(days) days \(hours):\(minutes):\(seconds)"
    }
}
