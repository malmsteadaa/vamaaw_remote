//
//  ForgotViewController.swift
//  vamaaw
//
//  Created by admin on 2/28/22.
//

import UIKit

class ForgotViewController: UIViewController {
    @IBOutlet weak var un: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    enum Segues{
        static let ChangePassword = "ChangePassword"
    }
    
    //programmatically
    @IBAction func ConfirmId(_ sender: Any) {
        var user:TheUser=DBhelper.inst.GetUser(n: un.text!)
        if user.dob == formatetoDate(s: dateTF.text!) {
        //init subview
            addChangePasswordAlert()
            
        }else{alertor(title: "Password manager says:", message: "Incorrect info")}
    }
    func addChangePasswordAlert(){
        let alert = UIAlertController(title:"Backdoor", message: "Whats your new password", preferredStyle: .alert)
        alert.addTextField{(textField) in textField.placeholder="New Passowrd"}
        alert.addTextField{(textField) in textField.placeholder="Confirm new Passowrd"}
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [self] _ in
            if alert.textFields?[0].text! == alert.textFields?[1].text!{
                //coredata save with key value
                DBhelper.inst.UpdateUserPW(n: self.un.text!, pw: (alert.textFields?[0].text!)!)
            }else{
                alertor(title: "password reset", message: "Mix Match Passwords")
                addChangePasswordAlert()
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true, completion: nil)
    }
    func formatetoDate(s:String)->Date{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat="MMMM dd, yyyy"
        return formatter.date(from: s)!
    }
    
    
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
        formatter.dateFormat="MMMM dd yyyy"
        return formatter.string(from: date)
    }
    func alertor(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
        self.present(alert, animated: true, completion: nil)
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
