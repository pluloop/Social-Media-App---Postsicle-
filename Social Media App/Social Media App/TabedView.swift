//
//  TabedView.swift
//  Social Media App
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI // to use swiftui

struct Post{ // start of struct Post / contents of a post
    var content: String // content of post
    var likes: Int // meta data
    var comments: [String] // for user interaction
} // end of struct Post

struct TabedView: View { // start of TabedView
    @State var selection: Int = 3 // to determine which tab to be in
    @Binding var name: String // for displaying name of account
    @Binding var accounts: [Account] // to access all accounts
    @State private var login: Account = Account(username: "", password: "", name: "", postNum: 0, followers: 0, following: 0) // to store current login account
    @Binding var followers: String // to display followers numbers
    @Binding var following: String // to display following numbers
    @State private var post: Post = Post(content: "", likes: 0, comments: []) // to store post
    @State private var posts: [Post] = [] // to store posts
    @State var darkMode: Bool = false // status of theme
    @Binding var username: String // to display username
    @Binding var password: String // to display password
    
    var body: some View { // start of TabedView body
        TabView(selection: $selection) { // for tab bar
            ProfileView(name: $name, followers: $followers, following: $following, darkMode: $darkMode, login: $login) // to go to ProfileView
                .tabItem{ // start of tabItem 1
                    Image(systemName: "person") // image for ProfileView
                } // end of tabItem 1
                .tag(1) // used for changing tabs
            PostView(selection: $selection, post: $post, posts: $posts, darkMode: $darkMode, login: $login) // to go to PostView
                .tabItem{ // start of tabItem 2
                    Image(systemName: "plus") // image for PostView
                } // end of tabItem 2
                .tag(2) // used for changing tabs
            HomeView(post: $post, posts: $posts, darkMode: $darkMode) // to go to HomeView
                .tabItem{ // start of tabItem 3
                    Image(systemName: "house") // image to HomeView
                } // end of tabItem 3
                .tag(3) // used for changing tabs
            SettingsView(accounts: $accounts, login: $login, username: $username, password: $password, name: $name, darkMode: $darkMode) // to go to SettingsView
                .tabItem{ // start of tabItem 4
                    Image(systemName: "gear")// image for SettingsView
                } // end of tabItem 4
                .tag(4) // used for changing tabs
        } // end of TabView
    } // end of TabedView body
} // end of TabedView

struct PostView: View { // start of PostView
    @State private var postPlaceholder: String = "<OOO" // placeholder for post content
    @Binding var selection: Int // to store current tab
    @Binding var post: Post // to store post
    @Binding var posts: [Post] // to store posts
    @Binding var darkMode: Bool // status of theme
    @Binding var login: Account // to store current login
    
    var body: some View { // start of PostView body
        VStack{ // start of VStack
            Spacer() // for spacing
            Spacer() // for spacing
            
            ZStack{ // start of ZStack
                Rectangle() // for background
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color rectangle
                    .frame(maxWidth: 150) // size of rectangle (width)
                    .frame(maxHeight: 75) // size of rectangle (height)
                Text("Post") // title of tab
                    .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // color of text
                    .font(.system(size: 35)) // size of text
            } // end of ZStack
            
            Spacer() // for spacing
            Spacer() // for spacing

            TextEditor( // start of TextEditor / to write post
                    text: $postPlaceholder // placeholder text of post
                ) // end of TextEditor
            .scrollContentBackground(.hidden) // to hide scroll?
            .background(Color(red: 225 / 255, green: 217 / 255, blue: 209 / 255)) // color of textEditor background
            .frame(width: 300, height: 300) // size of textEditor
            
            Spacer() // for spacing
            
            Button("Post"){ // start of button / button to post
                post = Post(content: postPlaceholder, likes: 0, comments: []) // make post
                
                posts.append(post) // add to post list
                
                login.postNum += 1 // increment number of posts for displaying
                
                selection = 3 // go back to home
            } // end of button
            .frame(maxWidth: 150) // width of button
            .frame(maxHeight: 50) // height of button
            .foregroundColor(Color(red: 241 / 255, green: 241 / 255, blue: 241 / 255)) // text color of button
            .background(Color(red: 60 / 255, green: 76 / 255, blue: 133 / 255)) // color of background button
            .font(.system(size: 35)) // text size of button
            .multilineTextAlignment(.center) // center text in button
            
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
        } // end of VStack
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of background
        .background(darkMode ? Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255) : Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // color of background
        .ignoresSafeArea() // idek does smth
    } // end of PostView body
} // end of PostView

