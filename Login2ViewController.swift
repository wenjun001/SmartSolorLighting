//
//  Login2ViewController.swift
//  BottomNavigationController
//
//  Created by xiu on 1/27/19.
//  Copyright © 2019 CosmicMind. All rights reserved.
//

import UIKit
import SnapKit
class Login2ViewController: UIViewController , UITextFieldDelegate {
    
    var txtUser: UITextField!
    var txtPwd: UITextField!
    var formView: UIView!
    var horizontalLine: UIView!
    var confirmButton:UIButton!
    var titleLabel: UILabel!
    
    var topConstraint: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red: 1/255, green: 170/255, blue: 235/255,
                                            alpha: 1)
        assignbackground()
        let formViewHeight = 90
      
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGray.cgColor
        self.formView.backgroundColor = UIColor.white
        self.formView.layer.cornerRadius = 5
        self.view.addSubview(self.formView)
     
        self.formView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
         
            self.topConstraint = make.centerY.equalTo(self.view).offset(-formViewHeight).constraint
            make.height.equalTo(formViewHeight)
        }
        
    
        self.horizontalLine =  UIView()
        self.horizontalLine.backgroundColor = UIColor.lightGray
        self.formView.addSubview(self.horizontalLine)
        self.horizontalLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(self.formView)
        }
        
      
        let imgLock1 =  UIImageView(frame:CGRect(x: 11, y: 11, width: 22, height: 22))
        imgLock1.image = UIImage(named:"iconfont-user")
        
      
        let imgLock2 =  UIImageView(frame:CGRect(x: 11, y: 11, width: 22, height: 22))
        imgLock2.image = UIImage(named:"iconfont-password")
        
    
        self.txtUser = UITextField()
        self.txtUser.delegate = self
        self.txtUser.placeholder = "User Name"
        self.txtUser.tag = 100
        self.txtUser.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 44, height: 44))
        self.txtUser.leftViewMode = UITextField.ViewMode.always
        self.txtUser.returnKeyType = UIReturnKeyType.next
        
       
        self.txtUser.leftView!.addSubview(imgLock1)
        self.formView.addSubview(self.txtUser)
        
    
        self.txtUser.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(-formViewHeight/4)
        }
        
  
        self.txtPwd = UITextField()
        self.txtPwd.delegate = self
        self.txtPwd.placeholder = "Password"
        self.txtPwd.tag = 101
        self.txtPwd.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 44, height: 44))
        self.txtPwd.leftViewMode = UITextField.ViewMode.always
        self.txtPwd.returnKeyType = UIReturnKeyType.next
        
       
        self.txtPwd.leftView!.addSubview(imgLock2)
        self.formView.addSubview(self.txtPwd)
        
       
        self.txtPwd.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(formViewHeight/4)
        }
        
        
        self.confirmButton = UIButton()
        self.confirmButton.setTitle("Login", for: UIControl.State())
        self.confirmButton.setTitleColor(UIColor.black,
                                         for: UIControl.State())
        self.confirmButton.layer.cornerRadius = 5
//        self.confirmButton.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1,
//                                                     alpha: 0.5)
        self.confirmButton.addTarget(self, action: #selector(loginConfrim),
                                     for: .touchUpInside)
        self.view.addSubview(self.confirmButton)
        self.confirmButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.top.equalTo(self.formView.snp.bottom).offset(20)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
        
      
        self.titleLabel = UILabel()
        self.titleLabel.text = "smart solar trailer"
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.systemFont(ofSize: 36)
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.formView.snp.top).offset(-20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(44)
        }
    }
    
    func assignbackground(){
        let background = UIImage(named: "bg")
        
        var imageview : UIImageView!
        imageview = UIImageView(frame: view.bounds)
        imageview.contentMode =  UIView.ContentMode.scaleAspectFill
        imageview.clipsToBounds = true
        imageview.image = background
        imageview.center = view.center
        view.addSubview(imageview)
        self.view.sendSubviewToBack(imageview)
    }
    

    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.topConstraint?.update(offset: -125)
            self.view.layoutIfNeeded()
        })
    }
    
 
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        let tag = textField.tag
        switch tag {
        case 100:
            self.txtPwd.becomeFirstResponder()
        case 101:
            loginConfrim()
        default:
            print(textField.text!)
        }
        return true
    }
    

    @objc func loginConfrim(){
    
        self.view.endEditing(true)
      
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.topConstraint?.update(offset: 0)
            self.view.layoutIfNeeded()
        })
        
        // go to main if login successful
        
        print("login")
    }
}

