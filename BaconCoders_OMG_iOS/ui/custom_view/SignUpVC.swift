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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        print("[SignUpVC] signUpButtonTapped")
        self.signUpVCDelegate?.actionSignUpConfirmedButton()
    }
}
