import 'package:customer_record_app/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer_tile.dart';

class CustomerList extends StatefulWidget {

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {

    final customers = Provider.of<List<Customer>>(context) ;
     customers.forEach((customer) {
      print(customer.name);
      print(customer.email);
      print(customer.mobile);
      print(customer.appointments);
   });

    return ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          return CustomerTile(customer: customers[index]);
        }
    );
  }
}
