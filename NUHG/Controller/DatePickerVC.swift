//
//  DatePickerVC.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-02-27.
//  Copyright © 2018 ERF. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var bgView: UIView!
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(DatePickerVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }

    @IBAction func saveDate(_ sender: Any) {
        if id == "birth" {
            UserDataService.instance.dateOfBirth = DateFormatService.instance.dateFormatter(datePicker.clampedDate)
            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        } else if id == "bloodTest" {
            UserDataService.instance.dateOfBloodTest = DateFormatService.instance.dateFormatter(datePicker.clampedDate)
            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
