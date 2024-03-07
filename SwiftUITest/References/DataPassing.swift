


/*
 
 ================
 MARK: - 1. Data passing one view to another view
 ================
 
 import SwiftUI


 struct ContentView: View {
     
     @State private var isPresented:Bool = false
     @State private var getString:String = ""
     
     var body: some View {
         NavigationStack {
             VStack(){
                 
                 Text(getString)
                     .font(.largeTitle)
                 Button("Add Item") {
                     getString = ""
                     isPresented = true
                 }
                 .sheet(isPresented: $isPresented) {
                     Presentview(name: $getString)
                 }
             }
             .toolbar {
                 ToolbarItem(placement: .principal) {
                     VStack (alignment: .leading)  {
                         HStack {
                             Image("profile")
                                 .resizable()
                                 .frame(maxWidth: 30 , maxHeight: 30)
                                 .padding(.bottom, 5)
                                 .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
                             VStack (alignment: .leading) {
                                 Text("Title")
                                     .fontWeight(.bold)
                                     .foregroundColor(.white)
                                     .font(Font.custom("Helvetica Neue Medium", size: 18.0))
                                     .fontWeight(.regular)
                                 
                                 Text("sub title")
                                     .fontWeight(.light)
                                     .foregroundColor(.white)
                                     .font(Font.custom("Helvetica Neue Medium", size: 14))
                                     .fontWeight(.regular)
                             }.padding()
                             
                             Spacer()
                             Image("notification")
                                 .resizable()
                                 .frame(maxWidth: 30 , maxHeight: 30)
                                 .padding(.bottom, 5)
                                 .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
                         }
                     }
                 }
             }
             .toolbarBackground(.visible, for: .navigationBar)
             .toolbarBackground(Color.blue, for: .navigationBar)
             .navigationBarTitleDisplayMode(.inline)
         }
     }
 }


 #Preview {
     ContentView()
 }




 struct Presentview:View {
     
     @Environment(\.dismiss) var dismiss
     @Binding  var name:String
     
     var body: some View {
         NavigationStack {
             Form {
                 TextField("Enter Name", text: $name)
                 HStack {
                     Spacer()
                     Button("Submit") {
                         dismiss()
                     }
                     Spacer()
                 }
             }
             .navigationTitle("Add Item")
         }
     }
 }

 struct Presentview_Preview:PreviewProvider {
     static var previews: some View {
         Presentview(name:.constant(""))
     }
 }

 
 
 
 ================
 MARK: - 2. EnvironmentObject :
 ================
 
 
 import SwiftUI

 @main
 struct SwiftUITestApp: App {
     var body: some Scene {
         WindowGroup {
            // ContentView()
             let counter = CounterValue()
             ContentView().environmentObject(counter)
         }
     }
 }



 import SwiftUI


 struct ContentView: View {

     @EnvironmentObject var counter:CounterValue
     
     var body: some View {
         
         NavigationStack {
             VStack(){
                 
                 
                 
                 HStack {
                     Button ("+") {
                         counter.increment()
                     }
                     .frame(width: 35, height: 35)
                     
                     Text("\(counter.value)")
                         .font(.largeTitle)
                     
                     Button ("-") {
                         counter.decrement()
                     }
                     .frame(width: 35, height: 35)
                 }
                 
                // PossitiveCounterView()
                // NegtiveCounterView()
             }
             .toolbar {
                 ToolbarItem(placement: .principal) {
                     VStack (alignment: .leading)  {
                         HStack {
                             Image("profile")
                                 .resizable()
                                 .frame(maxWidth: 30 , maxHeight: 30)
                                 .padding(.bottom, 5)
                                 .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
                             VStack (alignment: .leading) {
                                 Text("Title")
                                     .fontWeight(.bold)
                                     .foregroundColor(.white)
                                     .font(Font.custom("Helvetica Neue Medium", size: 18.0))
                                     .fontWeight(.regular)
                                 
                                 Text("sub title")
                                     .fontWeight(.light)
                                     .foregroundColor(.white)
                                     .font(Font.custom("Helvetica Neue Medium", size: 14))
                                     .fontWeight(.regular)
                             }.padding()
                             
                             Spacer()
                             Image("notification")
                                 .resizable()
                                 .frame(maxWidth: 30 , maxHeight: 30)
                                 .padding(.bottom, 5)
                                 .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
                         }
                     }
                 }
             }
             .toolbarBackground(.visible, for: .navigationBar)
             .toolbarBackground(Color.blue, for: .navigationBar)
             .navigationBarTitleDisplayMode(.inline)
         }
     }
 }


 #Preview {
     ContentView()
 }


 class CounterValue: ObservableObject {
     
     @Published var value:Int = 0
     
     func increment() {
         DispatchQueue.main.async {
             self.value += 1
         }
     }
     
     func decrement() {
         
         DispatchQueue.main.async {
             self.value -= 1
         }
         
     }
 }

 struct PossitiveCounterView:View {
     
     @EnvironmentObject var counter:CounterValue
     
     var body: some View {
         Button("+") {
             counter.increment()
         }
         .padding()
         .background(.red)
         .foregroundStyle(.white)
     }
 }


 struct NegtiveCounterView:View {
     @EnvironmentObject var counter:CounterValue
     
     var body: some View {
         Button("-") {
             counter.decrement()
         }
         .padding()
         .background(.gray)
         .foregroundStyle(.white)
     }
 }

 
 
 
 
 ================
 MARK: - 3. Notification center
 ================
 
 
 import SwiftUI


 extension Notification.Name {
     static let testNotification = Notification.Name("testnotificaiton")
 }


 struct ContentView: View {
     
     @State private var getData:String?
     
     var body: some View {
         
         NavigationStack {
             VStack(){
                 
                 Button("PostNotification") {
                     NotificationCenter.default.post(name: Notification.Name.testNotification, object: "test data passing")
                 }
                 
                 Text(getData ?? "")
                     .onReceive(NotificationCenter.default.publisher(for: Notification.Name.testNotification), perform: {
                         getData = $0.object as? String
                     })
                
             }
             .toolbar {
                 ToolbarItem(placement: .principal) {
                     VStack (alignment: .leading)  {
                         HStack {
                             Image("profile")
                                 .resizable()
                                 .frame(maxWidth: 30 , maxHeight: 30)
                                 .padding(.bottom, 5)
                                 .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
                             VStack (alignment: .leading) {
                                 Text("Title")
                                     .fontWeight(.bold)
                                     .foregroundColor(.white)
                                     .font(Font.custom("Helvetica Neue Medium", size: 18.0))
                                     .fontWeight(.regular)
                                 
                                 Text("sub title")
                                     .fontWeight(.light)
                                     .foregroundColor(.white)
                                     .font(Font.custom("Helvetica Neue Medium", size: 14))
                                     .fontWeight(.regular)
                             }.padding()
                             
                             Spacer()
                             Image("notification")
                                 .resizable()
                                 .frame(maxWidth: 30 , maxHeight: 30)
                                 .padding(.bottom, 5)
                                 .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
                         }
                     }
                 }
             }
             .toolbarBackground(.visible, for: .navigationBar)
             .toolbarBackground(Color.blue, for: .navigationBar)
             .navigationBarTitleDisplayMode(.inline)
         }
     }
 }


 #Preview {
     ContentView()
 }


 */
