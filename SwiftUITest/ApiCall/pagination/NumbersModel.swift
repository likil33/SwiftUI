
import Foundation



class NumbersModel:ObservableObject {
    
    @Published var listInfo:[Int] = []
    
    func populateInfo(page:Int) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/data?page=\(page)") else {return}
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            
            guard let data = data, error == nil else {return}
            
            let listInfo = try? JSONDecoder().decode([Int].self, from: data)
            
            DispatchQueue.main.async {
                self.listInfo.append(contentsOf: listInfo ?? [])
            }
        }.resume()
        
    }
    
    
    func loadApi(index:Int) -> Bool {
        return index == listInfo.count - 2
    }
}



