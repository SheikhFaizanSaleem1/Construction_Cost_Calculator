import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ConstructionRate_Calculator extends StatefulWidget {

  static const routeName = 'constructioncost';

  @override
  _ConstructionRate_CalculatorState createState() => _ConstructionRate_CalculatorState();
}

class _ConstructionRate_CalculatorState extends State<ConstructionRate_Calculator> {

  int _personcount = 1;
  int  _billamount = 0;
  var _tippercent= 0.0;
  var _splitamount = 0;

  double totalConstructionCost(int ratespersqft,int splitbyperson,double sqyrds){
    double totaltipcals = 0.0;
    if(ratespersqft <= 0 || ratespersqft == null || ratespersqft.toString().isEmpty){

    }else{
      totaltipcals = (ratespersqft * sqyrds) * 9;
      totaltipcals = totaltipcals * splitbyperson;

    }
    return totaltipcals;
  }

  double totalsqFeet(int ratespersqft,double sqyrds){
    double totaltipcals = 0.0;
    if(ratespersqft <= 0 || ratespersqft == null || ratespersqft.toString().isEmpty){

    }else{
      totaltipcals = 9 * sqyrds ;

    }
    return totaltipcals;
  }


  double totalbillmethod(int totalbill,int splitedby,double tolalpercent){
    var perperonby = (totalbill + tolalpercent)/ splitedby;

    return perperonby;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(backgroundColor: cbkclr,
      body:  ListView(
        children: <Widget>[
          Column(
            children: <Widget>[SizedBox(height: 40,),
              Text('Construction Cost Calculator',style: GoogleFonts.roboto(color: prmbtnclr,fontSize: 25,fontWeight: FontWeight.bold),),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color: prmbtnclr,border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(elevation: 10,shadowColor: Colors.black,borderRadius: BorderRadius.circular(15),color: prmbtnclr,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Text('Construction Cost',style:GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20,color: cbkclr),),
                        SizedBox(height: 5,),
                        Center(
                            child: Text(
                              'Rs.${totalConstructionCost(_billamount, _personcount, _tippercent).toStringAsFixed(1)}',
                              style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20,color: cbkclr),
                            ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 300,
                width: 350,
                decoration: BoxDecoration(border: Border.all(color: cbkclr),
                    borderRadius: BorderRadius.circular(15),
                    color: cbkclr),
                child: Material(borderRadius: BorderRadius.circular(15),shadowColor: Colors.black,elevation: 10,color: prmbtnclr,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration:
                              InputDecoration(labelText: 'Enter Rates/Sq.Feet',labelStyle: TextStyle(color: cbkclr,fontWeight: FontWeight.bold)),style:GoogleFonts.roboto(color: cbkclr,fontWeight: FontWeight.bold),keyboardType: TextInputType.numberWithOptions(),onChanged: (String val){
                              try{
                                _billamount = int.parse(val);
                              }catch(exception){
                                _billamount = 0;
                              }

                            },
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                ),
                                Text('Floors',style: GoogleFonts.roboto(color: cbkclr,fontWeight: FontWeight.bold)),
                                Spacer(),
                                InkWell(
                                  onTap: ()=>setState(() {
                                    if(_personcount <= 1 ||_personcount == 0){
                                      return;
                                    }else{
                                      _personcount--;
                                    }

                                  })

                                  ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white70),
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: GoogleFonts.roboto(color: cbkclr,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('$_personcount',style: TextStyle(color: cbkclr,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: ()=>
                                      setState(() {
                                        _personcount++;
                                      }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white70),
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: GoogleFonts.roboto(color: cbkclr,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                Text('Area in Sq.Feet',style: GoogleFonts.roboto(color: cbkclr,fontWeight: FontWeight.bold)),
                                Spacer(),
                                Text('${totalsqFeet(_billamount, _tippercent)}',style: TextStyle(color: cbkclr,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 45,),
                            Column(children: <Widget>[
                              Text('${_tippercent.toStringAsFixed(0)} Sq.Yards',style: TextStyle(color: cbkclr,fontWeight: FontWeight.bold),),
                              Slider(activeColor: cbkclr,value: _tippercent, onChanged: (double percent){
                                setState(() {
                                  _tippercent = percent;
                                });
                              },min: 0,max: 1000,label: '${_tippercent.toStringAsFixed(1)}',divisions: 100,)

                            ],)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
