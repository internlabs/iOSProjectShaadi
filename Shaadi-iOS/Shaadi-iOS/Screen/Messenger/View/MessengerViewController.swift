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
    
    var body: some View {
        Text("Messanger View")
    }
}
