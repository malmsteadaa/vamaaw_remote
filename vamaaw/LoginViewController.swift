//
//  LoginViewController.swift
//  vamaaw
//
//  Created by admin on 3/7/22.
//

import UIKit

class LoginViewController: UIViewController {
    static var UserName :TheUser?
    func logout(){
        LoginViewController.UserName = nil
    }
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var un: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func login(_ sender: Any) {
        var st=""
        let q:[String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : un.text, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        var res : CFTypeRef?
        if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
         if   let item = res as? [String : Any],
            let uid = item[kSecAttrAccount as String] as? String,
            let password = item [ kSecValueData as String] as? Data,
            let pass = String(data: password, encoding: .utf8){
                print("id is", uid, "password is", pass)
             if(pass==pw.text!){
                 st = "Success"
                 success(name:uid)
             }else{
                 st = "Failed login"
             }
            }
        }else{
            st="no data found"
        }
        alertor(title: "login", message: st)
    }
    func formatDate(date: Date)->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat="MMMM dd yyyy"
        return formatter.string(from: date)
    }
    func success(name:String){
        print("success")
        LoginViewController.UserName = DBhelper.inst.GetUser(n: name)
        self.performSegue(withIdentifier: "gotoTab", sender: self)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "success"){
                let displayVC = segue.destination as! EditUserViewController
            print(LoginViewController.UserName?.dob!)
            displayVC.na = LoginViewController.UserName?.un
            displayVC.today = formatDate(date:(LoginViewController.UserName?.dob)!)
        }
    }
    @IBAction func reset(_ sender: Any) {
       
        DBhelper.inst.reset()
    }
    func alertor(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
