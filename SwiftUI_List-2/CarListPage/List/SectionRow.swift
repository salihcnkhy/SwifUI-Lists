//
//  SectionRow.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 28.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct SectionRow: View {
    
    let carData : Car
    
    var body: some View {
        
        NavigationLink(destination: CarManufacturerPage(car: carData)) {
                HStack{
                Spacer()
                Text(carData.manufacturer)
                Spacer()
            }
        }
        }
}

struct SectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SectionRow(carData: Car(carManufacturer: "Honda", carOrigin: .Asian))
    }
}