struct HomeView: View { // start of HomeView
    @Binding var post: Post // to store post
    @Binding var posts: [Post] // to store posts
    @Binding var darkMode: Bool // status of theme
    
var body: some View { // start of HomeView body
        VStack{ // start of VStack
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
    
            ZStack{ // start of ZStack
                Rectangle() // title background
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of background
                    .frame(maxWidth: 150) // width of background
                    .frame(maxHeight: 75) // hieght of background
                Text("Home") // textof title
                    .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // color of title
                    .font(.system(size: 35)) // size of title
            } // end of ZStack
            
            List{ // start of List / to list post
                ForEach(posts.indices, id: \.self) { post in // start of ForEach / to iterate posts in list of posts
                    Text(posts[post].content) // to display post
                        .listRowBackground(Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // background of post
                } // end of ForEach
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of post
                .background(Color(red: 225 / 255, green: 217 / 255, blue: 209 / 255)) // size of background // color of background
                .ignoresSafeArea() // idk / size?
            } // end of List
        } // end of VStack
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of background
        .background(darkMode ? Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255) : Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // color of background
        .ignoresSafeArea() // yea idk
    } // end of HomeView body
} // end of HomeView

struct ProfileView: View { // start of ProfileView
    @Binding var name: String // to display name
    @Binding var followers: String // to display followers
    @Binding var following: String // to display following
    @Binding var darkMode: Bool // status of theme
    @Binding var login: Account // to store current login
    @State var nothing: String = "" // for displaying nothing
    @State var bio: String = "bio" // placeholder for bio
    
