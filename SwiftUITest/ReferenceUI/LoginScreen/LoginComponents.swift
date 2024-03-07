
import SwiftUI


    //Model
class LoginViewModel: ObservableObject {
    
    @Published var userName:String = ""
    @Published var password:String = ""
    
    func loginAction() {
        
    }
    
}




import Foundation
import SwiftUI

struct LoginComponentsTextField:View {
    @Binding var data:String
    var title:String?
    
    var body: some View {
        ZStack {
            TextField("", text: $data)
                .padding(.horizontal, 20)
                .frame(height: 42)
                .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                    .stroke(Color.gray, lineWidth: 1)
                )
            HStack {
                Text(title ?? "Input")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background(.white)
                Spacer()
            }
            .padding(.leading)
            .offset(CGSize(width: 0, height: -20))
        }.padding(20)
    }
}

struct LoginComponentsTextField_Previews: PreviewProvider {
    @State static var dataV:String = ""
    static var previews: some View {
        LoginComponentsTextField(data: $dataV, title: "Password")
    }
}




struct LoginComponentsCustomTextFieldView:View {
    @State var inputV:String
    var title:String?
    
    var body: some View {
        ZStack {
            //1
            TextField(title ?? "", text: $inputV)
                .font(.system(size: 14))
                //.padding(.horizontal,20)
                .frame(height: 42)
                .padding(.bottom, 20)
            Divider()
                .frame(height: 0.3)
                .padding(.horizontal, 20)
                .background(Color.gray)
                .padding(.top, 20)
            
        }.padding(.bottom, 3)
    }
}

struct customeTextField_preview:PreviewProvider {
    @State static var dataV:String = ""
    
    static var previews: some View {
        LoginComponentsCustomTextFieldView(inputV: dataV, title: "place")
    }
}
