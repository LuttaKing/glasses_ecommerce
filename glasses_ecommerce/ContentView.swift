//
//  ContentView.swift
//  glasses_ecommerce
//
//  Created by Denilson Washuma on 20/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText:String = ""
    
    @State private var shopItems:[Dictionary<String, Any>] = [
        ["name":"Tifanny Glasses","price":250,"rating":5,"color":Color.green.opacity(0.2) ,"reviews":90,"image":"glass3"],
        ["name":"Alisso Glasses","price":150,"rating":5,"color":Color.cyan.opacity(0.2) ,"reviews":51,"image":"glass5"],
        ["name":"Coolest Glasses","price":308,"rating":5,"color":Color.purple.opacity(0.2) ,"reviews":13,"image":"glass2"],
        ["name":"Tifanny Glasses","price":425,"rating":5,"color":Color.blue.opacity(0.2) ,"reviews":90,"image":"glass4"],
    ]
    
    // Create a grid with 2 columns
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("man")
                        .resizable()
                       // .padding(4)
                        .frame(width: 60,height: 60)
                    .cornerRadius(8)
                    .padding(.trailing,4)
                    
                    VStack(alignment:.leading,spacing: 0){
                        Text("Hello Washum,")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        Rectangle().fill(.clear)
                            .frame(height: 9)
                        Text("Welcome back!")
                            .font(.system(size: 16))
                        
                    }
                    Spacer()
                    
                    
                    
                    ZStack {
                        Image(systemName: "bell")
                            .resizable()
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(width: 40,height: 40)
                            .background(Color("myBlack"))
                        .cornerRadius(9)
                    .padding(.trailing,4)
                        
                        Circle().fill(.red).frame(width: 8,height: 8).offset(x:5,y: -8)
                    }
                    
                    
                }
                
                
                
                HStack {
                    ZStack(alignment: .leading) {
                              RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.1))
                                  .frame(height: 51)
                              
                        HStack(spacing:0) {
                                  Image(systemName: "magnifyingglass")
                                      .resizable()
                                      .frame(width: 25,height: 25)
                                      .foregroundColor(.gray)
                                      .padding(.leading, 20)
                                  
                                  TextField("Search Glasses", text: $searchText)
                                      .padding(.leading, 20)
                                      .fontWeight(.medium)
                              }
                              
                          }
                    .padding(.trailing,10)
                    
                    
                    
                    
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 50,height: 50)
                        .background(Color("myBlack"))
                    .cornerRadius(9)
                .padding(.trailing,4)
                    
                    
                }
                .padding(.top)
                  
                
              
                ZStack {
                    
                    Image("glass2")
                            .resizable()
                            .frame(height: 180)
                            .padding(.horizontal,35)
                            .frame(maxWidth:.infinity)
                            .background(.yellow.gradient)
                        .cornerRadius(10)
                        .padding(.top)
                    .padding(.bottom,5)
                    
                    Text("27% OFF")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.black)
                        .offset(x:30,y:-50)
                }
                
                HStack{
                    Indicator(sizee:12)
                    Indicator()
                    Indicator()
                    Indicator()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20) {
                        SomeCategory(name: "Newest")
                        SomeCategory(name: "Best Selling")
                        SomeCategory(name: "Men")
                        SomeCategory(name: "Women")
                        SomeCategory(name: "Children")
                        
                    }
                }
                .padding(.top)
                .padding(.bottom)
                
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns:columns,spacing: 20){
                        ForEach(0..<shopItems.count, id: \.self) { index in
                            ProductCard(product: shopItems[index])
                            
                        }
                        
                    }
                }
                
                    
          Spacer()
          
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}

struct Indicator: View {
   var sizee:Double = 8
    var body: some View {
        Circle()
            .fill(.gray.opacity(0.35))
            .frame(width: sizee ,height: sizee)
    }
}

struct SomeCategory: View {
    var name:String
    var body: some View {
        Text(name)
            .font(.system(size: 18))
            .fontWeight(name == "Newest" ? .semibold :.medium)
            .foregroundStyle(name == "Newest" ? .black : .gray)
    }
}


struct ProductCard: View {
  var product:Dictionary<String, Any>
    
    
    var body: some View {
//
//        ["name":"Tifanny Glasses","price":250,"rating":5,"color":Color.green ,"reviews":90,"image":"glass3"],
        VStack(spacing:0) {
            Image("\(product["image"] ?? "glass2")")
                .resizable()
                .frame(width: 150,height: 100)
                .padding(8.5)
                .background(product["color"] as? Color ?? .green)
                .cornerRadius(7)
            
            Text("\(product["name"] as! String )")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .padding(.vertical,5)
            
            Text("$\(product["price"] as? Int ?? 100)")
                .font(.system(size: 15))
                .fontWeight(.semibold)
            
            HStack(spacing:15){
                ForEach(1..<5){ index in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 1.5,height: 1.5)
                }
                Text("\(product["reviews"] as? Int ?? 1)")
                    .font(.system(size: 16))
                // .fontWeight(.thin)
                    .foregroundStyle(.gray)
                
            }
            .padding(.vertical,10)
            
        }
        .background(.white)
        .cornerRadius(7)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
    }
}


