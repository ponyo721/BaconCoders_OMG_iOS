//
//  OMGManager.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/30/24.
//

import Foundation

class OMGManager : UIManagerDelegate, NetWorkManagerDelegate{
    let uiManager : UIManager = UIManager()
    let netWorkManager : NetWorkManager = NetWorkManager()
    
    func initalize(){
        print("[OMGManager] initalize")
        
        uiManager.delegate = self
        uiManager.initalize()
        netWorkManager.delegate = self
        netWorkManager.initalize()
    }
    
    //MARK: - UIManagerDelegate -
    
    func trySignInWithType(_ type: SIGN_IN_TYPE) {
        switch type {
        case .NORMAL:
            break
        case .GOOGLE:
            if netWorkManager.singInGoogle(uiManager.entranceVC!) {
                
            }else{
                
            }
            break
        case .KAKAO:
            if netWorkManager.singInKakao() {
                
            }else{
                
            }
            break
        case .APPLE:
            break
//        default:
//            break
        }
    }
    
    //MARK: - NetWorkManagerDelegate -
    
}
