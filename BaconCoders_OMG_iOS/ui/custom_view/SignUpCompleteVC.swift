//
//  SignUpCompleteVC.swift
//  BaconCoders_OMG_iOS
//
//  Created by 알파카 on 2024/09/23.
//

import UIKit

protocol SignUpCompleteVCDelegate: AnyObject {
    func actionGoSignInButton()
}

class SignUpCompleteVC: UIViewController {
    
    //MARK: - ui outlet -
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var shortContent: UILabel!
    @IBOutlet weak var longContent: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var signInBtn: UIButton!
    
    //MARK: - property -
    var signUpCompleteVCDelegate : SignUpCompleteVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func actionSignInBtn(_ sender: Any) {
        print("[SignUpVC] actionSignInBtn")
        self.signUpCompleteVCDelegate?.actionGoSignInButton()
    }
}

