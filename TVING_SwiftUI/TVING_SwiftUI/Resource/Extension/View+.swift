//
//  View+.swift
//  TVING_SwiftUI
//
//  Created by 최주리 on 5/28/25.
//

import SwiftUI

extension View {
    @ViewBuilder
    func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
}
