//
//  EntranceVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import Foundation
import UIKit

protocol EntranceVCDelegate: AnyObject {
    func actiongoSignUpButtonTapped()
    func actiongoSignInButtonTappedWithType(_ type:SIGN_IN_TYPE)
}

class EntranceVC: UIViewController {
    private let navigationView : CustomNavigationVC = CustomNavigationVC()
    var delegate : EntranceVCDelegate?
    
    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var signInWithKakaoAccountBtn : UIButton!
    @IBOutlet weak var signInWithGoogleAccountBtn : UIButton!
    @IBOutlet weak var signInBtn : UIButton!
    
    
    override func viewDidLoad() {
        print("[EntranceVC] viewDidLoad")
        super.viewDidLoad()
        
        navigationView.view.frame.origin = CGPoint(x: 0, y: navigationView.view.frame.height)
        self.view.addSubview(navigationView.view)
//        
//        checkState()
    }
    
    //MARK: - ui action -
    @IBAction func signUpButtonTapped(_ sender: Any) {
        print("[EntranceVC] signUpButtonTapped")
        self.delegate?.actiongoSignUpButtonTapped()
    }
    
    @IBAction func signInWithKakaoButtonTapped(_ sender: UIButton) {
        print("[EntranceVC] signInWithKakaoButtonTapped")
        
        self.delegate?.actiongoSignInButtonTappedWithType(.KAKAO)
        
//        if validateKakaoLogin() {
//            print("[EntranceVC] validateKakaoLogin ok")
//        }else{
//            print("[EntranceVC] validateKakaoLogin fail")
//        }
    }
    
    @IBAction func signInWithGoogleUpButtonTapped(_ sender: UIButton) {
        print("[EntranceVC] signInWithGoogleUpButtonTapped")
        self.delegate?.actiongoSignInButtonTappedWithType(.GOOGLE)
        
//        googleLogin()
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("[EntranceVC] signInButtonTapped")
        self.delegate?.actiongoSignInButtonTappedWithType(.NORMAL)
    }
    
    //MARK: - private method -
    

}
