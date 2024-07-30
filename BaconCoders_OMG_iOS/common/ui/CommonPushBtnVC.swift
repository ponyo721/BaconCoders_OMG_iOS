//
//  CommonPushBtnVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/4/24.
//

import UIKit

let BTN_CORNE_RRADIUS:CGFloat = 10

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

class CommonPushBtnConfigure{
    var btnTitle : String? = nil
    var btnImage : UIImage? = nil
    var btnType : PUSH_BTN_TYPE = .NORMAL
    var btnSize : CGSize = CGSizeMake(100, 100)
}

class CommonPushBtnVC: UIViewController{
    var delegate : CommonPushBtnVCDelegate? = nil
    var configure : CommonPushBtnConfigure? = nil
    
    @IBOutlet weak private var btn: UIButton!
    
    override func viewDidLoad() {
        print("[CommonPushBtnVC] viewDidLoad")
        self.initWithConfigure(configure)
    }
    
    func initWithConfigure(_ config:CommonPushBtnConfigure?){
        if config == nil {return}
        print("[CommonPushBtnVC] initWithConfigure")
        
        self.btn.layer.cornerRadius = BTN_CORNE_RRADIUS
        
        if config?.btnTitle != nil {
            self.btn.setTitle(config?.btnTitle!, for: .normal)
        }
        
        if config?.btnImage != nil {
            self.btn.setImage(config?.btnImage!, for:.normal)
        }
        
        self.view.frame.size = config!.btnSize
        self.btn.frame.size = self.view.frame.size
        
        switch config?.btnType {
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
        default:
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
        self.delegate?.actionCommonBtnWithType(configure!.btnType)
    }
}
