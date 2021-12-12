//
//  VillainsViewController.swift
//  Marvel App GM
//
//  Created by Guido Mola on 09/12/2021.
//

import Foundation
import UIKit

class VillainsViewController:UIViewController{

    
    
    @IBOutlet var villainTableView: UITableView?
    
    let villianData = ListOfVillains()
    var villains: [Villain] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        villains.append(contentsOf: villianData.villianData)
        print(villains)
        
        villainTableView?.dataSource = self
        villainTableView?.delegate = self
        
    }
}

extension VillainsViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        villains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VillainTableViewCell",
                                                       for: indexPath) as? VillainTableViewCell else { return UITableViewCell() }
        
        if villains.count > indexPath.row {
            let villain = villains[indexPath.row]
            
            cell.configureViews(villain: villain)
        }
        
        print ("Cell Position: \(indexPath.row)")
        
        return cell
    }
    
    
}


extension VillainsViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if villains.count > indexPath.row {
            let villain = villains[indexPath.row]
            print("Nombre del superHeroe pulsado: \(villain.name ?? "Sin nombre")")
            
            let storyboardCharacter = UIStoryboard(name: "Character",
                                                   bundle: nil)
            if let destination = storyboardCharacter.instantiateInitialViewController() as? CharacterViewController {
                //ahora puedo acceder a la clase de CharacterViewController
                destination.villain = villain
                self.navigationController?.pushViewController(destination,
                                                              animated: true)
            }
        }
        print("celda pulsada \(indexPath.row)")
    }
}
