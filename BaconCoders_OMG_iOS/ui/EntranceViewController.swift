//
//  EntranceViewController.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import Foundation

import UIKit

class EntranceViewController: UIViewController {
    private let navigationView : CustomNavigationVC = CustomNavigationVC()
    
    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var signInWithAppleAccountBtn : UIButton!
    @IBOutlet weak var signInWithGoogleAccountBtn : UIButton!
    @IBOutlet weak var signInBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let guide = view.safeAreaLayoutGuide
//        let height = guide.layoutFrame.size.height
//        let width = guide.layoutFrame.size.width
//        print("[EntranceViewController] width : \(width), height : \(height)")
//        print("[EntranceViewController] signUpButtonTapped")
        
        navigationView.view.frame.origin = CGPoint(x: 0, y: navigationView.view.frame.height)
        self.view.addSubview(navigationView.view)
    }
    
    //MARK: - ui action -
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signUpButtonTapped")
    }
    
    @IBAction func signInWithAppleButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signInWithAppleButtonTapped")
    }
    
    @IBAction func signInWithGoogleUpButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signInWithGoogleUpButtonTapped")
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signInButtonTapped")
        
        self.showSignInVC()
    }
    
    //MARK: - private method -
    
    func showSignInVC() {
        if let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            
            // 화면 전환 애니메이션 설정
            signInVC.modalTransitionStyle = .coverVertical
            // 전환된 화면이 보여지는 방법 설정 (fullScreen)
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: true, completion: nil)
        }
    }
}
