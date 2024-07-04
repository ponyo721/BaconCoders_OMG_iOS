//
//  NetWorkManager.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/30/24.
//

import UIKit

protocol NetWorkManagerDelegate: AnyObject {
    
}

class NetWorkManager {
    var delegate : NetWorkManagerDelegate?
    
    private let kakaoSignInModule : KakaoSignInModule = KakaoSignInModule()
    private let googleSignInModule : GoogleSignInModule = GoogleSignInModule()
    
    func initalize(){
        print("[NetWorkManager] initalize")
    }
    
    func singInGoogle(_ vc:UIViewController) -> Bool {
        print("[NetWorkManager] singInGoogle")
        return googleSignInModule.googleLoginWithPresenting(vc)
    }
    
    func singInKakao() -> Bool {
        print("[NetWorkManager] singInKakao")
        return kakaoSignInModule.validateKakaoLogin()
    }
    
    
    
    
    
//    let httpClient : HTTPClient = HTTPClient()
    
    
    //    // GET 요청 예제
    //    if let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") {
    //        HTTPClient.shared.get(url: url) { result in
    //            switch result {
    //            case .success(let data):
    //                print("GET 요청 성공: \(data)")
    //                // 데이터 처리 로직
    //            case .failure(let error):
    //                print("GET 요청 실패: \(error.localizedDescription)")
    //            }
    //        }
    //    }
    //        
    //        // POST 요청 예제
    //        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
    //            let body: [String: Any] = ["title": "foo", "body": "bar", "userId": 1]
    //            HTTPClient.shared.post(url: url, body: body) { result in
    //                switch result {
    //                case .success(let data):
    //                    print("POST 요청 성공: \(data)")
    //                    // 데이터 처리 로직
    //                case .failure(let error):
    //                    print("POST 요청 실패: \(error.localizedDescription)")
    //                }
    //            }
    //        }
    
}
