//
//  CommonPushBtnVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/4/24.
//

import UIKit

let BTN_CORNE_RRADIUS:CGFloat = 10

let BTN_SMALL_WIDTH:CGFloat = 72
let BTN_SMALL_HEIGHT:CGFloat = 31
let BTN_MEDIUM_WIDTH:CGFloat = 305
let BTN_MEDIUM_HEIGHT:CGFloat = 45
let BTN_LARGE_WIDTH:CGFloat = 380
let BTN_LARGE_HEIGHT:CGFloat = 48

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

protocol CommonPushBtnVCDelegate: AnyObject {
    func actionCommonBtnWithType(_ type:PUSH_BTN_TYPE)
}

class CommonPushBtnVC: UIViewController{
    var delegate : CommonPushBtnVCDelegate? = nil
    var btnTitle : String? = nil
    var btnImage : UIImage? = nil
    var btnType : PUSH_BTN_TYPE = .NORMAL
    var btnSize : PUSH_BTN_SIZE = .MEDIUM
    
    @IBOutlet weak private var btn: UIButton!
    
    override func viewDidLoad() {
        print("[CommonPushBtnVC] viewDidLoad")
        self.uiInitalize()
    }
    
    func uiInitalize(){
        print("[CommonPushBtnVC] uiInitalize")
        
        self.btn.layer.cornerRadius = BTN_CORNE_RRADIUS
        
        if btnTitle != nil {
            self.btn.setTitle(btnTitle!, for: .normal)
        }
        
        if btnImage != nil {
            self.btn.setImage(btnImage!, for:.normal)
        }
        
        switch btnSize {
        case .SMALL:
            self.view.frame.size = CGSizeMake(BTN_SMALL_WIDTH, BTN_SMALL_HEIGHT)
            break
        case .MEDIUM:
            self.view.frame.size = CGSizeMake(BTN_MEDIUM_WIDTH, BTN_MEDIUM_HEIGHT)
            break
        case .LARGE:
            self.view.frame.size = CGSizeMake(BTN_LARGE_WIDTH, BTN_LARGE_HEIGHT)
            break
        }
        self.btn.frame.size = self.view.frame.size
        
        switch btnType {
        case .NORMAL:
            self.btn.backgroundColor = UIColor(named: "BtnNormalColor")
            self.btn.setTitleColor(.white, for: .normal)
            break
        case .KAKAO:
            self.btn.backgroundColor = .systemYellow
            self.btn.setTitleColor(.black, for: .normal)
            break
        case .GOOGLE:
//            self.btn.color
            self.btn.backgroundColor = .white
            self.btn.setTitleColor(.black, for: .normal)
            break
        }
        
        self.btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.70).cgColor
        self.btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.btn.layer.shadowOpacity = 1.0
        self.btn.layer.shadowRadius = 0.0
        self.btn.layer.masksToBounds = false
        self.btn.layer.cornerRadius = 4.0
    }
    
    
    @IBAction func actionBtn(_ sender: Any) {
        self.delegate?.actionCommonBtnWithType(btnType)
    }
}
