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
    var enterVCDelegate : EntranceVCDelegate?
    
    //MARK: - ui area -
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var mainContent: UIView!
    @IBOutlet weak var subContent: UIView!
    
    @IBOutlet weak var kakaoArea: UIView!
    @IBOutlet weak var googleArea: UIView!
    @IBOutlet weak var emailArea: UIView!
    
    @IBOutlet weak var emailsignUpBtn: UIButton!
    @IBOutlet weak var inquiryBtn: UIButton!
    @IBOutlet weak var faqBtn: UIButton!
    
    // signIn btns
    private var signInBtn : CommonPushBtnVC?
    private var signInKakaoBtn : CommonPushBtnVC?
    private var signInGoogleBtn : CommonPushBtnVC?
    
    
    override func viewDidLoad() {
        print("[EntranceVC] viewDidLoad")
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("[EntranceVC] viewDidAppear")
        self.uiInitalize()
    }
    
    func uiInitalize(){
        // navigationView
//        navigationView.view.frame.origin = CGPoint(x: 0, y: navigationView.view.frame.height)
//        self.view.addSubview(navigationView.view)
        
        // item 1
        let config1 : CommonPushBtnConfigure = CommonPushBtnConfigure()
        config1.btnTitle = "BTN_TITLE_KAKAO".localized
        config1.btnImage = .remove
        config1.btnType = .KAKAO
        config1.btnSize = kakaoArea.frame.size
        
        signInBtn = CommonPushBtnVC()
        signInBtn?.delegate = self
        signInBtn?.configure = config1
        
        signInBtn?.view.frame.origin = kakaoArea.frame.origin
        self.view.addSubview(signInBtn!.view)
        
        // item 2
        let config2 : CommonPushBtnConfigure = CommonPushBtnConfigure()
        config2.btnTitle = "BTN_TITLE_GOOGLE".localized
        config2.btnImage = .remove
        config2.btnType = .GOOGLE
        config2.btnSize = googleArea.frame.size
        
        signInKakaoBtn = CommonPushBtnVC()
        signInKakaoBtn?.delegate = self
        signInKakaoBtn?.configure = config2
        
        signInKakaoBtn?.view.frame.origin = googleArea.frame.origin
        self.view.addSubview(signInKakaoBtn!.view)
        
        // item 3
        let config3 : CommonPushBtnConfigure = CommonPushBtnConfigure()
        config3.btnTitle = "BTN_TITLE_EMAIL".localized
        config3.btnImage = .remove
        config3.btnType = .NORMAL
        config3.btnSize = emailArea.frame.size
        
        signInGoogleBtn = CommonPushBtnVC()
        signInGoogleBtn?.delegate = self
        signInGoogleBtn?.configure = config3
        
        signInGoogleBtn?.view.frame.origin = emailArea.frame.origin
        self.view.addSubview(signInGoogleBtn!.view)
    }
    
    //MARK: - CommonPushBtnVCDelegate -
    func actionCommonBtnWithType(_ type: PUSH_BTN_TYPE) {
        print("[EntranceVC] actionCommonBtnWithType : \(type)")
        switch type{
        case .NORMAL:
            self.enterVCDelegate?.actiongoSignInButtonTappedWithType(.NORMAL)
            break
        case .KAKAO:
            self.enterVCDelegate?.actiongoSignInButtonTappedWithType(.KAKAO)
            break
        case .GOOGLE:
            self.enterVCDelegate?.actiongoSignInButtonTappedWithType(.GOOGLE)
            break
        }
    }
    
    //MARK: - ui action -
    @IBAction func actionEmailSignInBtn(_ sender: UIButton) {
        print("[EntranceVC] actionEmailSignInBtn")
        
        self.enterVCDelegate?.actiongoSignUpButtonTapped()
    }
    
    //MARK: - private method -
    

}
