//
//  Filmler.swift
//  UsingCollectionView
//
//  Created by Furkan Erzurumlu on 9.03.2022.
//

import Foundation

class Filmler{
    
    var filmID:Int?
    var filmName:String?
    var filmImageName:String?
    var filmYonetmen:String?
    var filmPrice:Double?
    
    
    init(){
        
    }
    
    init(filmID:Int,filmName:String,filmImageName:String,filmYonetmen:String,filmPrice:Double){
        self.filmID = filmID
        self.filmName = filmName
        self.filmImageName = filmImageName
        self.filmYonetmen = filmYonetmen
        self.filmPrice = filmPrice
    }
    
}
