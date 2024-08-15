//
//  MessengerViewController.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import UIKit
import SwiftUI

final class MessengerViewController: UIHostingController<MessengerView> {
    
}

struct MessengerView: View {
    
    @StateObject var viewModel: MessengerViewModel
    @State private var selectedSegment = 0

    
    var body: some View {
        ScrollView {
            
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Messenge")
                Spacer()
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.all, 2)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.all, 2)
            }
            .padding(.horizontal, 20)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: .zero) {
                        Text("Online Matches")
                            .font(.headline)
                        Text("(38)")
                        SwiftUIBadgeView()
                            .frame(alignment: .top)
                            .padding(.horizontal, 8)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    
                    Text("Initiate a chat with your matches to get faster response")
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        ForEach(0...40, id: \.self) {_ in
                            HStack {
                                VStack(spacing: 4) {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color.blue)
                                        .overlay(alignment: .bottomTrailing) {
                                            Circle()
                                                .overlay(content: {
                                                    Circle()
                                                        .stroke(.white,lineWidth: 2)
                                                        .foregroundColor(.white)
                                                })
                                                .foregroundColor(.green)
                                                .frame(width: 18, height: 18)
                                        }
                                    Text("user.name")
                                }
                                
                            }
                        }
                        
                    }
                    
                }
                Text("My Conversations")
                    .font(.title)
                VStack {
                    Picker("Options", selection: $selectedSegment) {
                        Text("Acceptances").tag(0)
                        Text("Interests").tag(1)
                        Text("Calls").tag(2)
                    }
                    .pickerStyle(.palette)
                    .padding()
                    
                    if selectedSegment == 0 {
                        AcceptanceTabView()
                    } else if selectedSegment == 1 {
                        AcceptanceTabView()
                    } else {
                        AcceptanceTabView()
                    }
                    
                    Spacer()
                }
            
            }
            .padding(.horizontal, 20)
        }
    }
    
}


struct AcceptanceTabView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0...30, id: \.self) {_ in
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading, spacing: .zero) {
                            Text("Username")
                            Text("Message")
                        }
                        Spacer()
                        Text("Just now")
                    }
                    .padding(.vertical, 5)
                }
            }
        }
    }
}
struct SwiftUIBadgeView: View {
    
    var body: some View {
        Text("Free Chat")
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .overlay(content:  {
                Color.gray.opacity(0.5)
            })
        
            .cornerRadius(4, antialiased: true)
    }
}
#Preview {
    MessengerView(viewModel: .init())
}
