//
//  ProfileView.swift
//  GlaipDemo
//
//  Created by Mauricio Vazquez on 16/8/22.
//

import SwiftUI

struct ProfileView: View {
  let logoutAction: () -> Void

  var body: some View {
    VStack {
      HStack {
        Text("Your Profile")
          .font(.system(size: 25, weight: .bold))
          .foregroundColor(Color("AccentColor"))
      }
      .padding()

      Text("Congratulations! You have successfully logged in to Web3")
        .font(.system(size: 18, weight: .semibold))
        .multilineTextAlignment(.center)
        .foregroundColor(Color("AccentColor"))
        .padding()

      Spacer()

      HStack {
        Text("Logout")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(Color("AccentColor"))
      }
      .onTapGesture {
        self.logoutAction()
      }

      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(logoutAction: {})
  }
}
