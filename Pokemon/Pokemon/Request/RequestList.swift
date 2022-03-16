//
//  RequestList.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit
import Alamofire

class RequestList: NSObject {

    func requestLogin(completion: @escaping (PokemonList?,Bool) -> Void){
        
        let param = ["limit":"151"]
        
        AF.request("https://pokeapi.co/api/v2/pokemon/", method: .get, parameters: param).responseJSON { response in
           
            if response.response?.statusCode == 200 {
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonList.self, from: response.data ?? Data())
                    
                    completion(pokemonList,true)
                } catch {
                    completion(nil,false)
                }
            } else {
                completion(nil,false)
            }
        }
    }
    
    func requestDetail(url: String, completion: @escaping (PokemonDetail?,Bool) -> Void){
        
        AF.request(url, method: .get).responseJSON { response in
            
            if response.response?.statusCode == 200 {
                do {
                    let pokemonDetail = try JSONDecoder().decode(PokemonDetail.self, from: response.data ?? Data())
                    
                    completion(pokemonDetail,true)
                } catch {
                    completion(nil,false)
                }
            } else {
                completion(nil,false)
            }
        }
    }
}
