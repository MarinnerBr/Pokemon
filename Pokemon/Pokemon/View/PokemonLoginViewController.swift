//
//  PokemonLoginViewController.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//
import UIKit

class PokemonLoginViewController: UIViewController {
    
    @IBOutlet weak var myTextUser: UITextField!
    @IBOutlet weak var myTextPassword: UITextField!
    
    let controllerLogin = PokemonLoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func myButtonLogin(_ sender: Any) {
        
        setupRequest()
    }
    
    func setupRequest(){
        
        let user = myTextUser.text ?? ""
        let password = myTextPassword.text ?? ""
        
        controllerLogin.requestControllerLogin(user: user, password: password) {  [weak self] success in
            
            if success {
                self?.goToListpokemon()
            } else {
                self?.showErrorMessage()
            }
        }
    }
    
    func goToListpokemon(){
        
        let pokemonlist = self.storyboard?.instantiateViewController(withIdentifier: controllerLogin.withIdentifier)
        
        if let pokemonlist = pokemonlist {
            
            pokemonlist.modalTransitionStyle = .flipHorizontal
            pokemonlist.modalPresentationStyle = .fullScreen
            self.present(pokemonlist, animated: true, completion: nil)
        }
    }
    
    func showErrorMessage(){
        
        let alert = UIAlertController(title: controllerLogin.alertControllerTitle, message: controllerLogin.alertControllerMessage, preferredStyle: .alert)
        
        let buttonOk = UIAlertAction(title: controllerLogin.alertActionTitle, style: .destructive) { alert in
            
            self.myTextUser.text = ""
            self.myTextPassword.text = ""
        }
        
        alert.addAction(buttonOk)
        self.present(alert, animated: true, completion: nil)
    }
}


