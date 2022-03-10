//
//  EditUserViewController.swift
//  vamaaw
//
//  Created by admin on 3/8/22.
//

import UIKit

class EditUserViewController: UIViewController {
    var today:String?
    var na:String?
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var cpw: UITextField!
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
        Name.text = LoginViewController.UserName?.name!
        
        
        dateTF.text=formatDate(date: (LoginViewController.UserName?.dob)!)
        
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
    func formatetoDate(s:String)->Date{
        print("format to date",s)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat="MMMM dd, yyyy"
        return formatter.date(from: s)!
    }
   
    
    @IBAction func update(_ sender: Any) {
        var st:String?
        if pw.text! != ""{
            if pw.text! != cpw.text!{
                DBhelper.inst.UpdateUserPW(n: (LoginViewController.UserName?.un)!, pw: pw.text!)
            }else{
                st="Mix Match Passwords"
            }
        }
        if(today == dateTF.text!){
            DBhelper.inst.UpdateUserNameDOB(n:( LoginViewController.UserName?.un)!, name: Name.text!, dob: nil)
        }else{
            DBhelper.inst.UpdateUserNameDOB(n: (LoginViewController.UserName?.un)!, name: Name.text!, dob: formatetoDate(s: dateTF.text!))
        }
        if st != nil{
            alertor(title: "Editor", message: st!)
        } else{
            alertor(title: "Editor", message: "Edit successful")
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
    
    func alertor(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
