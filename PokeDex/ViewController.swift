//
//  ViewController.swift
//  PokeDex
//
//  Created by Chad Wollenberg on 4/28/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        parsePokemonCSV()
    }
        func parsePokemonCSV() {
            let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
            
            do {
                let csv = try CSV(contentsOfURL: path)
                let rows = csv.rows
                
                for row in rows {
                    let pokeID = Int(row["id"]!)!
                    let name = row["identifier"]!
                    let poke = Pokemon(name: name, pokedexID: pokeID)
                    pokemon.append(poke)
                }
                
                print(rows)
            }catch let err as NSError {
                print(err.debugDescription)
            }
        }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokeViewCell", forIndexPath: indexPath) as? pokeViewCell {
            
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(100, 100)
    }

}

// stopping place - part 7 5:36