

import SwiftUI


struct PageNationListScreen: View {
   
    @StateObject private var listInfoVM = NumbersModel()
    @State private var currentPage:Int = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List(listInfoVM.listInfo, id:\.self) {info in
                    Text("\(info)")
                        .onAppear(perform: {
                            if listInfoVM.loadApi(index: info) {
                                currentPage += 1
                                listInfoVM.populateInfo(page: currentPage)
                            }
                        })
                }.onAppear(perform: {
                    listInfoVM.populateInfo(page: 1)
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
    PageNationListScreen()
}


