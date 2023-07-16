//
//  StatusSelectorView.swift
//  Chat
//
//  Created by Matthew Houston on 3/26/23.
//

import SwiftUI

struct StatusSelectorView: View {
    
    @ObservedObject var statusViewModel: StatusViewModel = StatusViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    
                    HStack {
                        StatusCell(status: statusViewModel.status)
                        Spacer()
                    }
                    .background(Color.white)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    VStack {
                        ForEach(UserStatus.allCases.filter({ $0 != .notConfigured}), id: \.self) { status in
                            Button {
                                self.statusViewModel.updateStatus(status: status)
                            } label: {
                                StatusCell(status: status)
                            }
                        }
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {

    let status: UserStatus
    
    var body: some View {
        HStack {
            Text(status.title)
            Spacer()
        }
        .padding()
    }
}
