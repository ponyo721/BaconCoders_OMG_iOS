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

class EntranceVC: UIViewController, CommonPushBtnVCDelegate {

    
    private let navigationView : CustomNavigationVC = CustomNavigationVC()
    var delegate : EntranceVCDelegate?
    var signUpBtn : CommonPushBtnVC?
    var signUpKakaoBtn : CommonPushBtnVC?
    var signUpGoogleBtn : CommonPushBtnVC?
    
    
    @IBOutlet weak var signInBtn : UIButton!
    
    
    override func viewDidLoad() {
        print("[EntranceVC] viewDidLoad")
        super.viewDidLoad()
        self.uiInitalize()
    }
    
    func uiInitalize(){
        // navigationView
//        navigationView.view.frame.origin = CGPoint(x: 0, y: navigationView.view.frame.height)
//        self.view.addSubview(navigationView.view)
        
        signUpBtn = CommonPushBtnVC()
        signUpBtn?.delegate = self
        signUpBtn?.btnTitle = "BTN_TITLE_KAKAO".localized
        signUpBtn?.btnImage = .remove
        signUpBtn?.btnType = .KAKAO
        signUpBtn?.btnSize = .LARGE
        signUpBtn?.view.frame.origin = CGPointMake(0, 150)
        self.view.addSubview(signUpBtn!.view)
        
        signUpKakaoBtn = CommonPushBtnVC()
        signUpKakaoBtn?.delegate = self
        signUpKakaoBtn?.btnTitle = "Google로 시작하기"
        signUpKakaoBtn?.btnImage = .remove
        signUpKakaoBtn?.btnType = .GOOGLE
        signUpKakaoBtn?.btnSize = .LARGE
        signUpKakaoBtn?.view.frame.origin = CGPointMake(0, 300)
        self.view.addSubview(signUpKakaoBtn!.view)
        
        signUpGoogleBtn = CommonPushBtnVC()
        signUpGoogleBtn?.delegate = self
        signUpGoogleBtn?.btnTitle = "이메일로 시작하기"
        signUpGoogleBtn?.btnImage = .remove
        signUpGoogleBtn?.btnType = .NORMAL
        signUpGoogleBtn?.btnSize = .LARGE
        signUpGoogleBtn?.view.frame.origin = CGPointMake(0, 450)
        self.view.addSubview(signUpGoogleBtn!.view)
    }
    
    //MARK: - CommonPushBtnVCDelegate -
    func actionCommonBtnWithType(_ type: PUSH_BTN_TYPE) {
        print("[EntranceVC] actionCommonBtnWithType : \(type)")
        switch type{
        case .NORMAL:
            self.delegate?.actiongoSignUpButtonTapped()
            break
        case .KAKAO:
            self.delegate?.actiongoSignInButtonTappedWithType(.KAKAO)
            break
        case .GOOGLE:
            self.delegate?.actiongoSignInButtonTappedWithType(.GOOGLE)
            break
        }
    }
    
    //MARK: - ui action -
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("[EntranceVC] signInButtonTapped")
        self.delegate?.actiongoSignInButtonTappedWithType(.NORMAL)
    }
    
    //MARK: - private method -
    

}
