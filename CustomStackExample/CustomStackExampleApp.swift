import NavigationBarAppearance
import SwiftUI

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

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink("Color Picker") { PickerView() }
          .frame(height: 60)
        ForEach(colors, id: \.description, content: ColorRow.init(color:))
      }
      .listStyle(.plain)
      .navigationBarTitle("Colors")
      .navigationBarBackgroundColor(Color.indigo.opacity(0.5))
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

struct PickerView: View {
  @State var backgroundColor: Color = .indigo
  @State var tint: Color = .orange
  @State var titleColor: Color = .pink

  var body: some View {
    VStack {
      Text("Set Colors")
      preferenceRow("Background", color: $backgroundColor)
      preferenceRow("Tint", color: $tint)
      preferenceRow("Title", color: $titleColor)
    }
    .navigationTitle("Color Picker")
    .navigationBarBackgroundColor(backgroundColor)
    .navigationBarTint(tint)
    .navigationBarTitleColor(titleColor)
  }

  func preferenceRow(
    _ title: String,
    color: Binding<Color>
  ) -> some View {
    HStack {
      ColorPicker(title, selection: color)
    }
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
