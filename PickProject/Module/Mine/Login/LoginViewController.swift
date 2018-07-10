//
//  LoginViewController.swift
//  TMProject
//
//  Created by puyang on 2018/5/29.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var _phoneTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        self.title = "登录"
        
        _phoneTextField.text = "lance"
        passwordTextField.text = "111111"
    
    }

    @IBAction func RegisterBtnClick(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
        
    }
    
    @IBAction func LoginBtnClick(_ sender: Any) {
        
        let alert = UIAlertController.init(title: "", message: "登录中", preferredStyle: .alert)
        alert.show()
        
        if let phoneNumber = _phoneTextField.text, let password = passwordTextField.text{
            
            HTTP.POST("http://ci.ccgmb.com/elevator/index.php", parameters: ["mod": "User", "way": "login", "clientid": "iosApp_dev001", "api_token": "d9dd0cb2bfa99f3d47a79674cf3d436e", "deviceid": "this_is_a_false_deviceid", "username": phoneNumber, "pwd": password]) { response in
                
                if let error = response.error {
                    print("got an error: \(error)")
//                    return
                }
                
                print("statusCode: \(String(describing: response.statusCode))\n")
                print("headers: \(String(describing: response.headers))")
                print(response.description)
                
                alert.dismiss(animated: true, completion: {
                  
                    DispatchQueue.main.async{
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    
                })
                
                
            }
            
        }
 
        
    }
    
    func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
        if(!JSONSerialization.isValidJSONObject(jsonDic)) {
            print("is not a valid json object")
            return nil
        }
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        let str = String(data:data!, encoding: String.Encoding.utf8)
        print("Json Str:\(str!)")
        return data
    
    }
    
    func dataToDictionary(data:Data) ->Dictionary<String, Any>?{
    
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
   
            let dic = json as! Dictionary<String, Any>
            return dic
            
        }catch _ {
            print("失败")
            return nil
        }
    
    }
    
}


    
