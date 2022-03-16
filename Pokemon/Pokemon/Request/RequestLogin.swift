//
//  RequestLogin.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit
import Alamofire

class RequestLogin: NSObject {
    
    func request(user: String, password: String, completion: @escaping (Bool) -> Void){
        
        let param = ["email" : user , "password" : password]
        
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/signin", method: .post, parameters: param, encoder: JSONParameterEncoder.default ).responseJSON { response in
            
            if response.response?.statusCode == 200 {
                
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
