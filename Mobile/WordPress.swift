//
//  WordPress.swift
//  Mobile
//
//  Created by Dwayne Langley on 6/24/22.
//

import Foundation

func getPost() async throws -> NSAttributedString {
    // Each individual post's contents can be grabbed by id, but they all come without it.
    let string = "https://artabovereality.com/wp-json/wp/v2/posts/1854"
    guard let url = URL(string: string) else {
        throw NSError(domain: "No Url", code: 1)
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    // This is the generic anonymous parse version
    guard let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject]
    else {
        throw NSError(domain: "No Parsing", code: 1)
    }
    let content = dictionary["content"] as! [String: AnyObject]
    // This is the actual text content, but formatted as a whole html doc
    let raw = content["rendered"] as! String
    // If we wanted to KEEP the website styling, but with a fallback Attributed string without styling in case they fix their API
    return raw.htmlToAttributedString ?? NSAttributedString(string: raw)
}

extension String {
    /// Converts html to string retaining the styling.
    var htmlToAttributedString: NSAttributedString? {
        try? NSAttributedString(
            data: data(using: .utf8)!,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
            ],
            documentAttributes: nil)
    }
}
