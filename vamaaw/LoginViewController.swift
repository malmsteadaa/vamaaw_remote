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
    @IBOutlet weak var backgroundGradientView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //creates and applys gradient to view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors =
        [UIColor.blue.cgColor, UIColor.white.cgColor]
        backgroundGradientView.layer.addSublayer(gradientLayer)
        
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
    func success(name:String){
        LoginViewController.UserName=DBhelper.inst.GetUser(n: name)
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
