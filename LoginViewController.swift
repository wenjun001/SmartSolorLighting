//
//  LoginViewController.swift
//  BottomNavigationController
//
//  Created by xiu on 1/25/19.
//  Copyright © 2019 CosmicMind. All rights reserved.
//

import UIKit
import Material
import SnapKit
class LoginViewController: UIViewController {
    
    fileprivate var emailField: ErrorTextField!
    fileprivate var passwordField: TextField!
    
    /// A constant to layout the textFields.
    fileprivate let constant: CGFloat = 32
    var topConstraint: Constraint? 
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = Color.grey.lighten5
        self.view.backgroundColor = UIColor(red: 1/255, green: 170/255, blue: 235/255,
                                            alpha: 1)
        preparePasswordField()
        prepareEmailField()
        
        prepareLoginButton()
        prepareSignButton()
        //prepareResignResponderButton()
    }
    
    func prepareLoginButton(){
        
        let button = RaisedButton(title: "login")
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
           //make.center.equalTo(view)
            make.bottom.equalTo(view).offset(-350)
            make.left.equalTo(view).offset(100)
        }
        
         button.addTarget(self, action: #selector(handleLoginResponderButton(button:)), for: .touchUpInside)
        
        
    }
    
    @objc
    internal func handleLoginResponderButton(button: UIButton) {
        // login and navigate to main page
        print("login")
        
    }
    
    func prepareSignButton(){
        
        let button = RaisedButton(title: "sign")
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.center.equalTo(view)
            make.bottom.equalTo(view).offset(-350)
            make.left.equalTo(view).offset(200)
//
//            make.left.equalTo(15)
//            make.right.equalTo(-15)
//
//            self.topConstraint = make.centerY.equalTo(self.view).constraint
          
        }
        
        
    }
    

    
    /// Prepares the resign responder button.
    fileprivate func prepareResignResponderButton() {
        let btn = RaisedButton(title: "Resign", titleColor: Color.blue.base)
        btn.addTarget(self, action: #selector(handleResignResponderButton(button:)), for: .touchUpInside)
        
        view.layout(btn).width(100).height(constant).top(100).right(20)
        
        
        
    }
    
    /// Handle the resign responder button.
    @objc
    internal func handleResignResponderButton(button: UIButton) {
        emailField?.resignFirstResponder()
        passwordField?.resignFirstResponder()
    }
}

extension LoginViewController {
    fileprivate func prepareEmailField() {
        emailField = ErrorTextField()
        emailField.placeholder = "Email"
        emailField.detail = "your sign email"
        emailField.isClearIconButtonEnabled = true
        //emailField.delegate = self
        emailField.isPlaceholderUppercasedWhenEditing = true
        emailField.placeholderAnimation = .hidden
        
        // Set the colors for the emailField, different from the defaults.
        emailField.placeholderNormalColor = Color.amber.darken4
        emailField.placeholderActiveColor = Color.pink.base
        emailField.dividerNormalColor = Color.cyan.base
        emailField.dividerActiveColor = Color.green.base
        
        // Set the text inset
        //        emailField.textInset = 20
        
//        let leftView = UIImageView()
//        leftView.image = Icon.cm.audio
//        emailField.leftView = leftView
//
//        view.layout(emailField).center(offsetY: -passwordField.bounds.height - 60).left(20).right(20)
//
        view.addSubview(emailField)
        emailField.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            //make.center.equalTo(view)
            make.bottom.equalTo(view).offset(-600)
            make.left.equalTo(view).offset(100)
        }
        
    }
    
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Password"
        passwordField.detail = "At least 8 characters"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        
        // Setting the visibilityIconButton color.
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        
//        view.layout(passwordField).center().left(20).right(20)
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            //make.center.equalTo(view)
            make.bottom.equalTo(view).offset(-500)
            make.left.equalTo(view).offset(100)
        }
        
        
        
    }
}


extension LoginViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}

