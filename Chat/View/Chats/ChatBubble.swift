//
//  ChatBubble.swift
//  Chat
//
//  Created by Matthew Houston on 3/28/23.
//

import SwiftUI

//Using this as a clipShape. E.g. .clipShape(Circle()).. .clipShape(ChatBubble)
struct ChatBubble: Shape {
    //if it's from current user round every edge except the bottom left.. if is user round every edge except the bottom right left.
    var isFromCurrentUser: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: true)
    }
}
