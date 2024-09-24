//
//  SignUpVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import UIKit

protocol SignUpVCDelegate: AnyObject {
    func actionSignUpConfirmedButton()
}

class SignUpVC: UIViewController {

    //MARK: - ui outlet -
    
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var usernameTitle: UILabel!
    @IBOutlet weak var usernameWarningText: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameCheckBtn: UIButton!
    
    @IBOutlet weak var authCodeTitle: UILabel!
    @IBOutlet weak var authCodeWarningText: UILabel!
    @IBOutlet weak var authCodeTextField: UITextField!
    @IBOutlet weak var authCodeCheckBtn: UIButton!
    
    @IBOutlet weak var passwordTitle: UILabel!
    @IBOutlet weak var passwordWarningText: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordRecheckTitle: UILabel!
    @IBOutlet weak var passwordRecheckWarningText: UILabel!
    @IBOutlet weak var passwordRecheckTextField: UITextField!
    
    @IBOutlet weak var agreeCheckBox: UISwitch!
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var showConsentForm: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    //MARK: - property -
    var signUpVCDelegate : SignUpVCDelegate?

    //MARK: - private -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiInitalize()
    }
    
    func uiInitalize(){
        self.usernameWarningText.text = ""
        self.authCodeWarningText.text = ""
        self.passwordWarningText.text = ""
        self.passwordRecheckWarningText.text = ""
    }
    
    //MARK: - public -
    
    //MARK: - ui action -
    @IBAction func actionEamilCheckBtn(_ sender: Any) {
        print("[SignUpVC] actionEamilCheckBtn")
        
        guard let text = usernameTextField.text else{
            return
        }
        
        if usernameTextField.text!.isValidEmail() {
            print("validEmail")
            usernameWarningText.text = ""
            usernameTextField.isEnabled = false
            usernameCheckBtn.isEnabled = false
            
        }else {
            print("inValidEmail")
            usernameWarningText.text = "warning"
        }
    }
    
    @IBAction func actionAuthenticationCodeCheckBtn(_ sender: Any) {
        print("[SignUpVC] actionAuthenticationCodeCheckBtn")
        
        guard authCodeTextField.text != nil else{
            return
        }
        
        if true {
            print("AuthenticationCode ok")
            authCodeWarningText.text = ""
            authCodeTextField.isEnabled = false
            authCodeCheckBtn.isEnabled = false
            
        }else {
            print("AuthenticationCode fail")
        }
    }
    
    @IBAction func writeFirstPassTextField(_ sender: Any) {
        print("writeFirstPassTextField")
        
        guard passwordTextField.text != nil else{
            return
        }
        
        if passwordTextField.text!.isValidPass() {
            print("pass vaild ok")
            passwordWarningText.text = ""
            
        }else{
            print("pass invaild")
            passwordWarningText.text = "warning"
        }
        
    }
    
    
    @IBAction func writeSecondPassTextField(_ sender: Any) {
        print("writeSecondPassTextField")
        
        guard passwordRecheckTextField.text != nil else{
            return
        }
        
        if passwordRecheckTextField.text!.isValidPass() {
            print("pass vaild ok")
            passwordRecheckWarningText.text = ""
            
        }else{
            print("pass invaild")
            passwordRecheckWarningText.text = "warning"
        }
    }
    
    @IBAction func actionAgreeCheckBox(_ sender: Any) {
        print("actionAgreeCheckBox")
        
        if agreeCheckBox.isOn {
            print("agreeCheckBox On")
            
        }else{
            print("agreeCheckBox Off")
        }
    }
    
    @IBAction func actionShowConsentForm(_ sender: Any) {
        print("actionShowConsentForm")
    }
    
    @IBAction func actionEmailSignUpBtn(_ sender: Any) {
        print("actionEmailSignUpBtn")
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        print("[SignUpVC] signUpButtonTapped")
        
        self.signUpVCDelegate?.actionSignUpConfirmedButton()
    }
}
