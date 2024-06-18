//
//  MissionView.swift
//  Moonshot
//
//  Created by Dmitriy Eliseev on 09.06.2024.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    
    
    private static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-YYYY"
        return formatter
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width, axis in
                        width * 0.6
                    }
                if let date = mission.launchDate {
                    Text("\(MissionView.formatter.string(from: date))")
                        .font(.title2)
                }
                VStack(alignment: .leading){
                    CustomDevider()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    CustomDevider()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }//:VStack
                .padding(.horizontal)
                CustomHScroll(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map {member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut )
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missios: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missios[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
