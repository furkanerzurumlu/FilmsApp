//
//  FilmsCollectionViewCell.swift
//  UsingCollectionView
//
//  Created by Furkan Erzurumlu on 9.03.2022.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTıkla(indexPath:IndexPath)
}

class FilmsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmPriceLabel: UILabel!
    @IBOutlet weak var filmNameLabel: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    @IBAction func filmAddButton(_ sender: Any) {
        hucreProtocol?.sepeteEkleTıkla(indexPath: indexPath!)
        
    }
    
}
