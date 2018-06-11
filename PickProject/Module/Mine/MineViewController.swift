//
//  MineViewController.swift
//  TMProject
//
//  Created by Frank on 2018/5/25.
//  Copyright © 2018年 Frank. All rights reserved.
//

import UIKit
import Alamofire

class MineViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("hello world blue", color: UIColor.blue)
        self.navBarBgAlpha = 0
    }

    @IBAction func registerBtnClick(_ sender: Any) {
        let registVC = RegisterViewController()
        self.navigationController?.pushViewController(registVC, animated: true)
    }
    
    @IBAction func loginBtnClick(_ sender: Any) {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func testHTTP() {
        //1.Alamofire
        request("https://httpbin.org/get").responseJSON { response in
            print(response, color: .green)
        }
        request("https://httpbin.org/post", method: .post, parameters: ["data": "Alamofire"], encoding: JSONEncoding.default).responseJSON { response in
            print(response, color: .red)
        }
        
        //2.SwiftHTTP
        HTTP.GET("https://httpbin.org/get") { response in
            print(response.text, color: .yellow)
        }
        HTTP.POST("https://httpbin.org/post", parameters: ["data": "SwiftHTTP"]) { response in
            print(response.text, color: .gray)
        }
        HTTP.GET("https://www.baidu.com/img/bd_logo1.png") { response in
            print(response.description, color: .orange)
        }
        
        //3.Networking
        Networking(baseURL: "https://httpbin.org").get("/get") { (response, error) in
            print(response)
        }
        Networking(baseURL: "https://httpbin.org").post("/post", parameters: ["data": "Networking"]) { (response, error) in
            print(response)
        }
        
        //4.ASIHTTPRequest
        ASIHTTPRequestClient.shared().getJSON("https://httpbin.org/get", params: nil, successBlock: { (request, JSON) in
            print(JSON)
        }) { (request, error) in
            print(error?.localizedDescription)
        }
        ASIHTTPRequestClient.shared().postJSON("https://httpbin.org/post", params: ["data": "ASIHTTPRequest"], successBlock: { (request, JSON) in
            print(JSON)
        }) { (request, error) in
            print(error?.localizedDescription)
        }
        ASIHTTPRequestClient.shared().postForm("https://httpbin.org/post", params: ["data": "ASIHTTPRequest"], successBlock: { (request, JSON) in
            print(JSON)
        }) { (request, error) in
            print(error?.localizedDescription)
        }
    }
}
