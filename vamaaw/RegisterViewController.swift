//
//  RegisterViewController.swift
//  vamaaw
//
//  Created by admin on 2/28/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cpw: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var un: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//init date picker
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.addTarget(self, action: #selector(dateChange(datepicker:)), for: UIControl.Event.valueChanged)
        datepicker.frame.size=CGSize(width: 0, height: 300)
        datepicker.preferredDatePickerStyle = .wheels
        dateTF.inputView=datepicker
        dateTF.text=formatDate(date: Date())
    }
    
    @objc func dateChange(datepicker: UIDatePicker){
        dateTF.text=formatDate(date: datepicker.date)
    }
    func formatDate(date: Date)->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat="MMMM dd, yyyy"
        return formatter.string(from: date)
    }
    func formatetoDate(s:String)->Date{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat="MMMM dd, yyyy"
        return formatter.date(from: s)!
    }
   
    @IBAction func Register(_ sender: Any) {
        if !DBhelper.inst.HasUser(n: un.text!){
        if pw.text! == cpw.text!
        {   //core data
            DBhelper.inst.addUser(un: un.text!, name: name.text!, dob: formatetoDate(s: dateTF.text!), pw: pw.text!)
        //key chain
        //set attribute
        let att: [String : Any] = [kSecClass as String: kSecClassGenericPassword, kSecAttrAccount as String : un.text!, kSecValueData as String : pw.text!.data(using: .utf8)!]
        
        //add Data
        if SecItemAdd(att as CFDictionary, nil) == noErr{
            print("data saved successfully")
        }
        else{
            print("data not saved")
        }
        }else{
            print("Mix Match Password")
        }
        } else{
            print("user exist")
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
