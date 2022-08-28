//
//  WalletButtonView.swift
//  GlaipDemo
//
//  Created by Mauricio Vazquez on 16/8/22.
//

import SwiftUI

struct WalletButtonView: View {
  let title: String
  let action: () -> Void
  let iconImage: Image

  let buttonBackground: Color = Color("ButtonBackgroundColor")
  let buttonForeground: Color = Color.white
  let iconSize: CGFloat = 35

  var body: some View {
    HStack {
      iconImage
        .resizable()
        .frame(width: iconSize, height: iconSize)
        .padding(.leading)
        .padding(.trailing)

      Button(String(describing: title)) {
        action()
      }
      .padding(.trailing)

      Spacer()
    }
    .font(.system(size: 16, weight: .semibold))
    .frame(maxWidth: .infinity)
    .padding()
    .background(buttonBackground)
    .foregroundColor(buttonForeground)
    .cornerRadius(3)
    .shadow(color: .gray, radius: 5)
  }
}

struct WalletButtonView_Previews: PreviewProvider {
    static var previews: some View {
      WalletButtonView(
        title: "MetaMask",
        action: {},
        iconImage: Image("MetaMaskIcon")
      )
    }
}

