//
//  pokeViewCellCollectionViewCell.swift
//  PokeDex
//
//  Created by Chad Wollenberg on 4/28/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import UIKit

class pokeViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var pokemon: Pokemon!
    
  required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        name.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
}
