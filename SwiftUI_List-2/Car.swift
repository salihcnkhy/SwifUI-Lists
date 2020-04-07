//
//  Car.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 28.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import Foundation

enum CarOrigins : CaseIterable{
        
    case European
    case Asian
    case American
    
    
    func getHeaderTitle()->String{
        
        var title = "Unknown Car Origins"
        
        switch self {
        case .Asian:
            title = "Asian Cars"
            break
            
        case .American:
            title = "American Cars"
            break
            
        case .European:
            title = "European Cars"
            break
        }
        
        return title
        
    }
}


struct Car : Identifiable {
    
    let id = UUID()
    let carManufacturer : String
    let carOrigin : CarOrigins
    
}
