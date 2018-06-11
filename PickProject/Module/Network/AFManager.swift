//
//  AFManager.swift
//  FreseniusDoctors
//
//  Created by 张典 on 6/9/5.
//

import UIKit
import Alamofire
import Foundation

class AFManager: NSObject {
    
    static let shareAFManager = AFManager()

    let headers = [
        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
        "Accept": "application/json"
    ]
    
    private let manager:  SessionManager = {
        let manager =  SessionManager.default
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential.init(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
        return manager
    }()

    

    
    func GET(_ URLString : String, params : [String : AnyObject]?, Success:@escaping (_ result: AnyObject )->Void, failure:@escaping (_ failure: String  )->Void ) -> DataRequest {
       let task = manager.request(URLString, method: .get, parameters: params,encoding: JSONEncoding.default,headers:headers).responseJSON { (response) in
            guard response.result.isSuccess else {
                failure("网络错误")
                return
            }
            if let value = response.result.value {
                let dic : AnyObject = value as AnyObject
                Success(dic)
            }
        }
        return task
    }
    
    func POST(_ URLString : String, params : [String : AnyObject]?, Success:@escaping (_ result: AnyObject )->Void, failure:@escaping (_ failure: String  )->Void){
        manager.request(URLString, method: .post, parameters: params,encoding: JSONEncoding.default,headers:headers).responseJSON { (response) in
            guard response.result.isSuccess else {
                failure("网络错误")
                return
            }
            if let value = response.result.value {
                let dic : AnyObject = value as AnyObject
                Success(dic)
                
            }
        }
    }
    
    func PUT(_ URLString : String, params : [String : AnyObject]?, Success:@escaping (_ result: AnyObject)->Void, failure:@escaping (_ failure: String  )->Void){
        manager.request(URLString, method: .put, parameters: params,encoding: JSONEncoding.default,headers:headers).responseJSON { (response) in
            guard response.result.isSuccess else {
                failure("网络错误")
                return
            }
            if let value = response.result.value {
                let dic : AnyObject = value as AnyObject
                Success(dic)
            }
        }
    }
    
    
    func DELETE(_ URLString : String, params : [String : AnyObject]?, Success:@escaping (_ result: AnyObject)->Void, failure:@escaping (_ failure: String  )->Void){
        manager.request(URLString, method: .delete, parameters: params,encoding: JSONEncoding.default,headers:headers).responseJSON { (response) in
            guard response.result.isSuccess else {
                failure("网络错误")
                return
            }
            if let value = response.result.value {
                let dic : AnyObject = value as AnyObject
                Success(dic)
            }
        }
    }
    

    

    

    
}
