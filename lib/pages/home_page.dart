import 'package:flutter/material.dart';
import 'package:state_management_inherited_widget/models/product_model.dart';
import 'package:state_management_inherited_widget/pages/detail_page.dart';
import 'package:state_management_inherited_widget/services/product_service.dart';

class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ProductService provider;

  List<Product> items = [
    Product("1", "Apple", "5000", "https://images.unsplash.com/photo-1619546813926-a78fa6372cd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    Product("2", "Peach", "8000", "https://images.unsplash.com/photo-1642372849486-f88b963cb734?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
    Product("3", "Apricot", "6000", "https://images.unsplash.com/photo-1624835020714-f9521e3e1421?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
    Product("4", "Pear", "7000", "https://images.unsplash.com/photo-1615485925694-a03ef8fd9e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
  ];
  
  void _navigateDetail() {
    Navigator.pushNamed(context, DetailPage.id);
  }

  void _checkProduct (value, index) {
    items[index].isSelected = !items[index].isSelected;
    if(items[index].isSelected) {
      provider.addProduct(items[index]);
    } else {
      provider.removeProduct(items[index]);
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = ProductService.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: _navigateDetail,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart, color: Colors.black, size: 35,),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(provider.orders.length.toString(), style: const TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
       body: ListView.builder(
         itemCount: items.length,
         itemBuilder: (context, index) {
           return ListTile(
             horizontalTitleGap: 30,
             leading: Image.network(items[index].image, height: 60, width: 60, fit: BoxFit.cover,),
             title: Text(items[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
             subtitle: Text("${items[index].price} so'm", style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600),),
             trailing: Checkbox(
               value: items[index].isSelected,
               onChanged: (value) => _checkProduct(value, index),
             ),
           );
         },
       ),
    );
  }
}
