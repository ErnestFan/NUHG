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
    @IBOutlet weak var riskFactorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DataVC.handleTap))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(DataVC.updateView(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
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
        if segue.identifier == "gestation" {
            let destination = segue.destination as! GestationPickerVC
            destination.id = "gestation"
        } else if segue.identifier == "birth" {
            let destination = segue.destination as! DatePickerVC
            destination.id = "birth"
        } else if segue.identifier == "bloodTest" {
            let destination = segue.destination as! DatePickerVC
            destination.id = "bloodTest"
        } else if segue.identifier == "graph" {
            let destination = segue.destination as! GraphVC
            if UserDataService.instance.sbValue < 450 {
                destination.sbValue = UserDataService.instance.sbValue
            } else {
                destination.sbValue = 450
            }
            let hours = UserDataService.instance.getDateDifferenceInHours()
            if hours < 120 {
                destination.hours = hours
            } else {
                destination.hours = 120
//                let alertController = UIAlertController(title: "Maximum of Date Difference", message: "The maximum of difference between Date of Birth and Date of Blood Test is 120 hours in order to display the graph properly.", preferredStyle: .actionSheet)
//                
//                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alertController.addAction(action)
//
//                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func switchToggled(_ sender: Any) {
        UserDataService.instance.riskFactor = riskFactor.isOn
        if(UserDataService.instance.riskFactor) {
            riskFactorLbl.text = "ON"
        } else {
            riskFactorLbl.text = "OFF"
        }
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillHide() {
        if let sb = Int(sbValue.text!) {
            if(sb > 450) {
                UserDataService.instance.sbValue = 450
                sbValue.text = "450"
                let alertController = UIAlertController(title: "Maximum of SB Value", message: "The maximum of SB value is 450 in order to display the graph properly. The SB value will now set to 450.", preferredStyle: .actionSheet)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
            } else {
                UserDataService.instance.sbValue = sb
            }
        }
    }
    
    @IBAction func generateGraph(_ sender: Any) {
        UserDataService.instance.checkForError { (error) in
            if(error != nil) {
                let alertController = UIAlertController(title: "Error", message: error?.getErrorDetail(), preferredStyle: .actionSheet)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

