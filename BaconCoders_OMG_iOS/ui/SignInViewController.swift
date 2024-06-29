//
//  SignInViewController.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import UIKit

class SignInViewController: UIViewController {
    private let navigationView : CustomNavigationVC = CustomNavigationVC()

    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var findPasswordBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var anotherAccountLabel: UILabel!
    @IBOutlet weak var signInWithAppleAccountBtn: UIButton!
    @IBOutlet weak var signInWithGoogleAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.isShowGoBack = true
        navigationView.view.frame.origin = CGPoint(x: 0, y: navigationView.view.frame.height)
        self.view.addSubview(navigationView.view)
    }
    
    //MARK: - ui action -

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("[SignInViewController] signInButtonTapped")
        
    }
    
    @IBAction func signInWithAppleButtonTapped(_ sender: UIButton) {
        print("[SignInViewController] signInWithAppleButtonTapped")
        
    }
    
    @IBAction func signInWithGoogleButtonTapped(_ sender: UIButton) {
        print("[SignInViewController] signInWithGoogleButtonTapped")
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        print("[SignInViewController] signUpButtonTapped")
        
    }
}


