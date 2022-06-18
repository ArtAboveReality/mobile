//
//  jsondata.swift
//  ArtAboveReality Interface App
//
//  Created by Badir Mccleary on 6/17/22.
//

import Foundation

func getData() async throws {
    guard let url = URL(string: "https://artabovereality.com/wp-json/wp/v2/posts") else {
        return
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    guard let blob = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject] else {
        return
    }
    print("✅ PRINTING:\n\(blob.description)")
}
