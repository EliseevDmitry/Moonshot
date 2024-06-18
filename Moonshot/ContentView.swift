//
//  ContentView.swift
//  Moonshot
//
//  Created by Dmitriy Eliseev on 09.06.2024.
//

import SwiftUI

struct ContentView: View {
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State private var selectedColorIndex: Int = 0
    var body: some View {
        NavigationStack{
            ScrollView{
                CustomPiker(selectedColorIndex: $selectedColorIndex)
                    .onAppear{
                        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
                        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.green], for: .selected)
                        UISegmentedControl.appearance().backgroundColor = .gray
                        let attr = NSDictionary(object: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, forKey: NSAttributedString.Key.font as NSCopying)
                        UISegmentedControl.appearance().setTitleTextAttributes(attr as? [NSAttributedString.Key : Any], for: .normal)
                    }
                if selectedColorIndex == 0 {
                    LazyVGrid(columns: colums){
                        DataPage()
                    }
                    .padding([.horizontal, .bottom])
                }
                if selectedColorIndex == 1 {
                    DataPage()
                        .padding()
                }
            }//: ScrollView
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }//: NavigationStack
    }
}

#Preview {
    ContentView()
}
