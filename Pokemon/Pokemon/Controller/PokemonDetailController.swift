//
//  PokemonDetailController.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit

class PokemonDetailController: NSObject {

    let request = RequestList()
    
    private var pokemonDetail: PokemonDetail?
    private var pokemonResult: Result?
    var nibName = "CustomCellListPokemonTableViewCell"
    var forCellReuseIdentifier = "cellList"
    var withIdentifier = "cellList"
    var alertControllerTitle = "Error"
    var alertMessage = "Request Fail"
    var alertActionTitle = "OK"
    
    var urlResult: String{
        return pokemonResult?.url ?? ""
    }
    
    var name: String{
        return pokemonDetail?.name ?? ""
    }
    
    var urlImage: URL?{
        return URL(string: pokemonDetail?.sprites?.frontDefault ?? "")
    }
    
    func setPokemonResult(pokemonResult: Result?) {
        self.pokemonResult = pokemonResult
    }
    
    func setPokemonDetail(pokemonDetail: PokemonDetail?){
        self.pokemonDetail = pokemonDetail
    }
    
    var numberOfRowsInSectionGameIndex: Int {
        return pokemonDetail?.gameIndices?.count ?? 0
    }
    
    var numberOfRowsInSectionAbility: Int {
        return pokemonDetail?.abilities?.count ?? 0
    }
    
    func cellForRowAbility(indexPath: IndexPath) -> Ability?{
        return pokemonDetail?.abilities?[indexPath.row]
    }
    
    func cellForRowGameIndex(indexPath: IndexPath) -> GameIndex?{
        return pokemonDetail?.gameIndices?[indexPath.row]
    }
        
    func requestController(url: String, completion: @escaping (Bool) -> Void){
        
        request.requestDetail(url: url) { [weak self] pokemonDetail, success in
            
            if success {
                self?.pokemonDetail = pokemonDetail
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
