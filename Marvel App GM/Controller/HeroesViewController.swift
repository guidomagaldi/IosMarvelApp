//
//  ViewController.swift
//  Marvel App GM
//
//  Created by Guido Mola on 01/12/2021.
//

import UIKit

class HeroesViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView?
    
    private let listOfHeroes = ListOfHeroes()
    private var heroes = [Heroe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroes.append(contentsOf: listOfHeroes.heroesRepository)
        print(heroes)
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        // Do any additional setup after loading the view.
    }
}



extension HeroesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeTableViewCell",
                                                       for: indexPath) as? HeroeTableViewCell else { return UITableViewCell() }
        
        if heroes.count > indexPath.row {
            let heroe = heroes[indexPath.row]
            
            cell.configureViews(heroe: heroe)
        }
        
        
        print ("Cell Position: \(indexPath.row)")
       
        return cell
    }


}

extension HeroesViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if heroes.count > indexPath.row {
            let heroe = heroes[indexPath.row]
            print("Nombre del superHeroe pulsado: \(heroe.name ?? "Sin nombre")")
            
            let storyboardCharacter = UIStoryboard(name: "Character",
                                              bundle: nil)
            if let destination = storyboardCharacter.instantiateInitialViewController() as? CharacterViewController {
               //ahora puedo acceder a la clase de CharacterViewController
                destination.heroe = heroe
                self.navigationController?.pushViewController(destination,
                                                               animated: true)
            }
        }
        print("celda pulsada \(indexPath.row)")
    }
}
