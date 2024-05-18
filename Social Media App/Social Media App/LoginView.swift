//
//  LoginView.swift
//  Social Media App
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI// to use swiftui

struct LoginView: View { // start of LoginView
    @State private var username: String = "" // storing username
    @State private var password: String = "" // storing password
    @State private var name: String = "" // storing name
    @State private var postNum: Int = 0 // to display later number of posts
    @State private var followers: String = "0" // to display later number of followers
    @State private var following: String = "0" // to display later number of following
    @Binding var login: Account // to access logged in account
    @State var loginStart: Account = Account(username: "", password: "", name: "", postNum: 0, followers: 0, following: 0) // to store
    @State private var invalid = false // to check if account already exists
    @Binding var accounts: [Account] // to access accounts
    @Binding var post: Post // to access post
    @Binding var posts: [Post] // to access posts
    
    var body: some View { // start of LoginView body
        NavigationView{ // start of NavigationVIew
            ZStack { // start of ZStack 1
                Image("start") // display start image
                    .resizable() // to change size
                    .aspectRatio(contentMode: .fill) // to use image on all the screen space
                    .edgesIgnoringSafeArea(.all) // size of background?
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of background image
                    .ignoresSafeArea() // idk
                
                VStack{ // start of VStack 1
                    Spacer() // for spacing
                    Spacer() // for spacing
                    
                    ZStack{ // start of ZStack 2
                        Rectangle() // for background of input area
                            .fill(Color(red: 225 / 255, green: 217 / 255, blue: 209 / 255)) // color of input area
                            .frame(width: 250, height: 500) // size of input area
                        
                        VStack{ // start of VStack 2
                            Text("LOGIN") // text of login
                                .font(.system(size: 35)) // size of login text
                            
                            TextField("username", text: $username) // text input for username
                                .frame(maxWidth: 150) // width of text input username
                                .frame(maxHeight: 75) // height of text input username
                                .background(Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // background color of text input username
                                .font(.system(size: 35)) // text size of text input username
                                .multilineTextAlignment(.center) // center text of text input username
                            
                            TextField("password", text: $password) // text input for password
                                .frame(maxWidth: 150) // width of text input password
                                .frame(maxHeight: 75) // height of text input password
                                .background(Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // background color of text input password
                                .font(.system(size: 35)) // text size of text input username
                                .multilineTextAlignment(.center) // center text of text input password
                            
                            NavigationLink(destination: // to go to views
                                            accounts.contains(loginStart) ? AnyView(TabedView(name: $name, accounts: $accounts, followers: $followers, following: $following, username: $username, password: $password) // if login is in accounts go to TavedView
                                                .navigationBarBackButtonHidden(true)) : AnyView(LoginView(login: $login, accounts: $accounts, post: $post, posts: $posts)
                                                    .navigationBarBackButtonHidden(true))){ // else go to LoginView / hide back button
                                Text("Login") // text of login title
                                    .frame(maxWidth: 125) // width of login title
                                    .frame(maxHeight: 75) // height of login title
                                    .foregroundColor(Color(red: 241 / 255, green: 241 / 255, blue: 241 / 255)) // color of login title
                                    .background(Color(red: 60 / 255, green: 76 / 255, blue: 133 / 255)) // background of title background
                                    .font(.system(size: 35)) // size of login title
                                    .multilineTextAlignment(.center) // center text in login title
                            }.simultaneousGesture(TapGesture().onEnded{ // for being on top?
                                if let followersInt = Int(followers), let followingInt = Int(following){ // start of if / make variables for account
                                    loginStart = Account(username: username, password: password, name: name, postNum: postNum, followers: followersInt, following: followingInt)
                                } // end of if
                                
                                for account in accounts{ // for loop to iterate accounts
                                    if !(account.username == loginStart.username && account.password == loginStart.password){ // if account is not in accounts list
                                        invalid = true // to give error
                                    } // end of if
                                } // end of for loop
                            }) // end of top?
                            
                            Text("Invalid login") // to display invalid error if accounts not found
                            .opacity(invalid ? 1 : 0) // show text if error
                            .foregroundColor(Color(red: 150 / 255, green: 68 / 255, blue: 68 / 255)) // color of text
                        } // end of VStack 2
                    } // end of ZStack 2
                    Spacer() // for spacing
                } // end of VStack 1
                Spacer() // for spacing
            } // end of ZStack 1
        } // end of NavigationView
    } // end of LoginView body
} // end of LoginView

#Preview { // start of #Preview
    LoginView(login: .constant(Account(username: "", password: "", name: "", postNum: 0, followers: 0, following: 0)), accounts: .constant([]), post: .constant(Post(content: "", likes: 0, comments: [])), posts: .constant([])) // for binding variables
} // end of #Preview
