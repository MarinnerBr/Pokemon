//
//  PokemonDetailViewController.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import UIKit
import SDWebImage

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var myImagePokemon: UIImageView!
    @IBOutlet weak var myNamePokemon: UILabel!
    @IBOutlet weak var myTableView1: UITableView!
    @IBOutlet weak var myTableview2: UITableView!
    
    let controllerDetail = PokemonDetailController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupUI()
        setupRequestDetail()
    }
    
    func setupTableView(){
       
        self.myTableView1.dataSource = self
        self.myTableview2.dataSource = self
        
        self.myTableView1.register(UINib(nibName: controllerDetail.nibName, bundle: nil), forCellReuseIdentifier: controllerDetail.forCellReuseIdentifier)
        
        self.myTableview2.register(UINib(nibName: controllerDetail.nibName, bundle: nil), forCellReuseIdentifier: controllerDetail.forCellReuseIdentifier)
    }
    
    func setupUI(){
        
        myTableView1.reloadData()
        myTableview2.reloadData()
        
        myNamePokemon.text = controllerDetail.name
        myImagePokemon.sd_setImage(with: controllerDetail.urlImage, completed: nil)
    }
    
    func setupRequestDetail(){
        
        controllerDetail.requestController(url: controllerDetail.urlResult) { [weak self] succes in
            
            if succes {
                self?.setupUI()
            } else {
                self?.shwErrorMessage()
            }
        }
    }
    
    func shwErrorMessage(){
        
        let alert = UIAlertController(title: controllerDetail.alertControllerTitle, message: controllerDetail.alertMessage, preferredStyle: .alert)
        
        let buttonOk = UIAlertAction(title: controllerDetail.alertActionTitle, style: .destructive, handler: nil)
        
        alert.addAction(buttonOk)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PokemonDetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == myTableView1 {
            
            return controllerDetail.numberOfRowsInSectionGameIndex
        } else {
            return controllerDetail.numberOfRowsInSectionAbility
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == myTableView1 {
            
            let cell = self.myTableView1.dequeueReusableCell(withIdentifier: controllerDetail.withIdentifier, for: indexPath) as? CustomCellListPokemonTableViewCell
            
            cell?.setupCellGameIndex(gameIndex: controllerDetail.cellForRowGameIndex(indexPath: indexPath))
            return cell ?? UITableViewCell()
            
        } else {
            
            let cell = self.myTableview2.dequeueReusableCell(withIdentifier: controllerDetail.withIdentifier, for: indexPath) as? CustomCellListPokemonTableViewCell
            
            cell?.setupCellAbility(ability: controllerDetail.cellForRowAbility(indexPath: indexPath))
            return cell ?? UITableViewCell()
        }
    }
}
