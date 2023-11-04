//
//  SettingsView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 4.11.2023.
//

import SwiftUI

struct SettingsView: View {
    let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.primary)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(
                            Color(viewModel.iconContainerColor)
                        )
                        .cornerRadius(6)
                }
                Text(viewModel.title)
                    .padding(.leading, 10)
                    
            }
            .padding(.bottom,4)
            .onTapGesture {
                
            }
        }
    }
}

#Preview {
    SettingsView(viewModel: .init(cellViewModels: SettingsOption.allCases.compactMap({
        return SettingsCellViewModel(type: $0)
    })))
}
