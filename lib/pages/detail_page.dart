import 'package:flutter/material.dart';
import 'package:state_management_inherited_widget/models/product_model.dart';
import 'package:state_management_inherited_widget/services/product_service.dart';

class DetailPage extends StatefulWidget {
  static const id = "/detail_page";
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ProductService provider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = ProductService.of(context);
  }

  void _checkProduct (value, index) {
    provider.orders[index].isSelected = !provider.orders[index].isSelected;
    if(provider.orders[index].isSelected) {
      provider.addProduct(provider.orders[index]);
    } else {
      provider.removeProduct(provider.orders[index]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(

        itemCount: provider.orders.length,
        itemBuilder: (context, index) {
          List<Product> items = provider.orders;
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
