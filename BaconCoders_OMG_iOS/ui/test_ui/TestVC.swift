//
//  TestVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/4/24.
//

import UIKit
import GoogleSignIn

class TestVC: UIViewController {
    var commonBtnVC : CommonPushBtnVC? = nil
    
    //MARK: ex
    override func viewDidLoad() {
        print("[TestVC] viewDidLoad()")
        var centerX : CGFloat = self.view.frame.size.width / 2
        var centerY : CGFloat = self.view.frame.size.height / 2
        
        //MARK: ui size
        let config : CommonPushBtnConfigure = CommonPushBtnConfigure()
        config.btnTitle = "로그인!"
        config.btnImage = .remove
        config.btnType = .KAKAO
//        config.btnSize = .LARGE
        
        commonBtnVC = CommonPushBtnVC()
        commonBtnVC?.configure = config
        
        print("[TestVC] set option()")
        
        let testViewSize : CGSize = commonBtnVC!.view.frame.size
        centerX = centerX - (testViewSize.width / 2)
        centerY = centerY - (testViewSize.height / 2)
        
        commonBtnVC!.view.frame.origin = CGPointMake(centerX, centerY)
        
        
        self.view.addSubview(commonBtnVC!.view)
        
        
        print("[TestVC] addSubview")
        
        
    }
//    override func viewDidLoad() {
//        print("[TestVC] viewDidLoad()")
//        var centerX : CGFloat = self.view.frame.size.width / 2
//        var centerY : CGFloat = self.view.frame.size.height / 2
//        
//        //MARK: ui size
//        commonBtnVC = CommonPushBtnVC()
//        commonBtnVC?.btnTitle = "로그인"
//        commonBtnVC?.btnType = .NORMAL
//        commonBtnVC?.btnSize = .LARGE
//        
//        let testViewSize : CGSize = commonBtnVC!.view.frame.size
//        centerX = centerX - (testViewSize.width / 2)
//        centerY = centerY - (testViewSize.height / 2)
//        
//        commonBtnVC!.view.frame.origin = CGPointMake(centerX, centerY)
//        
//        
//        self.view.addSubview(commonBtnVC!.view)
//        
//        print("[TestVC] addSubview")
//        
//        
//    }
    
    
    @IBAction func actionBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
