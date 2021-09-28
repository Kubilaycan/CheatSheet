//
//  ColorPicker.swift
//  CheatSheet
//
//  Created by Kubilay on 27.09.2021.
//

import SwiftUI

struct ColorPickerPage: View {
    
    @State private var pickedColor = Color.white
    @State private var hexColor = "FFFFFF"
    
    var body: some View {
        Circle()
            .foregroundColor(pickedColor)
            .frame(width: 100, height: 100)
            .padding()
        Divider()
        Text("Hex Color: \(hexColor)").bold()
        ColorPicker("Color Picker", selection: $pickedColor, supportsOpacity: false)
            .onChange(of: pickedColor) { newValue in
                self.getColorsFromPicker(pickerColor: newValue)
            }
    }
    
    func getColorsFromPicker(pickerColor: Color) {
        let colorString = "\(pickerColor)"
        let colorArray: [String] = colorString.components(separatedBy: " ")
        
        if colorArray.count > 1 {
            let r: CGFloat = CGFloat((Float(colorArray[4]) ?? 1))
            let g: CGFloat = CGFloat((Float(colorArray[5]) ?? 1))
            let b: CGFloat = CGFloat((Float(colorArray[6]) ?? 1))
            
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            hexColor = String(format: "#%06X", rgb)
        }
    }
}

struct ColorPickerPage_Previews: PreviewProvider {
    static var previews: some View{
        ColorPickerPage()
    }
}