    var body: some View { // start of ProfileView body
        VStack{
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            
            ZStack{ // start of ZStack 1
                Rectangle() // background of title
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of background
                    .frame(maxWidth: 150) // width of background
                    .frame(maxHeight: 75) // height og background
                Text("Profile") // text of title
                    .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // color of title
                    .font(.system(size: 35)) // font size of title
            } // end of ZStack 1
            
            Circle() // for profile image
                .fill(Color(red: 225 / 255, green: 217 / 255, blue: 209 / 255)) // color of profile image
                .frame(width: 250, height: 250) // size of profile image
            
            Spacer() // for spacing
           
            ZStack{ // start of ZStack 2
                Rectangle() // background of info
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of info background
                    .frame(width: 300, height: 175) // size of info background
                
                VStack{ // start of ZStack 3
                    HStack{ // start of HStack 1
                        Spacer() // for spacing
                        
                        Text( // start of Text 1
                                name + "Andy" // for display name in profile
                            ) // end of Text 1
                        
                        Spacer() // for spacing
                        Spacer() // for spacing
                        Spacer() // for spacing
                        Spacer() // for spacing
                    } // end of HStack 1
                    
                    HStack{ // start of HStack 2
                        Spacer() // for spacing
                        
                        TextEditor( // start of TextEditor 1
                            text: $bio // displaying bio
                            ) // end of TextEditor 2
                        
                        Spacer() // for spacing
                        Spacer() // for spacing
                        Spacer() // for spacing
                        Spacer() // for spacing
                    } // start of HStack 2
                    .scrollContentBackground(.hidden) // to hide scrolling?
                    .background(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of bio area
                    .frame(width: 275, height: 75) // size of bio area
                } // end of ZStack 3
            } // end of ZStack 2
            
            Spacer() // for spacing
            
            ZStack{ // start of ZStack 4
                    TextEditor( // start of TextEditor 2
                        text: $nothing // to display nothing
                        ) // end of TextEditor 2
                    .scrollContentBackground(.hidden) // to hide scrolling?
                    .background(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // background color of area
                    .frame(width: 300, height: 75) // size of area
                    
                HStack{ // start of HStack 1
                    Text( // start of Text 2
                        "Posts: " + String(login.postNum) // to display number of posts
                        ) // end of Text 2
                    .background(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // background color of area
                    .frame(width: 75, height: 75) // size of area
                    .font(.system(size: 15)) // text size of number of posts
                    
                    Text( // start of Text 3
                        "Followers: " + followers // to display number of Followers
                        ) // end of Text 3
                    .background(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // background color of area
                    .frame(width: 100, height: 75) // size of area
                    .font(.system(size: 15)) // text size of number of followers
                
                Text( // start of Text 4
                    "Following: " + following // to display number of following
                    ) // end of Text 4
                .background(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // background color of area
                .frame(width: 100, height: 75) // size of area
                .font(.system(size: 15)) // text size of number of following
                } // end of HStack 3
            } // end of ZStack 4
            
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of background
        .background(darkMode ? Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255) : Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // color of background
        .ignoresSafeArea() // idk
    } // end of ProfileView body
} // end of ProfileView

struct SettingsView: View { // start of SettingsView
    @Binding var accounts: [Account] // to store accounts
    @Binding var login: Account // to store current login
    @Binding var username: String // to display user
    @Binding var password: String // to display password
    @Binding var name: String // to store name
    @State var postNum: Int = 0 // to store num posts
    @State var followers: Int = 0 // to store num followers
    @State var following: Int = 0 // to store num following
    @State var newLogin: Account = Account(username: "", password: "", name: "", postNum: 0, followers: 0, following: 0) // to make new login after metadata changes
    @State var newAccounts: [Account] = [] // store new accounts (delete old one since meta data changed)
    @Binding var darkMode: Bool // status of theme
    
    var body: some View { // start of SettingsView body
        VStack{ // start of VStack 1
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            
            ZStack{ // start of ZStack 1
                Rectangle() // background of title
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of background
                    .frame(maxWidth: 150) // width of background
                    .frame(maxHeight: 75) // height of background
                Text("Settings") // title of tab
                    .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // color of title
                    .font(.system(size: 35)) // size of title
            } // end of ZStack 1
            Spacer() // for spacing
            Spacer() // for spacing
            
            ZStack{ // start of ZStack 2
                Rectangle() // background for username area
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of username background area
                    .frame(width: 300, height: 75) // size of username background area
                
                TextField(username, text: $username){ // start of TextField (username) / to change username
                    for account in accounts{ // start of for loop / going through accounts
                        if account.username != username && account.username != login.username{ // start of if statement / if account is not the changed name or current login name
                            newAccounts.append(account) // add to newAccounts (for new accounts)
                        } // end of if statement
                    } // end of for loop
                    
                    newLogin = Account(username: username, password: password, name: name, postNum: postNum, followers: followers, following: following) // make new login with new info
                    
                    newAccounts.append(newLogin) // add to newAccounts
                    
                    accounts = newAccounts // set accounts to newAccounts (get rid of old accounts)
                    
                    newAccounts = [] // set empty for next time
                } // end of TextField (username)
                .frame(maxWidth: 150) // width of TextField
                .frame(maxHeight: 75) // hieght of TextField
                .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // text color of TextField
                .font(.system(size: 30)) // text size of TextField
            } // end of ZStack 2
            Spacer() // for spacing
            
            ZStack{ // start of ZStack 3
                Rectangle() // background for password changing area
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of background password area
                    .frame(width: 300, height: 75) // size of background password area
                
                TextField(login.password, text: $password){ // start of TextField (password) to change password
                    for account in accounts{ // start of for loop / go through accounts
                        if account.username != username && account.username != login.username{
                            newAccounts.append(account) // add to newAccounts (for new accounts)
                        } // end of if statement
                    } // end of for loop
                    
                    newLogin = Account(username: username, password: password, name: name, postNum: postNum, followers: followers, following: following) // make new login with new info
                    
                    newAccounts.append(newLogin) // add to newAccounts
                    
                    accounts = newAccounts // set accounts to newAccounts (get rid of old accounts)
                    
                    newAccounts = [] // set empty for next time
                }
                .frame(maxWidth: 150) // width of TextField
                .frame(maxHeight: 75) // hieght of TextField
                .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // text color of TextField
                .font(.system(size: 30)) // text size of TextField
            }
            Spacer() // for spacing
            
            ZStack{ // start of ZStack 4
                Rectangle() // background of name changing area
                    .fill(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of name background changing area
                    .frame(width: 300, height: 75) // size of background changing area
                
                TextField(login.name, text: $name){ // start of TextField (name) to change name
                    for account in accounts{ // start of for loop / go through accounts
                        if account.username != username && account.username != login.username{
                            newAccounts.append(account) // add to newAccounts (for new accounts)
                        } // end of if statement
                    } // end of for loop z
                    
                    newLogin = Account(username: username, password: password, name: name, postNum: postNum, followers: followers, following: following) // make new login with new info
                    
                    newAccounts.append(newLogin) // add to newAccounts
                    
                    accounts = newAccounts // set accounts to newAccounts (get rid of old accounts)
                    
                    newAccounts = [] // set empty for next time
                } // end of TextField (name)
                .frame(maxWidth: 150) // width of TextField
                .frame(maxHeight: 75) // hieght of TextField
                .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // text color of TextField
                .font(.system(size: 30)) // text size of TextField
            } // end of ZStack 4
            Spacer() // for spacing
            
            Button("theme"){ // button for changing theme
                if darkMode{ // if theme is dark
                    darkMode = false // change to light
                } else{ // end if / start else theme light, change dark
                    darkMode = true
                } // end of else
            } // end of button
            .frame(maxWidth: 300) // width of button
            .frame(maxHeight: 75) // height of button
            .foregroundColor(Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255)) // text color of button
            .background(Color(red: 192 / 255, green: 205 / 255, blue: 206 / 255)) // color of background
            .font(.system(size: 30)) // text size of button
            
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
            Spacer() // for spacing
        } // end of VStack 1
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity) // size of background
        .background(darkMode ? Color(red: 35 / 255, green: 43 / 255, blue: 43 / 255) : Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)) // color of background
        .ignoresSafeArea() // idk
    } // end of SettingsView body
} // end of SettingsView

#Preview { // start of #Preview
    TabedView(name: .constant(""), accounts: .constant([])  , followers: .constant(""), following: .constant(""), username: .constant(""), password: .constant("")) // for Binding variables default value 
} // end of #Preview
