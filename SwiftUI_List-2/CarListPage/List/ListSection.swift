//
//  ListSection.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 28.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct ListSection: View {
    
    let carData : (carList : [Car] , origin : CarOrigins)
    
    
    var body: some View {
        
        Section(header: createHeader()) {
            
            ForEach(carData.carList, id: \.id) { car in
                SectionRow(carData: car)
            }
            
        }
        
    }
    
    func createHeader() -> AnyView {
        
        return AnyView(HStack{
            Spacer()
            Image(systemName: "star.fill")
            Text(carData.origin.getHeaderTitle())
            Spacer()
        })
        
    }
    
}

