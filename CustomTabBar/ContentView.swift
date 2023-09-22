//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Paul Huynh on 2023-09-22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]

    var body: some View {
        
        VStack {
            
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("first")
                            .navigationTitle("First tab")
                    }
                default:
                    Text("Rest")
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<5) { num in
                    Spacer()
                    Button {
                        selectedIndex = num
                    } label: {
                        Image(systemName: tabBarImageNames[num])
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(.black))
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
