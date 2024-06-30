//
//  SignInViewController.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import UIKit

class SignInViewController: UIViewController, CustomNavigationVCDelegate {
    var navigationView : CustomNavigationVC?

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
        
        if navigationView != nil {
            navigationView!.delegate = self
            navigationView!.view.frame.origin = CGPoint(x: 0, y: navigationView!.view.frame.height)
            self.view.addSubview(navigationView!.view)
        }
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
    
    //MARK: - CustomNavigationVCDelegate -
    
    func actiongoBackBtnTapped(_ backScene: UIViewController) {
        print("[SignInViewController] actiongoBackBtnTapped")
        
        backScene.modalTransitionStyle = .coverVertical
        // 전환된 화면이 보여지는 방법 설정 (fullScreen)
        backScene.modalPresentationStyle = .fullScreen
        self.present(backScene, animated: true, completion: nil)
    }
}


