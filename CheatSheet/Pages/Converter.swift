//
//  Converter.swift
//  CheatSheet
//
//  Created by Kubilay on 27.09.2021.
//

import SwiftUI
import Foundation

struct Converter: View {
    @State private var selectedConversionMode = "rem to px"
    let conversionModes = ["rem to px", "px to rem"]
    
    @State private var input: String  = ""
    @State private var output = 0.0
    
    var body: some View {
        VStack {
            Picker("Modes", selection: $selectedConversionMode) {
                ForEach(conversionModes, id: \.self) {
                    Text($0)
                }
            }.padding(.horizontal).padding(.vertical)
            HStack {
                Text("Input").padding()
                TextField("Input", text: $input)
                    .onChange(of: input) { temp in
                        switch selectedConversionMode {
                        case conversionModes[0]:
                            remTopx(from: temp)
                        case conversionModes[1]:
                            pxTorem(from: temp)
                        default:
                            output = 0.0
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            Text("Output: \(output)").bold()
        }
    }
    
    
    func remTopx(from: String) {
        if from.isNumber {
            let temp = Double(from)
            output = (temp ?? 0.0) * 16.0
        }
    }
    
    func pxTorem(from: String) {
        if from.isNumber {
            let temp = Double(from)
            output = (temp ?? 0.0) / 16
        }
    }
}

struct ConverterPage_Previews: PreviewProvider {
    static var previews: some View {
        Converter()
    }
}

extension String {
    var isNumber: Bool {
        return !self.isEmpty && (self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil || self.rangeOfCharacter(from: CharacterSet.symbols) == nil)
    }
}
