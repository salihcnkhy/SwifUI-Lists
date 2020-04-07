//
//  Car.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 28.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import Foundation

enum CarOrigins : String ,CaseIterable{
        
    case European = "European"
    case Asian = "Asian"
    case American = "American"
    case Unknown = ""
    
    func getHeaderTitle()->String{
           return (self.rawValue + " Cars")
    }
}

extension CarOrigins : Codable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringForRawValues = try container.decode(String.self)
        
        switch stringForRawValues {
        case CarOrigins.American.rawValue:
            self = .American
            break
        case CarOrigins.Asian.rawValue:
            self = .Asian
            break
        case CarOrigins.European.rawValue:
            self = .European
        default:
            self = .Unknown
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .American:
            try container.encode(CarOrigins.American)
            break
        case .Asian:
            try container.encode(CarOrigins.Asian)
            break
        case .European:
            try container.encode(CarOrigins.European)
            break
            
        default:
            try container.encode(CarOrigins.Unknown)
        }
    }
    
}


struct Car : Identifiable, Codable {

    
    let id = UUID()
    let manufacturer : String
    let origin : CarOrigins
    let series : [CarSeries]?
    let logo : String?
    
    init(carManufacturer: String, carOrigin: CarOrigins, series: [CarSeries]? = nil, logo: String? = nil) {
          self.manufacturer = carManufacturer
          self.origin = carOrigin
          self.series = series
          self.logo = logo
      }
      
    
}

struct CarSeries : Codable{
    let seriesName : String
    let models : [CarModel]
    
}


struct CarModel : Codable {
    
    let name : String
    let description : String
    let year : String
    let image : String
    
}
