//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Paul Huynh on 2023-09-22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State private var isShowSheet = false
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]

    var body: some View {
        
        VStack {
            
            Spacer().sheet(isPresented: $isShowSheet) {
                Button("dismiss") {
                    isShowSheet.toggle()
                }
            }
            
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("first")
                            .navigationTitle("First tab")
                    }
                default:
                    NavigationView { //navigationView by default takes up entire span of screen either have this or Spacer
                        Text("Rest")
                    }
                }
            }
            Divider()
            
            HStack {
                ForEach(0..<5) { num in
                    Spacer()
                    Button {
                        selectedIndex = num
                        if num == 2 {
                            isShowSheet.toggle()
                        }
                    } label: {
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 45, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor( selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        
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
