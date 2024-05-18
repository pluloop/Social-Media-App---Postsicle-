//
//  Social_Media_AppApp.swift
//  Social Media App
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI

@main
struct Social_Media_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(post: .constant(Post(content: "", likes: 0, comments: [])), posts: .constant([]), login: .constant(Account(username: "", password: "", name: "", postNum: 0, followers: 0, following: 0)))
        }
    }
}
