//
//  KakaoSignInModule.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/1/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoSignInModule {
    func validateKakaoLogin() -> Bool {
        var isValidate : Bool = false
        
        // 카카오톡 설치 여부 확인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    isValidate = true
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
//        }
        
        return isValidate
    }
}
