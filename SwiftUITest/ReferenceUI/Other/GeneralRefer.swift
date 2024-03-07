


/*
 VStack {
     VStack {
         DashBoardTitleView(title: "Dashboard")
         ScrollView(.horizontal){
                 HStack{
                     ForEach(1...5, id:\.self) { idx in
                         TopHScrollView()
                     }
                 }
                 .padding(.trailing, 10)

         }
         DashBoardTitleView(title: "Incident Priority")
         ScrollView(.horizontal){
                 HStack{
                     ForEach(1...3, id:\.self) { idx in
                         IncidentPriorityHView()
                     }
                 }
                 .padding(.trailing, 10)

         }
         
         dropHScrollView()
         dropHScrollView()
         dropHScrollView()
         
         Spacer()
     }
     .padding(.leading, 10)
     .background(Color.gray.opacity(0.1))
 }
 
 
 struct DashBoardTitleView:View {
     var title:String
     
     var body: some View {
         HStack {
             Text(title)
                 .font(.subheadline)
                 .frame(maxWidth: .infinity, alignment: .leading)
         }
         .padding(.top, 10)
     }
 }


 struct TopHScrollView : View {
     var body: some View{
         
         HStack{
             VStack (alignment: .leading) {
                 Text("40%")
                     .fontWeight(.regular)
                     .font(Font.custom("Helvetica Neue", size: 18))
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .foregroundColor(.black)
                     
                 Text("Find near you")
                     .font(Font.custom("Helvetica Neue", size: 12))
                     .foregroundColor(.gray)
                     .frame(maxWidth: .infinity, alignment: .leading)
             }
             Image("email")
                 .resizable()
                 .frame(maxWidth: 30 , maxHeight: 30)
                 .padding(.bottom, 5)
                 .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
             
         }
         .frame(maxWidth: 120)
         .padding()
         .background(.white)
         .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
         
     }
 }

 struct IncidentPriorityHView : View {
     var body: some View{
         
         Rectangle()
             .fill(.white)
             .frame(width:UIScreen.main.bounds.size.width-40, height: 200)
             .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
     }
 }



 struct dropHScrollView : View {
     var body: some View{
         
         HStack{
             Image("email")
                 .resizable()
                 .frame(maxWidth: 30 , maxHeight: 30)
             Text("Recent Incidents")
                 .font(Font.custom("Helvetica Neue", size: 16))
                 .foregroundColor(.black)
                 .frame( alignment: .leading)
             Spacer()
             Image("password")
                 .resizable()
                 .frame(maxWidth: 20 , maxHeight: 20)
             
         }
         .frame(width: UIScreen.main.bounds.size.width-40, height: 35)
         .padding(.all, 10)
         .background(.white)
         .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
         
     }
 }

 */
