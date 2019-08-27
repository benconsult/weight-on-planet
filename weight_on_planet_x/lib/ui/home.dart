import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }


}

class HomeState extends State {
  /*https://www.livescience.com
  multipliers
  venus=0.91
  * pluto=0.06
  * mercury=0.38
  * jupiter=2.34
  * uranus=0.94
  * earth=1.00
  * mars=0.38
  * neptune=1.19
  * weight = mass * multiplier(surface gravity)
  * */
  final TextEditingController _weightController = new TextEditingController(); //a controller for input TextField

  int radioValue = 0; //initializing radio button to value 0
  double _finalResult = 0.0; //holds final result
  String _formattedText = ""; //customizing the Textfield final result

  //method to handle radio button
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(
              _weightController.text, 0.06); //arguments==real value
          _formattedText =
          "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
          "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText =
          "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey, //background body
      body: new Container(
          alignment: Alignment.center,
          child: new ListView(
            padding: const EdgeInsets.all(2.5),
            children: <Widget>[
              new Image.asset('images/planet.png',
                height: 113.0,
                width: 288.0,),

              new Container(
                margin: EdgeInsets.all(3.8),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _weightController,
                      //passing controller variable to textfield
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Your Weight On Earth',
                        hintText: 'In Pounds',
                        icon: new Icon(Icons.person_outline),
                      ),),
                    new Padding(padding: EdgeInsets.all(5.0)), //after textfield
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //3 radio buttons
                        new Radio<int>(activeColor: Colors.brown,
                            value: 0,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                        new Text("pluto",
                          style: new TextStyle(color: Colors.white30),),
                        new Radio<int>(activeColor: Colors.red,
                            value: 1,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                        new Text(
                          "Max", style: new TextStyle(color: Colors.white30),),
                        new Radio<int>(activeColor: Colors.orangeAccent,
                            value: 2,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                        new Text("Venus",
                          style: new TextStyle(color: Colors.white30),),
                      ],
                    ),
                    //result text
                    new Padding(padding: new EdgeInsets.all(15.6)),
                    new Text(
                      _weightController.text.isEmpty
                          ? "Please Enter Your Weight"
                          : _formattedText + " lbs",
                      // "$_formattedText lbs",  //passing finalResult variable
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 19.4,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
            ],
          )
      ),

    );
  }
//params==variables
  double calculateWeight(String weight, double multiplier) {
    //condition to check null value
    if (int
        .parse(weight)
        .toString()
        .isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("wrong");
      return int.parse("180") * 0.38; //0.38 is the default planet
    }
  }

}

