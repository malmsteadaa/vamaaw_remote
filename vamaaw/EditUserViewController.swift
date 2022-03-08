//
//  EditUserViewController.swift
//  vamaaw
//
//  Created by admin on 3/8/22.
//

import UIKit

class EditUserViewController: UIViewController {
    var today:String?
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var DateTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//init date picker
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.addTarget(self, action: #selector(dateChange(datepicker:)), for: UIControl.Event.valueChanged)
        datepicker.frame.size=CGSize(width: 0, height: 300)
        datepicker.preferredDatePickerStyle = .wheels
        DateTF.inputView=datepicker
        DateTF.text=formatDate(date: Date())
        today = DateTF.text!.copy() as! String
    }
    
    @objc func dateChange(datepicker: UIDatePicker){
        DateTF.text=formatDate(date: datepicker.date)
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
   
    
    @IBAction func update(_ sender: Any) {
        var st:String?
        if pw.text! != ""{
            if pw.text! == pw.text{
                DBhelper.inst.UpdateUserPW(n: (LoginViewController.UserName?.un)!, pw: pw.text!)
            }else{
                st="Mix Match Passwords"
            }
        }
        if(today == DateTF.text!){
            DBhelper.inst.UpdateUserNameDOB(n:( LoginViewController.UserName?.un)!, name: Name.text!, dob: nil)
        }else{
            DBhelper.inst.UpdateUserNameDOB(n: (LoginViewController.UserName?.un)!, name: Name.text!, dob: formatetoDate(s: DateTF.text!))
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
