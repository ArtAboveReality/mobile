//
//  WordPress.swift
//  Mobile
//
//  Created by Dwayne Langley on 6/24/22.
//

import Foundation

func getPost() async throws -> String {
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
    // A condition just in case Wordpress fixes their API and sends a normal string in the response
    guard let rendered = raw.htmlToAttributedString else {
        // We don't need to convert Wordpress' goofy response in this case
        return raw
    }
    // A regular String strips the styling away
    return rendered.string
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
