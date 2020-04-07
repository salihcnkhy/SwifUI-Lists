//
//  AddCarPage.swift
//  SwiftUI_List-2
//
//  Created by Gülnur Kasarcı on 30.03.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct AddCarPage: View {
    
    @Binding var carList : [Car]
    
    @State var carManufacturer : String = ""
    @State var carOrigin = CarOrigins.European
    @State var isShowing = false
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body: some View {
        Form{
            TextField("Araba Üreticisi", text: $carManufacturer)
            Picker(selection: $carOrigin, label: Text("Araba Kökeni"), content: {
                ForEach(CarOrigins.allCases , id: \.self){
                    origin in
                    Text(origin.getHeaderTitle())
                }
            })
            createSaveButton().alert(isPresented: $isShowing) { () -> Alert in
                createAlert()
                
            }
            
        }
        
    }
    
    func createAlert() -> Alert {
        
        return Alert(title: Text("Eklendi"), message: Text("Başarılı şekilde araba eklendi!"), dismissButton: .default(Text("Tamam"),action: {
            
            self.presentationMode.wrappedValue.dismiss()
        }))
        
    }
    
    func createSaveButton() -> AnyView {
        
        return AnyView(HStack {
            Spacer()
            Button(action: saveButtonAction, label: {
                Text("Kaydet")
            })
            Spacer()
        })
        
    }
    
    func saveButtonAction(){
        
        if !carManufacturer.elementsEqual(""){
            carList.append(Car(carManufacturer: carManufacturer, carOrigin: carOrigin))
            self.isShowing = true
        }
        
    }
}
