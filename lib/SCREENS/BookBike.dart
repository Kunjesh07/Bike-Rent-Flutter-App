import 'package:bike_rent/SCREENS/CustomerDetails.dart';
import 'package:bike_rent/SCREENS/Home.dart';
import 'package:flutter/material.dart';

class BookBike extends StatefulWidget {
  const BookBike({Key key}) : super(key: key);

  @override
  State<BookBike> createState() => _BookBikeState();
}

class _BookBikeState extends State<BookBike> {
  Color color = Color.fromRGBO(25, 26, 45, 1);
  DateTime selectedPickupDate = DateTime.now();
  DateTime selectedDropOffDate = DateTime.now();

  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  _selectPickupDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedPickupDate, // Refer step 1
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select pickup date', // Can be used as title
      cancelText: 'Not now',
      confirmText: 'Done',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Pickup date',
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null && picked != selectedPickupDate)
      setState(() {
        selectedPickupDate = picked;
      });
  }

  _selectDropOffDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDropOffDate, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.input,
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select dropOff date', // Can be used as title
      cancelText: 'Not now',
      confirmText: 'Done',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'DropOff date',
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null && picked != selectedDropOffDate)
      setState(() {
        selectedDropOffDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10,top: 45, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Pickup Address',
                    labelStyle: TextStyle(
                          fontSize: 10.0,
                        color: Colors.white
              ),
                  focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Drop Off Address',
                    labelStyle: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )
                ),
              ),
          ),
          SizedBox(height: 50,),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${selectedPickupDate.toLocal()}"
                          .split(' ')[0],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        _selectPickupDate(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(8)
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Select Pick up Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${selectedDropOffDate.toLocal()}"
                          .split(' ')[0],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        _selectDropOffDate(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Select Drop Off Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          SizedBox(height: 20,),
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
                    shadowColor: Colors.blueAccent,
                    color: color,
                    elevation: 7.0,
                    child: Center(
                        child: Text('Book Bike',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno')
                        )
                    )
                )
            ),
          ),
        ],
      ),

    );
  }
}
