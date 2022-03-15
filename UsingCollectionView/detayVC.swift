//
//  detayVC.swift
//  UsingCollectionView
//
//  Created by Furkan Erzurumlu on 9.03.2022.
//

import UIKit

class detayVC: UIViewController {
    
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmPrice: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmYonetmenLabel: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            filmNameLabel.text = f.filmName
            filmYonetmenLabel.text = f.filmYonetmen
            filmImageView.image = UIImage(named: f.filmImageName!)
            filmPrice.text = "\(f.filmPrice!)"
            
        }
       
    }
    
    @IBAction func addButton(_ sender: Any) {
        if let f = film{
            print("\(f.filmName!) \(String(describing: f.filmPrice)) ₺ fiyatla sepete eklendi")
        }
    }
    

}
