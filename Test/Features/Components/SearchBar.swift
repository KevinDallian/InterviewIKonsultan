//
//  SearchBar.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchString : String
    var body: some View {
        TextField("Search", text: $searchString)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    SearchBar(searchString: .constant("Hello"))
}
