//
//  SelectableUserCell.swift
//  Chat
//
//  Created by Matthew Houston on 5/29/23.
//

import SwiftUI
import Kingfisher

struct SelectableUserCell: View {
    
    let selectableUserCellViewModel: SelectableUserCellViewModel

    var body: some View {
        VStack {
            HStack(spacing: 12) {
                KFImage(selectableUserCellViewModel.profileImageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    
                
                VStack(alignment: .leading) {
                    Text(selectableUserCellViewModel.username)
                        .font(.system(size: 14, weight: .semibold))
                    Text(selectableUserCellViewModel.fullName)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: selectableUserCellViewModel.selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(selectableUserCellViewModel.selectableUser.isSelected ? Color.blue : Color.gray)
                    .padding(.trailing)
                
            }.padding(.leading)
        }
        .padding(.top)
    }
}

struct SelectableUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SelectableUserCell(selectableUserCellViewModel: SelectableUserCellViewModel(selectableUser: SelectableUser(user: MOCK_USER)))
    }
}
