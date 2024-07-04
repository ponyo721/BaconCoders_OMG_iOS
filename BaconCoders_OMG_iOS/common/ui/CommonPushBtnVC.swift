//
//  CommonPushBtnVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/4/24.
//

import UIKit

enum PUSH_BTN_SIZE {
    case SMALL
    case MEDIUM
    case LARGE
}

enum PUSH_BTN_TYPE {
    case NORMAL
    case GOOGLE
    case KAKAO
}

class CommonPushBtnVC: UIViewController{
    var btnType : PUSH_BTN_TYPE = .NORMAL
    var btnSize : PUSH_BTN_SIZE = .MEDIUM
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        self.uiInitalize()
    }
    
    func uiInitalize(){
        switch btnType {
        case .NORMAL:
            btn.backgroundColor = UIColor(named: "BtnNormalColor")
            break
        case .KAKAO:
            break
        case .GOOGLE:
            break
        }
        
        switch btnSize {
        case .SMALL:
            break
        case .MEDIUM:
            break
        case .LARGE:
            break
        }
    }
    
}
