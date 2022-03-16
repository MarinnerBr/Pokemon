//
//  PokemonListViewController.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    let controllerList = PokemonlistController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
        setupRequest()
    }
    
    func setupTableView(){
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: controllerList.nibName, bundle: nil), forCellReuseIdentifier: controllerList.forCellReuseIdentifier)
    }
    
    func setupRequest(){
        
        controllerList.requestController { [weak self] success in
            
            if success {
                self?.myTableView.reloadData()
            } else {
                self?.showErrorMessage()
            }
        }
    }
    
    func showErrorMessage(){
        
        let alert = UIAlertController(title: controllerList.alertControllerTitle, message: controllerList.alertMessage, preferredStyle: .alert)
       
        let buttonok = UIAlertAction(title: controllerList.alertActionTitle, style: .destructive, handler: nil)

        alert.addAction(buttonok)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return controllerList.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: controllerList.withIdentifier, for: indexPath) as? CustomCellListPokemonTableViewCell
        
        if let cell = cell {
            
            cell.setupCell(result: controllerList.dequeueReusableCell(indexPath: indexPath))
        }
        
        return  cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pokDetail = self.storyboard?.instantiateViewController(withIdentifier: "detail") as? PokemonDetailViewController
        
        if let pokDetail = pokDetail {
            pokDetail.controllerDetail.setPokemonResult(pokemonResult: controllerList.dequeueReusableCell(indexPath: indexPath))
            
        self.present(pokDetail, animated: true, completion: nil)
        }
    }
}
