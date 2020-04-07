//
//  CarManufacturerPage.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 30.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct CarManufacturerPage: View {
    
    var car : Car
    
    var body: some View {
        Text(car.manufacturer)
    }
}

