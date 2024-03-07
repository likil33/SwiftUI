

import SwiftUI



struct ContentView: View {
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
            }
            .background(Color.gray.opacity(0.1))
            .padding(.all, 10)
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


