//
//  SearchBar.swift
//  Chat
//
//  Created by Matthew Houston on 3/28/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search...", text: $searchText)
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.leading)
            .padding(.trailing, isEditing ? 0 : 15)
            .animation(.default)
            
            
            if isEditing {
                Button {
                    isEditing = false
                    searchText = ""
                    UIApplication.shared.endEditing() // this is in extensions folder
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing)
                .transition(.move(edge: .trailing))
                .animation(.default)
                //the transition of this button coming in and out of view will come from the trailing edge
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isEditing: .constant(false))
    }
}
