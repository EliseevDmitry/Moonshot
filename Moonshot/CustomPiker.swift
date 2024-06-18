//
//  CustomPiker.swift
//  Moonshot
//
//  Created by Dmitriy Eliseev on 18.06.2024.
//

import SwiftUI

struct CustomPiker: View {
    var selectedColorIndex: Binding<Int>
    var body: some View {
        Picker("Tip persentage", selection: selectedColorIndex) {
            Text("Grid").tag(0)
            Text("List").tag(1)
        }
        //.pickerStyle(.segmented)
        .pickerStyle(.segmented)
    }

}


