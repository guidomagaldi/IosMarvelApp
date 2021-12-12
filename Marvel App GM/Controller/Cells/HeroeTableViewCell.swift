//
//  HeroesViewController.swift
//  Marvel App GM
//
//  Created by Guido Mola on 02/12/2021.
//

import UIKit

class HeroeTableViewCell: UITableViewCell{
    
    @IBOutlet weak var viewCell: UIView?
    @IBOutlet weak var heroeImage: UIImageView?
    @IBOutlet weak var heroeTitle: UILabel?
    @IBOutlet weak var movies: UILabel?
    @IBOutlet weak var heroeDescription: UILabel?
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell?.layer.cornerRadius = 8.0
        viewCell?.layer.shadowColor = UIColor.white.cgColor
        viewCell?.layer.shadowOffset = CGSize.zero
        viewCell?.layer.shadowOpacity = 1
        viewCell?.layer.shadowRadius = 8.0
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = UIColor.clear
        } else {
            contentView.backgroundColor = UIColor.clear
        }
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        
        heroeImage?.image = nil
        heroeTitle?.text = nil
        movies?.text = nil
        heroeDescription?.text = nil
        
    }
    
    
    func configureViews(heroe: Heroe) {
        heroeImage?.image = UIImage(named: heroe.image ?? "")
        heroeTitle?.text = heroe.name
        heroeDescription?.text = heroe.description
        movies?.text = "Películas: \(heroe.movies ?? 0)"
        
    }
        
    }
    
    
    

