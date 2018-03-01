//
//  ViewController.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-02-21.
//  Copyright © 2018 ERF. All rights reserved.
//

import UIKit

class DataVC: UIViewController {

    @IBOutlet weak var gestationBtn: UIButton!
    @IBOutlet weak var riskFactor: UISwitch!
    @IBOutlet weak var birthBtn: UIButton!
    @IBOutlet weak var bloodTestBtn: UIButton!
    @IBOutlet weak var sbValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DataVC.handleTap))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(DataVC.updateView(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        setupView()
    }
    
    func setupView() {
        gestationBtn.setTitle("Select Weeks", for: .normal)
        birthBtn.setTitle("Select Date", for: .normal)
        bloodTestBtn.setTitle("Select Date", for: .normal)
    }
    
    @objc func updateView(_ notif: Notification) {
        gestationBtn.setTitle(UserDataService.instance.gestation, for: .normal)
        birthBtn.setTitle(UserDataService.instance.dateOfBirth, for: .normal)
        bloodTestBtn.setTitle(UserDataService.instance.dateOfBloodTest, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "birth" {
            let popup = segue.destination as! DatePickerVC
            popup.id = "birth"
        } else if segue.identifier == "bloodTest" {
            let popup = segue.destination as! DatePickerVC
            popup.id = "bloodTest"
        } else if segue.identifier == "graph" {
            let graph = segue.destination as! GraphVC
            graph.sbValue = UserDataService.instance.sbValue
            graph.hours = UserDataService.instance.getDateDifferenceInHours()
        }
    }
    
    @objc func handleTap() {
        view.endEditing(true)
        if let sb = Int(sbValue.text!) {
            UserDataService.instance.sbValue = sb
        }
        print("Dismiss Keyboard")
    }
    
    @IBAction func generateGraph(_ sender: Any) {
        print("Difference: \(UserDataService.instance.getDateDifferenceInHours())")
    }

}

