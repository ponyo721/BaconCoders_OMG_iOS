//
//  EntranceViewController.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import Foundation
import GoogleSignIn
import KakaoSDKCommon
import KakaoSDKAuth

import UIKit
import KakaoSDKUser

class EntranceViewController: UIViewController {
    private let navigationView : CustomNavigationVC = CustomNavigationVC()
    
    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var signInWithAppleAccountBtn : UIButton!
    @IBOutlet weak var signInWithGoogleAccountBtn : UIButton!
    @IBOutlet weak var signInBtn : UIButton!
    @IBOutlet weak var btnGoogleLogin: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.view.frame.origin = CGPoint(x: 0, y: navigationView.view.frame.height)
        self.view.addSubview(navigationView.view)
        
        // google
        
        // 버튼 스타일 설정
        //        btnGoogleLogin.colorScheme = .light
        //        btnGoogleLogin.style = .wide
        
        // 기존에 로그인한 경우 바로 페이지 이동
        checkState()
    }
    
    //MARK: - ui action -
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signUpButtonTapped")
    }
    
    @IBAction func signInWithAppleButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signInWithAppleButtonTapped")
        
        if validateKakaoLogin() {
            print("[EntranceViewController] validateKakaoLogin ok")
        }else{
            print("[EntranceViewController] validateKakaoLogin fail")
        }
    }
    
    @IBAction func signInWithGoogleUpButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signInWithGoogleUpButtonTapped")
        
        googleLogin()
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("[EntranceViewController] signInButtonTapped")
        
        self.showSignInVC()
    }
    
    //MARK: - private method -
    
    func showSignInVC() {
        if let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            
            signInVC.navigationView = CustomNavigationVC()
            signInVC.navigationView?.isShowGoBack = true
            signInVC.navigationView?.backScene = self
            
            // 화면 전환 애니메이션 설정
            signInVC.modalTransitionStyle = .coverVertical
            // 전환된 화면이 보여지는 방법 설정 (fullScreen)
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: true, completion: nil)
        }
    }
}

//MARK: - Google Login
extension EntranceViewController {
    // 기존 로그인 상태 확인
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
    func googleLogin() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else {
                // 로그인 실패 시
                let popup = UIAlertController(title: "로그인 실패", message: "다시 로그인해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default)
                popup.addAction(action)
                self.present(popup, animated: true)
                return
            }
            // 로그인 성공 시
            guard let user = signInResult?.user else { return }
            guard let profile = user.profile else { return }
            // 유저 데이터 로드
            self.loadUserData(profile)
        }
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
                            self.moveMyPage(data)
                        }
                    }
                }
            }
        }
    }
    // 마이페이지 이동
    func moveMyPage(_ data:UserData) {
        print("moveMyPage")
    }
}

//MARK: - Kakao Login
extension EntranceViewController {
    
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
