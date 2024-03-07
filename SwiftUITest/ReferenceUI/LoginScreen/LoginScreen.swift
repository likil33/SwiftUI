
import SwiftUI


struct LoginScreen:View {
    
    @State var email:String  = ""
    @State var password:String  = ""
    @State var showPassword:Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Welcome, My dear user")
                    .font(Font.custom("Helvetica Neue Medium", size: 30.0))
                    .fontWeight(.regular)
                    .padding(.bottom, 47)
                    .padding(.top, 93)
                VStack {
                    //1
                    TextField("Email",text: $email, prompt: Text("Email"))
                        .font(.system(size: 14))
                    // .padding(.horizontal,20)
                    Divider()
                        .frame(height: 0.3)
                        .padding(.horizontal, 20)
                        .background(.gray)
                    
                    //2
                    LoginComponentsCustomTextFieldView(inputV: password, title: "Password")
                    
                    //3
                    // LoginComponentsTextField(data: $password, title: "Password")
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Button {} label: {
                        Text("Login")
                            .fontWeight(.regular)
                            .font(Font.custom("Helvetica Neue", size: 15))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 5/255, green: 22/255, blue: 111/255))
                            .frame(height: 30, alignment:.center)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
//                    Button {} label: {
//                        Text("Reset")
//                            .fontWeight(.regular)
//                            .font(Font.custom("Helvetica Neue", size: 15))
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(.gray)
//                            .frame(height: 30, alignment:.center)
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
//                    }
                }
                .padding(.horizontal, 20)
                
                
                HStack {
                    Button {} label: {
                        Text("Forgot password")
                            .fontWeight(.regular)
                            .font(Font.custom("Helvetica Neue", size: 15))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.gray)
                            .frame(height: 30, alignment:.center)
                            .underline()
                    }
//                    Button {} label: {
//                        Text("Register")
//                            .fontWeight(.regular)
//                            .font(Font.custom("Helvetica Neue", size: 15))
//                            .frame(maxWidth: .infinity)
//                            .foregroundColor(.gray)
//                            .frame(height: 30, alignment:.leading)
//                            .underline()
//                    }
                }
                .padding(.horizontal, 20)
                Spacer()
                
                Button {} label: {
                    Text("New user?, Register Here")
                        .fontWeight(.regular)
                        .font(Font.custom("Helvetica Neue", size: 15))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(red: 1/255, green: 15/255, blue: 3/255))
                        .frame(height: 30, alignment:.leading)
                        .underline()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack (alignment: .leading)  {
                        HStack {
                            Text("Title")
                                .foregroundColor(.white)
                                .font(Font.custom("Helvetica Neue Medium", size: 30.0))
                                .fontWeight(.regular)
                            Spacer()
                        }
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(red: 1/255, green: 15/255, blue: 3/255), for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    LoginScreen()
}

