//
//  CharacterView.swift
//  Marvel App GM
//
//  Created by Guido Mola on 06/12/2021.
//

import Foundation
import UIKit

class CharacterViewController:UIViewController{
    
    @IBOutlet weak var charFirstBox: UIView?
    @IBOutlet weak var heroeCharImage: UIImageView?
    @IBOutlet weak var heroeTitle: UILabel?
    @IBOutlet weak var movies: UILabel?
    @IBOutlet weak var heroeDescription: UILabel?
    

    var heroe: Heroe?
    var villain: Villain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateView()
    }
    
    private func updateView(){
        
        heroeCharImage?.image = UIImage(named: (heroe?.charImage ?? villain?.charImage) ?? "")
        heroeTitle?.text = heroe?.name ?? villain?.name
        heroeDescription?.text = heroe?.description ?? villain?.Description
        movies?.text = "Movies: \(heroe?.movies ?? villain?.movies ?? 0)"
        
        
        charFirstBox?.layer.cornerRadius = 8.0
        charFirstBox?.layer.shadowColor = UIColor.white.cgColor
        charFirstBox?.layer.shadowOffset = CGSize.zero
        charFirstBox?.layer.shadowOpacity = 1
        charFirstBox?.layer.shadowRadius = 8.0
        
        
    }
    
}


