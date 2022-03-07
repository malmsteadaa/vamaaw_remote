//
//  LoginViewController.swift
//  vamaaw
//
//  Created by admin on 3/7/22.
//

import UIKit

class LoginViewController: UIViewController {
    static var UserName :String = " "
    func logout(){
        LoginViewController.UserName=" "
    }
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var un: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func login(_ sender: Any) {
        let q:[String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : un.text, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        var res : CFTypeRef?
        if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
         if   let item = res as? [String : Any],
            let uid = item[kSecAttrAccount as String] as? String,
            let password = item [ kSecValueData as String] as? Data,
            let pass = String(data: password, encoding: .utf8){
                print("id is", uid, "password is", pass)
             if(pass==pw.text!){
                 success(name:uid)
             }else{
                 print("Failed login")
             }
            }
        }else{
            print("no data found")
        }
    }
    func success(name:String){
        LoginViewController.UserName=name
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
