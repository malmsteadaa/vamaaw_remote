//
//  ForgotViewController.swift
//  vamaaw
//
//  Created by admin on 2/28/22.
//

import UIKit

class ForgotViewController: UIViewController {
    @IBOutlet weak var dateTF: UITextField!
    let changVC = ChangePassViewController()
    enum Segues{
        static let ChangePassword = "ChangePassword"
    }
    //storyboard segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.ChangePassword{
            let destVC = segue.destination as! ChangePassViewController
        }
    }
    //programmatically
    @IBAction func ConfirmId(_ sender: Any) {
        //init subview
            addChangePasswordCV()
    }
    func addChangePasswordCV(){
        addChild(changVC)
        view.addSubview(changVC.view)
        changVC.didMove(toParent: self)
        setChangePasswordConstraints()	
    }
    
    
    func setChangePasswordConstraints(){}
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
