//
//  PokemonLoginController.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit

class PokemonLoginController: NSObject {

    let request = RequestLogin()
    var withIdentifier = "nav"
    var alertControllerTitle = "Error"
    var alertControllerMessage = "Usuário Errado"
    var alertActionTitle = "OK"
    
    func requestControllerLogin(user: String, password: String, completion: @escaping (Bool) -> Void){
        
        request.request(user: user, password: password) { success in
            
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
