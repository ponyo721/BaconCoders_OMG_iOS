//
//  CustomNavigationView.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/29/24.
//

import UIKit

protocol CustomNavigationVCDelegate: AnyObject {
    func actiongoBackBtnTapped()
}

class CustomNavigationVC: UIViewController{
    var delegate : CustomNavigationVCDelegate?
    var isShowGoBack : Bool = false;
    
    //MARK: - IBOutlet -
    @IBOutlet weak var goBackBtn: UIButton!
    
    //MARK: - override -
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[CustomNavigationVC] viewDidLoad")
        
        if !isShowGoBack {
            self.goBackBtn.isHidden = true
        }
        
    }
    
    //MARK: - ui action -
    @IBAction func goBackBtnTapped(_ sender: Any) {
        print("[CustomNavigationVC] goBackBtnTapped")
        
        self.delegate?.actiongoBackBtnTapped()
    }
}
