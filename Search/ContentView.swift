 //
//  ContentView.swift
//  Search
//
//  Created by Macbook Pro on 10/19/20.
//  Copyright © 2020 tendi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var isSearching = false
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    HStack{
                           TextField("#1 Search", text: $searchText)
                               .padding(.leading,24)
                       }
                       .padding()
                       .background(Color(.systemGray4))
                       .cornerRadius(10)
                       .padding(.horizontal)
                       .onTapGesture(perform: {
                           self.isSearching = true
                       })
                       .overlay(
                           HStack{
                               Image(systemName: "magnifyingglass")
                               Spacer()
                               if isSearching {
                                 Image(systemName: "xmark.circle.fill")
                                   .onTapGesture {
                                        self.searchText = ""
                                        self.isSearching = false
                                   }
                                   
                               }
                           }.padding(.horizontal, 32)
                           .foregroundColor(.black)
                       )
                    if isSearching {
                        Button(action : {
                            self.searchText = ""
                            self.isSearching = false
                        }, label: {
                            Text("Cancel")
                                .padding(.leading, -12)
                        }).padding(.trailing, 15)
                            .transition(.move(edge: .trailing))
                            .animation(.spring())
                    }
                }
               
                ForEach((0..<20).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self){ num in
                    VStack(alignment: .leading){
                        Text("\(num)")
                        Divider().background(Color(.systemGray))
                    }.padding()
                    
                }
            }
            .navigationBarTitle("Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
