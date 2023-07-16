//
//  SelectGroupMembersView.swift
//  Chat
//
//  Created by Matthew Houston on 5/28/23.
//

import SwiftUI

struct SelectGroupMembersView: View {
    
    @State private var searchText = ""
    @State private var isEditing = false
    @ObservedObject var selectGroupMembersViewModel = SelectGroupMembersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //search bar
                SearchBar(searchText: $searchText, isEditing: $isEditing)
                
                //selected users view
                if !selectGroupMembersViewModel.selectedUsers.isEmpty {
                    SelectedGroupMembersView()
                }
                
                //user list view
                ScrollView {
                    VStack {
                        ForEach(selectGroupMembersViewModel.selectableUsers) { selectableUser in
                            Button {
                                self.selectGroupMembersViewModel.selectUser(user: selectableUser, isSelected: !selectableUser.isSelected) //!selectableUser.isSelected = the opposite of what is was before
                            } label: {
                                SelectableUserCell(selectableUserCellViewModel: SelectableUserCellViewModel(selectableUser: selectableUser))
                            }
                        }
                    }
                }
            }
            .navigationBarItems(leading: navigationBarCancelButton,
                                trailing: navigationBarNextButton)
            .navigationTitle("New Group")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    //navigation bar button items
    var navigationBarCancelButton: some View {
        NavigationLink(destination: Text("Destination")) {
            Button {
                print("Dismiss View")
            } label: {
                Text("Cancel")
            }
        }
    }
    
    var navigationBarNextButton: some View {
        Text("Next").bold()
    }
}

struct SelectGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGroupMembersView()
    }
}
