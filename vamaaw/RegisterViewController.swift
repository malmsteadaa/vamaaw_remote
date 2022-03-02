//
//  RegisterViewController.swift
//  vamaaw
//
//  Created by admin on 2/28/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var UN: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var PW: UITextField!
    @IBOutlet weak var CPW: UITextField!
    @IBOutlet weak var FN: UITextField!
    
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
    
    @IBAction func Create(_ sender: Any) {
        //does one already exist
        if(!has(n:UN.text!)){
            //do the passwords match
            if(CPW==PW){
                //try to create data
                print("making:",UN.text!, PW.text!, FN.text!, dateTF.text!)
            createKS(UN: UN.text!, PW: PW.text!)
            createCD(UN: UN.text!, PW: PW.text!,FN: FN.text!,DOB: dateTF.text!)
            }else{
                print("MixMatch Passwords")
            }
        }
        
    }
    func createCD(UN:String,PW:String,FN:String,DOB:String){
        print("saving in CD")
    }
    func createKS(UN:String,PW:String){
        //set attribute
        print("saving in KS")
        let att: [String : Any] = [kSecClass as String: kSecClassGenericPassword, kSecAttrAccount as String : UN, kSecValueData as String : PW.data(using: .utf8)!]
        
        //add Data
        if SecItemAdd(att as CFDictionary, nil) == noErr{
            print("data saved successfully")
        }
        else{
            print("data not saved")
        }
        
    }
    func has(n:String)->Bool{
        //querry for using n as the parameter for key
        let q:[String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : n, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        var res : CFTypeRef?
        if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
         if   let item = res as? [String : Any],
            let uid = item[kSecAttrAccount as String] as? String,
            
            let password = item [ kSecValueData as String] as? Data,
            let pass = String(data: password, encoding: .utf8){
                print("id is", uid, "password is", pass)
             return true
            }
        }else{
            print("no data found")
            return false
        }
    }
    @objc func dateChange(datepicker: UIDatePicker){
        dateTF.text=formatDate(date: datepicker.date)
    }
    func formatDate(date: Date)->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat="MMMM dd yyyy"
        return formatter.string(from: date)
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
