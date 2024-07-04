//
//  GoogleSignInModule.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/1/24.
//

import UIKit
import GoogleSignIn

class GoogleSignInModule {
    func checkState() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // 비로그인 상태
                print("Not Sign In")
            } else {
                // 로그인 상태
                guard let user = user else { return }
                guard let profile = user.profile else { return }
                // 유저 데이터 로드
                self.loadUserData(profile)
            }
        }
    }
    // 구글 로그인
    func googleLogin() -> Bool {
        return true
        
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
//            guard error == nil else {
//                // 로그인 실패 시
//                let popup = UIAlertController(title: "로그인 실패", message: "다시 로그인해주세요", preferredStyle: .alert)
//                let action = UIAlertAction(title: "확인", style: .default)
//                popup.addAction(action)
//                self.present(popup, animated: true)
//                return
//            }
//            // 로그인 성공 시
//            guard let user = signInResult?.user else { return }
//            guard let profile = user.profile else { return }
//            // 유저 데이터 로드
//            self.loadUserData(profile)
//        }
    }
    
    func googleLoginWithPresenting(_ vc:UIViewController) -> Bool {
        var rtn : Bool = false
        
        GIDSignIn.sharedInstance.signIn(withPresenting: vc) { signInResult, error in
            guard error == nil else {
                // 로그인 실패 시
                let popup = UIAlertController(title: "로그인 실패", message: "다시 로그인해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default)
                popup.addAction(action)
                vc.present(popup, animated: true)
                return
            }
            // 로그인 성공 시
            guard let user = signInResult?.user else { return }
            guard let profile = user.profile else { return }
            // 유저 데이터 로드
            self.loadUserData(profile)
            
            rtn = true
        }
        
        return rtn
    }
    
    // 유저 데이터 전달
    func loadUserData(_ profile:GIDProfileData) {
        let emailAddress = profile.email
        let fullName = profile.name
        let profilePicUrl = profile.imageURL(withDimension: 180)
        
        // 이미지 다운로드
        if let profilePicUrl = profilePicUrl {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: profilePicUrl) {
                    if let image = UIImage(data: data) {
                        // UI는 main thread에서만 접근가능
                        DispatchQueue.main.async {
                            let data = UserData(profile: image, name: fullName, email: emailAddress)
                            
                            print("moveMyPage")
                        }
                    }
                }
            }
        }
    }
}
