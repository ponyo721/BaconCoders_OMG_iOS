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

class UIManager : EntranceVCDelegate, SignInVCDelegate{
    var delegate : UIManagerDelegate?
    
    var entranceVC : EntranceVC?
    let signInVC : SignInVC = SignInVC()
    
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
    
    func showEntranceVC() {
        print("[UIManager] showEntranceVC")
        
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//            print("[UIManager] showEntranceVC 1")
//            if let window = windowScene.windows.first {
//                print("[UIManager] showEntranceVC 1")
////                entranceVC.modalTransitionStyle = .coverVertical
////                // 전환된 화면이 보여지는 방법 설정 (fullScreen)
////                entranceVC.modalPresentationStyle = .fullScreen
//////                window.rootViewController?.present(entranceVC, animated: true, completion: nil)
////                window.rootViewController = entranceVC
////                window.makeKeyAndVisible()
//            }
//        }
    }
    
    func showSignInVC() {
        print("[UIManager] showSignInVC")
        
        signInVC.delegate = self
        signInVC.navigationView = CustomNavigationVC()
        signInVC.navigationView?.isShowGoBack = true
        
        signInVC.modalTransitionStyle = .coverVertical
        // 전환된 화면이 보여지는 방법 설정 (fullScreen)
        signInVC.modalPresentationStyle = .fullScreen
        entranceVC?.present(signInVC, animated: true, completion: nil)
    }
    
    func showSignUpVC() {
        print("[UIManager] showSignUpVC")
        
        self.currentVC?.show(TestVC(), sender: nil)
    }
    
    //MARK: - EntranceVCDelegate -
    func actiongoSignUpButtonTapped() {
        print("[UIManager] actiongoSignUpButtonTapped")
        
        self.showSignUpVC()
    }
    
    func actiongoSignInButtonTappedWithType(_ type: SIGN_IN_TYPE) {
        print("[UIManager] actiongoSignInButtonTappedWithType : \(type)")
        
        switch type {
        case .NORMAL:
            self.showSignInVC()
            break
        default:
            self.delegate?.trySignInWithType(type)
            break
        }
    }
    
    //MARK: - EntranceVCDelegate -
    
    func actionGoBack() {
        print("[UIManager] actionGoBack")
        
        signInVC.removeFromParent()
    }
}
