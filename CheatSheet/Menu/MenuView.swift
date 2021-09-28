//
//  MenuView.swift
//  CheatSheet
//
//  Created by Kubilay on 27.09.2021.
//

import SwiftUI

struct MenuView: View {
    @Namespace var animation
    
    @State var currentTab = "Converter"
    
    
    var body: some View {
        VStack {
            HStack {
                TabButton(title: "Converter", currentTab: $currentTab, animation: animation)
                
                TabButton(title: "Color Picker", currentTab: $currentTab, animation: animation)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Divider().padding(.top, 4)
            
            if currentTab == "Color Picker" {
                ColorPickerPage()
            }
            
            if currentTab == "Converter" {
                Converter()
            }
            
            Spacer(minLength: 0)
        }
        .frame(width: 300, height: 350)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
