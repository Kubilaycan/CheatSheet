//
//  TabButton.swift
//  CheatSheet
//
//  Created by Kubilay on 27.09.2021.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }, label: {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .primary)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        if currentTab == title {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                        else {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary, lineWidth: 0.6)
                        }
                    }
                )
                .contentShape(RoundedRectangle(cornerRadius: 4))
        })
            .buttonStyle(PlainButtonStyle())
    }
}
