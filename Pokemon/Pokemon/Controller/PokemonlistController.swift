//
//  PokemonlistController.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit

class PokemonlistController: NSObject {

    let request = RequestList()
    var pokemonList: PokemonList?
    var nibName = "CustomCellListPokemonTableViewCell"
    var forCellReuseIdentifier = "cellList"
    var alertControllerTitle = "Error"
    var alertMessage = "Request Fail"
    var alertActionTitle = "OK"
    var withIdentifier = "cellList"
    
    var numberOfRowsInSection: Int {
        return pokemonList?.results?.count ?? 0
    }
    
    func dequeueReusableCell(indexPath: IndexPath) -> Result? {
        return pokemonList?.results?[indexPath.row]
    }
    
    func requestController(completion: @escaping(Bool) ->Void){
        
        request.requestLogin { [weak self] pokemonList, success in
            if success {
                self?.pokemonList = pokemonList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
