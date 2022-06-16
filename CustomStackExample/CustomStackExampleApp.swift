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
      .navigationBarBackgroundColor(Color.orange.opacity(0.5))
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
      ColorPicker("Background", selection: $backgroundColor)
      ColorPicker("Tint", selection: $tint)
      ColorPicker("Title", selection: $titleColor)
      Spacer()
    }
    .background(alignment: .top) {
      Text("😃").offset(y: -100)
    }
    .font(.largeTitle)
    .padding()
    .navigationTitle("Set Colors")
    .navigationBarBackgroundColor(backgroundColor)
    .navigationBarTint(tint)
    .navigationBarTitleColor(titleColor)
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
