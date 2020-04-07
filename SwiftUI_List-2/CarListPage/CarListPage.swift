//
//  CarListPage.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 28.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct CarListPage: View {
    
    @State var carList : [Car] = FetchCar().cars

    var body: some View {
 
        NavigationView{
            
            List{
                ForEach(CarOrigins.allCases, id: \.self){ type in
                  self.createSectionIfCan(type : type)
              }
                }.navigationBarTitle("Cars").navigationBarItems(trailing: createAddButton())
        }
        
    }
    
    func createAddButton() -> AnyView {
        
        return AnyView(NavigationLink(destination: AddCarPage(carList: self.$carList), label: {
            Image(systemName: "plus").imageScale(.large)
        }))
    }

    
    func carFilter(type : CarOrigins) -> [Car]{
        return carList.filter{ (car) -> Bool in
            car.origin == type
        }
    }
    
    func createSectionIfCan(type : CarOrigins) -> AnyView {
        
        let filteredCars = carFilter(type : type)
        
        return filteredCars.count != 0 ? AnyView(ListSection(carData : (filteredCars,type))) : AnyView(EmptyView())
        
    }

}

struct CarListPage_Previews: PreviewProvider {
    static var previews: some View {
        CarListPage()
    }
}
