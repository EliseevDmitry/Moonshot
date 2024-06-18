//
//  CustomDevider.swift
//  Moonshot
//
//  Created by Dmitriy Eliseev on 18.06.2024.
//

import SwiftUI

struct CustomDevider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDevider()
}
