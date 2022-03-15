//
//  ViewController.swift
//  UsingCollectionView
//
//  Created by Furkan Erzurumlu on 9.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filmsCollectionView: UICollectionView!
    
    var FilmsList = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmsCollectionView.delegate = self
        filmsCollectionView.dataSource = self
        
        // Do any additiona after loading the view.
        let f1 = Filmler(filmID: 1, filmName: "Django", filmImageName: "django", filmYonetmen: "Quentin Tarantino", filmPrice: 15.99)
        let f2 = Filmler(filmID: 2, filmName: "Inception", filmImageName: "inception", filmYonetmen: "Christopher Nolan", filmPrice: 13.99)
        let f3 = Filmler(filmID: 3, filmName: "Interstellar", filmImageName: "interstellar", filmYonetmen: "Christopher Nolan", filmPrice: 18.99)
        let f4 = Filmler(filmID: 4, filmName: "Anadoluda", filmImageName: "anadoluda", filmYonetmen: "Nuri Bilge Ceylan", filmPrice: 8.99)
        let f5 = Filmler(filmID: 5, filmName: "The Hateful Eight", filmImageName: "thehatefuleight", filmYonetmen: "Quentin Tarantino", filmPrice: 14.99)
        let f6 = Filmler(filmID: 6, filmName: "The Pianist", filmImageName: "thepianist", filmYonetmen: "Roman Polonski", filmPrice: 10.99)
        
        FilmsList.append(f1)
        FilmsList.append(f2)
        FilmsList.append(f3)
        FilmsList.append(f4)
        FilmsList.append(f5)
        FilmsList.append(f6)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        
        let genislik = filmsCollectionView.frame.size.width
        let hucreGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.7)
        filmsCollectionView!.collectionViewLayout = tasarim
        
    }

}
 
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,HucreProtocol{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = FilmsList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmsCollectionViewCell
        cell.filmImageView.image = UIImage(named: film.filmImageName!)
        cell.filmNameLabel.text = film.filmName
        cell.filmPriceLabel.text = "\(film.filmPrice!) ₺"
        
        cell.layer.borderColor = UIColor.systemIndigo.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilmsList.count
    }
    func sepeteEkleTıkla(indexPath: IndexPath) {
        let film = FilmsList[indexPath.row]
        print("\(film.filmName!) sepete eklendi")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = FilmsList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let film = sender as? Filmler
            let gidilecekVC = segue.destination as! detayVC
            gidilecekVC.film = film
        }
    }
}
