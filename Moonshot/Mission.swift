//
//  Mission.swift
//  Moonshot
//
//  Created by Dmitriy Eliseev on 09.06.2024.
//

import Foundation

//struct CrewRole: Codable {
//    let name: String
//    let role: String
//}

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    //после декодирования даты мы можем заменить String -> Date
    //let launchDate: String?
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
