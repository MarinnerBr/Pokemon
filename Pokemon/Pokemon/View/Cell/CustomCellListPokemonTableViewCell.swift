//
//  CustomCellListPokemonTableViewCell.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit

class CustomCellListPokemonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myCellNamePokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(result: Result?){
        myCellNamePokemon.text = result?.name ?? ""
    }
    
    func setupCellGameIndex(gameIndex: GameIndex?){
        myCellNamePokemon.text = gameIndex?.version?.name ?? ""
    }
    
    func setupCellAbility(ability: Ability?){
        myCellNamePokemon.text = ability?.ability?.name ?? ""
    }
}
