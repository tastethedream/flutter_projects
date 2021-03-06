import 'package:customer_record_app/screens/customer/customer_screen.dart';
import 'package:customer_record_app/services/database.dart';
import 'package:customer_record_app/shared/constants.dart';
import 'package:customer_record_app/shared/loading.dart';
import 'package:flutter/material.dart';

class AddNewCustomer extends StatefulWidget {

  @override

  _AddNewCustomerState createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String name = '';
  String email = '';
  String mobile= '';
  String appointments = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
          backgroundColor: Colors.pink[300],
          elevation: 0.0,
          title: Text('Add a new customer'),

      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Name'),
                      validator: (val) => val.isEmpty ? 'Please enter customers name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      }
                  ),

                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:  'Email'),
                      validator: (val) => val.isEmpty ? 'Please enter customer email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                  ),

                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Mobile number'),
                    validator: (val) => val.length < 6 ? 'Please enter a contact telephone' : null,
                    onChanged: (val) {
                      setState(() => mobile = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.pink[300],
                      child: Text(
                        'Add New Customer',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          setState(() => loading = true);


                          //dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          //if(result == null) {
                            //setState(() {
                              //error = 'Please provide correct details to register';
                              //loading = false;
                           // });
                          }
                        }


                  ),
                  SizedBox(height: 20.0),
                  /*Text(
                    'error',
                    style: TextStyle(color: Colors.red, fontSize: 14.0 ),
                  )*/

                ],
              ),
            )
        ),
      ),

    );
  }
}
//await DatabaseService().createCustomerRecord('Sue Smith', 'sue@sue.com', '0700123456', '1');
//Navigator.push(
//context,
//MaterialPageRoute(builder: (context) => CustomerScreen())