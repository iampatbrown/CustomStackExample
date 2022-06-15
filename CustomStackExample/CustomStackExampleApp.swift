import NavigationBarAppearance
import SwiftUI

struct ContentView: View {
  let colors: [Color] = [
    .red,
    .green,
    .orange,
    .purple,
    .blue,
    .pink,
    .indigo,
    .black,
    .brown,
    .yellow
  ]

  var body: some View {
    NavigationView {
      List(colors, id: \.description, rowContent: ColorRow.init(color:))
        .listStyle(.plain)
        .navigationBarTitle("Colors")
        .navigationBarBackgroundColor(Color(white: 0.95))
        .navigationBarTitleColor(.black)
    }
    .navigationViewStyle(.customStack)
  }
}

struct ColorRow: View {
  var color: Color

  var body: some View {
    NavigationLink {
      ColorView(color: color)
    } label: {
      HStack {
        Text(color.description.capitalized)
        Spacer()
        Circle()
          .foregroundColor(color)
          .frame(width: 60, height: 60)
          .padding(5)
      }
    }
  }
}

struct ColorView: View {
  var color: Color

  var body: some View {
    VStack {
      NavigationLink {
        Text("Details page")
          .navigationTitle("Details")
      } label: {
      Rectangle()
        .foregroundColor(color)
        .overlay(Text("Press me!").foregroundColor(.primary))
        .aspectRatio(1, contentMode: .fit)
        .padding()
      }

      Text("\(color.description.capitalized) is an awesome color")
      Spacer()
    }
    .navigationTitle(color.description.capitalized)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarTint(.white)
    .navigationBarTitleColor(.white)
    .navigationBarBackgroundColor(color)
  }
}

@main
struct CustomStackExampleApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
