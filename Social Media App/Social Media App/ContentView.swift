//
//  ContentView.swift
//  Social Media App
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI // to use swiftui

// mb for the incomplete assignment i got lazy

// for making accounts
struct Account: Hashable{ // start of struct Account
    var username: String // for login
    var password: String // for login
    var name: String // account meta data
    var postNum: Int // account meta data
    var followers: Int // account meta data
    var following: Int // account meta data
} // end of struct Account

// for the user to start at
struct ContentView: View { // start of ContentView
    @State private var accounts: [Account] = [] // to store accounts
    @Binding var post: Post // to store current post
    @Binding var posts: [Post] // to store posts
    @Binding var login: Account // to store current login
    
    var body: some View { // start of body
        NavigationView{ // start of NavigationView
            ZStack { // start of VStack 1
                Image("start") // display start image
                    .resizable() // to change size
                    .aspectRatio(contentMode: .fill) // to use image on all the screen space
                    .edgesIgnoringSafeArea(.all) // for screen
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of image
                    .ignoresSafeArea() // for screen
                
                VStack{ // start of VStack 2
                    Spacer() // for spacing
                    Spacer() // for spacing
                    
                    Rectangle() // for background
                        .fill(Color(red: 225 / 255, green: 217 / 255, blue: 209 / 255)) // color of background
                        .frame(width: 250, height: 500)  // size of background
                    
                    Spacer() // for spacing
                } // end of VStack 2
                
                VStack{ // start of VStack 3
                    Spacer() // for spacing
                    Spacer() // for spacing
                    Spacer() // for spacing
                    
                    NavigationLink(destination: LoginView(login: $login, accounts: $accounts, post: $post, posts: $posts) // to go to LoginView
                        .toolbarRole(.editor)){ // I forgot 💀💀
                        Text("LOGIN") // text for login button
                            .frame(maxWidth: 150) // width of button
                            .frame(maxHeight: 75) // height of button
                            .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // for login text color
                            .background(Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // for login button color
                            .font(.system(size: 35)) // for login text font
                    } // end of toolbarRole
                    
                    Spacer() // for spacing
                    
                    NavigationLink(destination: SignUpView(accounts: $accounts) // to go to SignUpView
                        .toolbarRole(.editor)){ // I forgot 💀💀
                        Text("SIGNUP") // text for signup button
                            .frame(maxWidth: 150) // width of button
                            .frame(maxHeight: 75) // height of button
                            .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // for signup text color
                            .background(Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // for signup button color
                            .font(.system(size: 35)) // for signup text font
                    } // end of toolbarRole
                    
                    Spacer() // for spacing
                    Spacer() // for spacing
                } // end of VStack 3
            } // end of VStack 1
        } // end of NavogationView
    } // end of body
} // end of ContentView

#Preview { // start of #Preview
    ContentView(post: .constant(Post(content: "", likes: 0, comments: [])), posts: .constant([]), login: .constant(Account(username: "", password: "", name: "", postNum: 0, followers: 0, following: 0))) // for binding variables
} // end of #Preview
