//
//  GestationPickerVC.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-03-02.
//  Copyright © 2018 ERF. All rights reserved.
//

import UIKit

class GestationPickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var id = ""
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(GestationPickerVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gestationData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gestationData[row]
    }
    
    @IBAction func saveSelection(_ sender: Any) {
        if id == "gestation" {
            UserDataService.instance.gestation = gestationData[pickerView.selectedRow(inComponent: 0)]
            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }

}
