//
//  VillainTableViewCell.swift
//  Marvel App GM
//
//  Created by Guido Mola on 09/12/2021.
//

import Foundation
import UIKit

class VillainTableViewCell:UITableViewCell{
    
    @IBOutlet weak var viewCell: UIView?
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainDescription: UILabel!
    @IBOutlet weak var villainMovies: UILabel!
    @IBOutlet weak var villainTitle: UILabel!
    
   
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell?.layer.cornerRadius = 8.0
        viewCell?.layer.shadowColor = UIColor.white.cgColor
        viewCell?.layer.shadowOffset = CGSize.zero
        viewCell?.layer.shadowOpacity = 1
        viewCell?.layer.shadowRadius = 8.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        villainImage?.image = nil
        villainDescription?.text = nil
        villainMovies?.text = nil
        villainTitle?.text = nil
    }
    
    func configureViews(villain: Villain){
        
        villainImage?.image = UIImage(named: villain.image ?? "")
        villainDescription?.text = villain.Description
        villainMovies?.text = "Películas: \(String(villain.movies ?? 0))"
        villainTitle?.text = villain.name
        
        
    }

    
    
}
