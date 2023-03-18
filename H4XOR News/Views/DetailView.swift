//
//  DetailView.swift
//  H4XOR News
//
//  Created by Abdeljaouad Mezrari on 12/03/2023.
//  Copyright © 2023 Abdeljaouad Mezrari. All rights reserved.
//

import SwiftUI
struct DetailView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}
