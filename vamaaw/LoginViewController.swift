//
//  LoginViewController.swift
//  vamaaw
//
//  Created by admin on 2/28/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UN: UITextField!
    @IBOutlet weak var PW: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func forgot(_ sender: Any) {
        performSegue(withIdentifier: "Forogot", sender: self)

    }
    @IBAction func login(_ sender: Any) {
        if(signin()){
            performSegue(withIdentifier: "Login", sender: self)}else{print("Can't Signin")}
    }
    @IBAction func Register(_ sender: Any) {
        	performSegue(withIdentifier: "Register", sender: self)
    }
    func signin()->Bool{
        //querry for using n as the parameter for key
        let q:[String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : UN.text!, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        var res : CFTypeRef?
        if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
         if   let item = res as? [String : Any],
            let uid = item[kSecAttrAccount as String] as? String,
        
            let password = item [ kSecValueData as String] as? Data,
            let pass = String(data: password, encoding: .utf8){
             if(pass==PW.text!){
             print("id is", uid, "password is", pass)
                 return true
             }else{
                 print("wrong password")
                 return false
             }
            }
        }else{
            print("no data found")
            return false

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
