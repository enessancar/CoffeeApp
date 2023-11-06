//
//  PostView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 6.11.2023.
//

import UIKit
import SnapKit

final class PostView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

#Preview {
    PostView()
}
