import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final formKey = new GlobalKey<FormState>();

  String email,Birth_Date, name;
  var number, License_Number;

  Color color = Color.fromRGBO(25, 26, 45, 1);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildSignupForm()
            )
        )
    );
  }

  _buildSignupForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('Enter Your Details',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                  //Dot placement
                  Positioned(
                      top: 62.0,
                      left: 200.0,
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: color)))
                ],
              )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color),
                  )),
              onChanged: (value) {
                this.name = value;
              },
              validator: (value) =>
              value.isEmpty ? 'Name is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color),
                  )),
              onChanged: (value) {
                this.number = value;
              },
              validator: (value) =>
              value.isEmpty ? 'Numer is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
              value.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.Birth_Date = value;
              },
              validator: (value) =>
              value.isEmpty ? 'date of birth is required' : null),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'License Number',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color),
                  )),
              onChanged: (value) {
                this.License_Number = value;
              },
              validator: (value) =>
              value.isEmpty ? 'License Number is required' : validateEmail(value)),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomerDetails()
                  )
              );
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.cyanAccent,
                    color: color,
                    elevation: 7.0,
                    child: Center(
                        child: Text('Book Now',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno')
                        )
                    )
                )
            ),
          ),

        ]
        )
    );
  }

}
