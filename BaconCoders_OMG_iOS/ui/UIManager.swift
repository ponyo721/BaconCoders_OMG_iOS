//
//  UIManager.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/30/24.
//

import Foundation
import UIKit

protocol UIManagerDelegate: AnyObject {
    func trySignInWithType(_ type:SIGN_IN_TYPE)
}

class UIManager : EntranceVCDelegate, EmailSignUpVCDelegate, SignUpCompleteVCDelegate, EmailSignInVCDelegate{
    var delegate : UIManagerDelegate?
    
    var entranceVC : EntranceVC?
    let emailSignInVC : EmailSignInVC = EmailSignInVC()
    
    var currentVC : UIViewController?
    
    func initalize(){
        print("[UIManager] initalize")
        
        if UIApplication.shared.windows.first == nil {
            print("[UIManager] window first nil")
        }
        
        let viewController = UIApplication.shared.windows.first?.rootViewController as? NavigationVC

        entranceVC = viewController?.viewControllers.first as? EntranceVC
        entranceVC?.enterVCDelegate = self
        
        currentVC = entranceVC
    }
    
    //MARK: - private -
    
    @objc func showEntranceVC() {
        print("[UIManager] showEntranceVC")
        
        let enterVC = EntranceVC()
        enterVC.enterVCDelegate = self
        enterVC.navigationItem.setHidesBackButton(true, animated: false)
        
        self.currentVC?.show(enterVC, sender: nil)
        currentVC = enterVC
    }
    
    func showEmailSignInVC() {
        print("[UIManager] showEmailSignInVC")
        
        let emailSignInVC = EmailSignInVC()
        emailSignInVC.emailSignInVCDelegate = self
        emailSignInVC.navigationItem.setHidesBackButton(true, animated: false)
        
        /*
         not work ㅠㅠ
         */
//        emailSignInVC.navigationItem.leftBarButtonItem?.action = #selector(showEntranceVC)
        
        self.currentVC?.show(emailSignInVC, sender: nil)
        currentVC = emailSignInVC
    }
    
    func showSignUpVC() {
        print("[UIManager] showSignUpVC")
        
        let signUpVC = EmailSignUpVC()
        signUpVC.signUpVCDelegate = self
        signUpVC.navigationItem.setHidesBackButton(true, animated: false)
        
        self.currentVC?.show(signUpVC, sender: nil)
        currentVC = signUpVC
    }
    
    func showSignUpCompleteVC() {
        print("[UIManager] showSignUpCompleteVC")
        
        let signUpCompleteVC = SignUpCompleteVC()
        signUpCompleteVC.signUpCompleteVCDelegate = self
        signUpCompleteVC.navigationItem.setHidesBackButton(true, animated: false)
        
        self.currentVC?.show(signUpCompleteVC, sender: nil)
        currentVC = signUpCompleteVC
    }
    
    //MARK: - EntranceVCDelegate -
    func actiongoSignUpButtonTapped() {
        print("[UIManager] actiongoSignUpButtonTapped")
        
        showSignUpVC()
    }
    
    func actiongoSignInButtonTappedWithType(_ type: SIGN_IN_TYPE) {
        print("[UIManager] actiongoSignInButtonTappedWithType : \(type)")
        
        switch type {
        case .NORMAL:
            self.showEmailSignInVC()
            break
        default:
            self.delegate?.trySignInWithType(type)
            break
        }
    }
    
    //MARK: - EntranceVCDelegate -
    
    func actionGoBack() {
        print("[UIManager] actionGoBack")
        
        emailSignInVC.removeFromParent()
    }
    
    //MARK: - EmailSignUpVCDelegate -
    func actionSignUpConfirmedButton() {
        print("[UIManager] actionSignUpConfirmedButton")
        
        showSignUpCompleteVC()
    }
    
    //MARK: - SignUpCompleteVCDelegate -
    func actionGoSignInButton() {
        print("[UIManager] actionGoSignInButton")
        
        showEmailSignInVC()
    }
    
    //MARK: - EmailSignInVCDelegate -
    func actionEmailSignInNavigationBackBtn() {
        print("[UIManager] actionEmailSignInNavigationBackBtn")
        showEntranceVC()
    }
}
