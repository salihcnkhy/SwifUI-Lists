//
//  FetchCar.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 7.04.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import Foundation


class FetchCar : ObservableObject {
    
    @Published var cars = [Car]()
    
    let jsonString = """
[
  
  {
    "manufacturer" : "BMW",
    "origin" : "European",
    "logo" : "https://img.favpng.com/11/9/4/bmw-z4-car-logo-mini-cooper-png-favpng-QDN7t7qqsZfqV1bDE8t4dkZYG.jpg",
    "series" : [
        {
         "seriesName" : "3",
         "models" : [
            {
              "name" : "316d",
              "year" : "2018",
              "description" : "fast car",
              "image" : "https://www.otvhesapla.com/wp-content/uploads/2018/06/BMW-316i-Sedan-ozellikleri-739x410.jpg"
              
            },
             {
              "name" : "320i",
              "year" : "2018",
              "description" : "very fast car",
              "image" : "https://www.otokokpit.com/wp-content/uploads/2018/10/yeni-kasa-bmw-3-serisi-g20-2.jpg"
              
            }
           
           ]
        }
      ]
  },
  {
    "manufacturer" : "Honda",
    "origin" : "Asian",
    "logo" : "https://www.pikpng.com/pngl/m/126-1262045_honda-download-png-honda-logo-transparent-background-clipart.png",
    "series" : [
        {
         "seriesName" : "3",
         "models" : [
            {
              "name" : "316d",
              "year" : "2020",
              "description" : "fast car",
              "image" : ""
              
            }
           
           ]
        },
        {
         "seriesName" : "3",
         "models" : [
            {
              "name" : "320i",
              "year" : "2020",
              "description" : "very fast car",
              "image" : ""
              
            }
           ]
        }
      ]
  }
]
"""
    
    init() {
        
        let jsonData = Data(jsonString.utf8)
        
        do {
           let decodedData = try JSONDecoder().decode([Car].self, from : jsonData)
            self.cars = decodedData
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
}
