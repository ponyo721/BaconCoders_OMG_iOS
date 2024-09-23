//
//  EmailSignInVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 알파카 on 2024/09/23.
//

import UIKit

protocol EmailSignInVCDelegate: AnyObject {
    
}

class EmailSignInVC: UIViewController {

    //MARK: - ui outlet -
    
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passTitle: UILabel!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var findPassBtn: UIButton!
    
    //MARK: - property -
    var emailSignInVCDelegate : EmailSignInVCDelegate?

    //MARK: -  -
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    //MARK: - ui action -
    @IBAction func actionSignInBtn(_ sender: Any) {
        print("[EmailSignInVC] actionSignInBtn")
    }
    
    @IBAction func actionSignUpBtn(_ sender: Any) {
        print("[EmailSignInVC] actionSignUpBtn")
    }
    
    @IBAction func actionFindPassBtn(_ sender: Any) {
        print("[EmailSignInVC] actionFindPassBtn")
    }
    
    
}

