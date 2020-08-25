import 'package:flutter/material.dart';

class TipCalMain extends StatefulWidget {
  @override
  _TipCalMainState createState() => _TipCalMainState();
}

class _TipCalMainState extends State<TipCalMain> {

  int _personcount = 1;
  int  _billamount = 0;
  var _tippercent= 0.0;
  var _splitamount = 0;

  double totaltip(int billamnt,int splitbyperson,double tippercent){
    double totaltipcals = 0.0;
    if(billamnt <= 0 || billamnt == null || billamnt.toString().isEmpty){

    }else{
     totaltipcals = (billamnt * tippercent) / 100;

    }
    return totaltipcals;
  }

 double totalbillmethod(int totalbill,int splitedby,double tolalpercent){
    var perperonby = (totalbill + tolalpercent)/ splitedby;

    return perperonby;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(backgroundColor: Colors.white,
      body:  ListView(
        children: <Widget>[
          Column(
            children: <Widget>[SizedBox(height: 60,),
              Text('Comission Calculator',style: TextStyle(fontSize: 30,color: Colors.black),),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.transparent,border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    '${totalbillmethod(_billamount, _personcount, _tippercent).toStringAsFixed(1)}',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  )),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 300,
                width: 350,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Enter Amount',labelStyle: TextStyle(color: Colors.black)),style: TextStyle(color: Colors.black),keyboardType: TextInputType.numberWithOptions(),onChanged: (String val){
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
                              Text('Split'),
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
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('$_personcount'),
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
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text('Tip'),
                              Spacer(),
                              Text('${totaltip(_billamount, _personcount, _tippercent).toStringAsFixed(1)}'),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Column(children: <Widget>[
                            Text('${_tippercent.toStringAsFixed(0)}%'),
                            Slider(value: _tippercent, onChanged: (double percent){
                              setState(() {
                                _tippercent = percent;
                              });
                            },min: 0,max: 100,label: '${_tippercent.toStringAsFixed(1)}',divisions: 100,)

                          ],)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
