//
//  RegisterViewController.swift
//  TMProject
//
//  Created by puyang on 2018/5/30.
//  Copyright © 2018年 Frank. All rights reserved.
// https://lanhuapp.com/web/#/item/board/detail?image_id=f7fae8f3-0cc3-4558-b159-424150e78cad&project_id=c93349df-eb6b-4128-a810-f02b5c3fd06b&direct=true

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var codeTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var getCodeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册"
    }
    
    @IBAction func getCodeBtnClick(_ sender: UIButton) {
   
        getCodeBtn.isUserInteractionEnabled = false
        //http://ci.ccgmb.com/elevator/index.php?s_username=tlwfw&device=hi&mobi_num=13718809216&mod=User&s_username=tlwfw&way=verifi_mobi&clientid=iosApp_dev001&api_token=d9dd0cb2bfa99f3d47a79674cf3d436e
        
        if let phoneNumber = phoneTextfield.text {
            
            let alert = UIAlertController.init(title: "", message: "获取中...", preferredStyle: .alert)
            alert.show()
            
            //手机号验证（发送验证码）
            HTTP.GET("http://ci.ccgmb.com/elevator/index.php", parameters: ["s_username": "tlwfw", "device": "hi", "mobi_num": phoneNumber, "mod": "User", "way": "verifi_mobi", "clientid": "iosApp_dev001", "api_token": "d9dd0cb2bfa99f3d47a79674cf3d436e"]) { response in
                

                if let error = response.error {
                    print("got an error: \(error)")
                }
                
                print("statusCode: \(String(describing: response.statusCode))\n")
                print("headers: \(String(describing: response.headers))")
                print(response.description)
                
                alert.dismiss(animated: true, completion: {})
            
            }
            
        }
        
    }
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        
        if let phoneNumber = phoneTextfield.text, let password = passwordTextfield.text, let codeNumber = codeTextfield.text {
          
            let alert = UIAlertController.init(title: "", message: "注册中...", preferredStyle: .alert)
            alert.show()
            
            //http://ci.ccgmb.com/elevator/index.php?s_username=tlwfw&device=hi&mobi_num=13718809216&mod=User&s_username=tlwfw&way=register&code=737824&clientid=iosApp_dev001&api_token=d9dd0cb2bfa99f3d47a79674cf3d436e
            //用户输入验证码注册
            HTTP.GET("http://ci.ccgmb.com/elevator/index.php", parameters: ["s_username": "tlwfw", "device": "hi", "mobi_num": phoneNumber, "mod": "User", "way": "register", "code": codeNumber, "clientid": "iosApp_dev001", "api_token": "d9dd0cb2bfa99f3d47a79674cf3d436e"]) { response in
                
                
                if let error = response.error {
                    print("got an error: \(error)")
                }
                
                print("statusCode: \(String(describing: response.statusCode))\n")
                print("headers: \(String(describing: response.headers))")
                print(response.description)
                
            }
            
            //修改用户信息，包括用户注册类型、修改用户名密码等全部个人信息修改接口。注：暂时不支持修改手机号
            //http://ci.ccgmb.com/elevator/index.php?s_username=tlwfw&device=hi&mobi_num=13718809216&mod=User&s_username=tlwfw&way=change_userinfo&username=john&user_type=1&pwd=123456&clientid=iosApp_dev001&api_token=d9dd0cb2bfa99f3d47a79674cf3d436e
            HTTP.GET("http://ci.ccgmb.com/elevator/index.php", parameters: ["s_username": "tlwfw", "device": "hi", "mobi_num": phoneNumber, "mod": "User", "way": "change_userinfo",  "user_type": "1", "pwd": password, "clientid": "iosApp_dev001", "api_token": "d9dd0cb2bfa99f3d47a79674cf3d436e"]) { response in
                
                if let error = response.error {
                    print("got an error: \(error)")
                }
                
                print("statusCode: \(String(describing: response.statusCode))\n")
                print("headers: \(String(describing: response.headers))")
                print(response.description)

                DispatchQueue.main.async{
                    alert.dismiss(animated: true, completion: {})

                }
                sleep(1)
                
                DispatchQueue.main.async{
                  
//                    self.navigationController?.pushViewController(ChangeUserInfoVController(), animated: true)
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
            
            
        }
        
    }
    
    
    
    

}
