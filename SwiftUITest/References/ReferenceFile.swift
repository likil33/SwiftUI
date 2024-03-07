/*
 ================
 MARK: - 1. intial start file
================
 start
 
 import SwiftUI

 @main
 struct SwiftUITestApp: App {
     var body: some Scene {
         WindowGroup {
             ContentView()
         }
     }
 }
 
 
 ================
 MARK: - 2. List Dispaly - Add item , Delete item, Move item, Separator Hidden,
 
 .contentShape(Rectangle()) -  complete row clickble inside
 ================
 
 struct ContentView:View {
     
     @State private var friendName:String = ""
     @State private var friends:[String] = ["sssssss","Kumar"]
     
     
     private func deleteTask(indexSet:IndexSet) {
         indexSet.forEach { index in
             friends.remove(at: index)
         }
     }
     
     var body: some View {
         NavigationView {
             VStack {
                 HStack {
                     TextField("Enter Name", text: $friendName)
                         .textFieldStyle(.roundedBorder)
                     Button("Add") {
                         friends.append(friendName)
                         friendName = ""
                     }
                 }
                 List {
                     ForEach(friends, id: \.self) { friend in
                         HStack {
                             Text(friend)
                             Spacer()
                         }.listRowSeparator(.hidden)
                          .contentShape(Rectangle())
                         
                     }.onDelete(perform: deleteTask)
                         .onMove(perform: { indices, newOffset in
                             friends.move(fromOffsets: indices, toOffset: newOffset)
                         })
                 }.listStyle(.plain)
                     .toolbar {
                         EditButton()
                     }
             }.padding()
         }
     }
 }
 
 
 
 ================
 MARK: - 3. Section Header and List display
 ================
 
 import SwiftUI

 struct Post:Identifiable {
     let id = UUID()
     let title:String
     var comments:[Comment]
 }
 struct Comment : Identifiable {
     let id = UUID()
     let title:String
 }

 struct ContentView : View {
     
     init() {
         UITableView.appearance().backgroundColor = UIColor.red
     }
     
     let posts = [Post(title: "Post #1", comments: [Comment(title: "comment1"),Comment(title: "comment2")]),
                  Post(title: "Post #2", comments: [Comment(title: "comment1"),Comment(title: "comment2")]),
                  Post(title: "Post #3", comments: [Comment(title: "comment1"),Comment(title: "comment2")])]
     
     var body: some View {
         NavigationView {
             List {
                 ForEach(posts) { post in
                     Section(header: Text(post.title)) {
                         ForEach(post.comments) { comment in
                             HStack {
                                 Text(comment.title)
                                 Spacer()
                             }.listRowBackground(Color.green)
                         }
                     }
                 }
             }
         }
     }
 }

 
 
 
 ================
 MARK: - 4. ScrollView - Dispaly list of data and background color change
 ================
 
 struct ContentView:View {
     var body: some View {
         ScrollView {
             LazyVStack {
                 ForEach(1...10, id: \.self) { count in
                     HStack {
                         VStack(alignment:.leading){
                             Text("\(count)")
                             Divider()
                         }
                         Spacer()
                     }
                 }
             }
             .padding()
             .background(Color.green)
         }
         .background(Color.gray)
     }
 }
 
 
 
 
 
 ================
 MARK: - 5. Pull to Refresh : List and delete option
 ================
 
 struct ContentView:View {
     @State private var refreshableDate:[Date] = [Date()]
     
     private func onDeletedate(indexSet:IndexSet) {
         indexSet.forEach { index in
             refreshableDate.remove(at: index)
         }
     }
     
     var body: some View {
         NavigationView {
             List {
                 ForEach(refreshableDate, id:\.self) { date in
                     Text("\(date)")
                 }
                 .onDelete(perform: onDeletedate)
             }
             .listStyle(.plain)
             .refreshable {
                 DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                     let dateTime = Date()
                     refreshableDate.append(dateTime)
                 }
             }
         }
         .navigationTitle("Pull to refresh Date list")
     }
 }
 
 
 
 
 
 
 ================
 MARK: - 5. Search or Filter : List
 ================
 import SwiftUI


 struct Place:Identifiable {
     let id = UUID()
     let name:String
     let photo:String
 }

 func getPlacesList() -> [Place] {
     return [
            Place(name: "Add", photo: "add"),
            Place(name: "Camera", photo: "camera"),
            Place(name: "Search Gray", photo: "searchgray"),
            Place(name: "Search White", photo: "searchWhite"),
            Place(name: "typeC Port", photo: "typeCPorts"),
            Place(name: "USB Port", photo: "usbPorts")
     ]
 }

 struct ContentView:View {
     
     @State private var places = getPlacesList()
     @State private var search = String()
     
     var body: some View {
         NavigationView {
             List(places) { place in
                 HStack(alignment: .top ) {
                     Image(place.photo)
                         .resizable()
                         .frame(maxWidth: 50, maxHeight: 50)
                         .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                     Text(place.name)
                         .font(.title)
                 }
             }.listStyle(.plain)
                 .searchable(text: $search)
                 .onChange(of: search, perform: { newValue in
     if !newValue.isEmpty && newValue.count >= 1 {
                         places = places.filter {
                             $0.name.lowercased().hasPrefix(newValue.lowercased())
                         }
                     }
                     else {
                         places = getPlacesList()
                     }
                 })
             
                 .navigationTitle("Places")
         }
     }
 }


 #Preview {
     ContentView()
 }
 
 
 
 // 2part//=======================================
 
 import SwiftUI


 struct info : Identifiable {
     let id = UUID()
     let name:String
     let photo:String
 }

 func getPlacesList() -> [info] {
     return [
         info(name: "Add", photo: "add"),
         info(name: "Camera", photo: "camera"),
         info(name: "Search Gray", photo: "searchgray"),
         info(name: "Search White", photo: "searchWhite"),
         info(name: "typeC Port", photo: "typeCPorts"),
         info(name: "USB Port", photo: "usbPorts")
     ]
 }


 struct ContentView:View {
     @State var listOfInfo = getPlacesList()
     @State var search:String = ""
     
     @State private var selectedCustomerIds = Set<UUID>()
     
     var body: some View {
         NavigationStack {
             List (selection: $selectedCustomerIds) {
                 ForEach(listOfInfo) { post in
                     HStack {
                         Image(post.photo)
                             .resizable()
                             .frame(maxWidth: 50, maxHeight: 50)
                             .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                         Text(post.name)
                     }
                     .swipeActions(edge: .leading, allowsFullSwipe: true) {
                         Button {
                             print("Heart")
                         } label: {
                             Label("Heart",systemImage: "heart.circle")
                         }.tint(.yellow)
                     }
                     .swipeActions (edge: .trailing ) {
                         Button {
                             print("Archive")
                         } label: {
                             Label("Archive", systemImage: "archivebox.circle.fill")
                         }
                     }
                 }
                 
             }.toolbar {
                 //EditButton()
                 ToolbarItem(placement: .principal ) {
                     VStack (alignment: .leading) {
                         HStack {
                             Text("Selected list: \(selectedCustomerIds.count)")
                             Spacer()
                             EditButton()
                         }
                     }
                 }
             }
         }
         
     }
 }


 #Preview {
     ContentView()
 }

 
 

 
 ================
 MARK: - 6. Sample Login Form : Screen design
 ================
 
 import SwiftUI


 struct ContentView:View {
     
     @State var name:String  = ""
     @State var password:String  = ""
     @State var showPassword:Bool = false
     
     var isSignInButtonDisabled:Bool {
         [name, password].contains(where: \.isEmpty)
     }
     
     var body: some View {
         VStack(alignment: .leading, spacing: 15) {
             Spacer()
             TextField("Name", text: $name, prompt: Text("Please enter name").foregroundColor(.blue))
                 .padding(10)
                 .overlay {
                     RoundedRectangle(cornerRadius: 10)
                         .stroke(.gray, lineWidth: 2)
                 }
                 .padding(.horizontal)
                     
             HStack {
                 Group {
                     if showPassword {
                         TextField("Password", text: $password, prompt: Text("Please enter Password").foregroundColor(.blue))
                     }
                     else {
                         SecureField("Password", text: $password, prompt: Text("Please enter Password").foregroundColor(.blue))
                     }
                 }
                 .padding(10)
                 .overlay {
                     RoundedRectangle(cornerRadius: 10)
                         .stroke(.gray, lineWidth: 2)
                 }
                 
                 Button {
                     showPassword.toggle()
                 } label: {
                     Image(systemName: showPassword ? "eye.slash" : "eye")
                         .foregroundColor(.red)
                 }
             }.padding(.horizontal)
             Spacer()
             
             Button {
                 print("Login")
             } label: {
                 Text("Sign In")
                     .font(.title2)
                     .bold()
                     .foregroundColor(.white)
             }
             .frame(height: 50)
             .frame(maxWidth: .infinity)
             .background(
                 isSignInButtonDisabled ?
                 LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomLeading) :
                 LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomLeading))
             .cornerRadius(20)
             .disabled(isSignInButtonDisabled)
             .padding()
         }
     }
 }

 #Preview {
     ContentView()
 }

 
 
 ================
 MARK: - 7. Navigation Bar and Sections with collapse - list
 ================
 
 
 import SwiftUI

 let navBarAppearence = UINavigationBarAppearance()


 struct Numbers:Identifiable {
     let id = UUID()
     let number:String
 }

 struct Sections:Identifiable {
     let id = UUID()
     let Name:String
     let numbers:[Numbers]
 }
  

 func getPlacesList() -> [Sections] {
     return [
         Sections(Name: "Section1", numbers: [Numbers(number: "1"),Numbers(number: "2"),Numbers(number: "3"),Numbers(number: "4")]),
         Sections(Name: "Section2", numbers: [Numbers(number: "1"),Numbers(number: "2"),Numbers(number: "3")]),
         Sections(Name: "Section3", numbers: [Numbers(number: "1"),Numbers(number: "2")]),
         Sections(Name: "Section4", numbers: [Numbers(number: "1"),Numbers(number: "2"),Numbers(number: "3"),Numbers(number: "4")])
     ]
 }

 struct ContentView: View {
     @State var themeColor = Color.green
     
     @State private var numbersList = getPlacesList()
     @State private var selectName:String?
     @State private var expanded:Bool = false
     
     
     var body: some View {
         NavigationStack {
             VStack {
                 List(numbersList) {sect in
                     VStack (alignment: .leading){
                         HStack {
                             Text(sect.Name)
                                 .fontWeight(.bold)
                                 .padding(.bottom, 10)
                             Spacer()
                             Image(systemName: selectName == sect.Name ? "chevron.down" : "chevron.right")
                         }
                         .contentShape(Rectangle())
                         .onTapGesture(perform: {
                             expanded.toggle()
                             if selectName != sect.Name {
                                 expanded = true
                             }
                             selectName = expanded ? sect.Name : nil
                             print(selectName == sect.Name)
                             print(selectName)
                         })
                         
                         if selectName == sect.Name {
                             ForEach(sect.numbers) { num in
                                 Text(num.number)
                             }
                         }
                     }
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

 
 
 
 ================
 MARK: - 7. Check Mark and unCheck mark
 ================
 
 import SwiftUI


 struct ContentView: View {
    
     let students = ["ssssssss", "kumar", "koneti", "iiiiiii", "mmmmmmmmm", "ssssss kumar", "mkmkmkmkmk", "gggggggggggg"]
     @State private var selectedStudents:[String] = [String]()
     
     var body: some View {
         NavigationStack {
             VStack {
                 List(students, id:\.self) {name in
                     HStack {
                         Text(name)
                         Spacer()
                         ZStack {
                             if selectedStudents.contains(name) {
                                 Image(systemName: "checkmark.square.fill")
                                     .font(.largeTitle)
                             }
                             else {
                                 Image(systemName: "square")
                                     .font(.largeTitle)
                             }
                             
                         }.foregroundStyle(.blue)
                             .onTapGesture {
                                 if selectedStudents.contains(name) {
                                     selectedStudents = selectedStudents.filter {$0 != name }
                                 }
                                 else {
                                     selectedStudents.append(name)
                                 }
                             }
                         
                     }
                 }
                 
                 VStack {
                     List (selectedStudents, id:\.self) { nam in
                         Text(nam)
                     }
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



 ================
 MARK: - 8. Zoom and TapGesture actions
 ================
 
 import SwiftUI


 struct ContentView: View {
     
     @State private var currentScale:CGFloat = 1.0
     @GestureState private var zoomFactor:CGFloat = 1.0
     
     let newGesture = TapGesture().onEnded {
         print("Tap on VStack.")
     }
     
   
     var magnification:some Gesture {
         return MagnificationGesture()
             .updating($zoomFactor) { value, scale, transaction in
                 scale = value
                 print(zoomFactor)
             }.onEnded { value in
                 currentScale *= value
             }
     }
     
     var body: some View {
         NavigationStack {
             VStack {
                 Image("usbPorts")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .scaleEffect(currentScale * zoomFactor)
                     .gesture(magnification)
                 Spacer()
                 
                 VStack(spacing:25) {
                     Image(systemName: "heart.fill")
                         .resizable()
                         .frame(width: 75, height: 75)
                         .padding()
                         .foregroundColor(.red)
                         .onTapGesture {
                             print("Tap on image.")
                         }
                     Rectangle()
                         .fill(Color.blue)
                     Text("dddd")
                 }
                 .gesture(newGesture)
                 .frame(width: 200, height: 200)
                 .border(Color.purple)
                 
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


 
 
 ================
 MARK: - 8. Rotation of View
 ================
 
 
 import SwiftUI


 struct ContentView: View {
     
     @State private var valueD:Double = 0
     
     var body: some View {
         NavigationStack {
             VStack {
                 Image("usbPorts")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .rotationEffect(.degrees(valueD))
                     .animation(.default, value: valueD)
                 Button{ valueD += 90 } label: {
                     Text("On Click For Image Rotation")
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


 ================
 MARK: - 8. View Moves position with animation
 ================
 
 
 import SwiftUI


 struct ContentView: View {
     
    @State private var position = CGPoint(x: 100, y: 100)
     @State private var removeV:Bool = false
     
     var body: some View {
         NavigationStack {
             VStack {
                 Image("usbPorts")
                     .resizable()
                     .frame(maxWidth: 100, maxHeight:100)
                     .zIndex(1.0)
                     .position(position)
                     .gesture(DragGesture()
                         .onChanged({ value in
                             position = value.location
                             
                             if position.y > (UIScreen.current?.bounds.size.height ?? 1000) / 1.5  {
                                 removeV = true
                             }
                             else {
                                 removeV = false
                             }
                             
                         }))
                 
                 
                 Text("Remove")
                     .fontWeight(.bold)
                     .foregroundStyle(removeV ? Color.red : Color.gray)
                     
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




 extension UIWindow {
     static var current: UIWindow? {
         for scene in UIApplication.shared.connectedScenes {
             guard let windowScene = scene as? UIWindowScene else { continue }
             for window in windowScene.windows {
                 if window.isKeyWindow { return window }
             }
         }
         return nil
     }
 }


 extension UIScreen {
     static var current: UIScreen? {
         UIWindow.current?.screen
     }
 }


 
 */
