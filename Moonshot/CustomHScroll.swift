//
//  CustomHScroll.swift
//  Moonshot
//
//  Created by Dmitriy Eliseev on 18.06.2024.
//

import SwiftUI

struct CustomHScroll: View {
    let crew: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(crew, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                        
                    } label: {
                        HStack {
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.circle)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 2)
                                }
                            VStack(alignment: .leading){
                                Text(crew.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crew.role)
                                    .foregroundStyle(.secondary)
                            }
                        }//: HSTACK
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    CustomHScroll(crew: [CrewMember(role: "Test", astronaut: Astronaut(id: "Test", name: "Test", description: "Test"))])
}
