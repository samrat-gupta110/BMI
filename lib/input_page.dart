import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons_content.dart';
import 'reusable.dart';
import 'constants.dart';
import 'result_page.dart';
import 'RoundIcons_button.dart';
import 'bottom_button.dart';
import 'calulated_brain.dart';

enum Gender
{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  get onPressed => null;
   Gender? selectedgender;
   int height = 180;
   int weight = 60;
   int Age = 12;
  //Color maleCardColour = inactivecardcolor;
  //Color femaleCardColour = inactivecardcolor;

  //1 == male and 2 == female;
 // void updateColour(Gender selectedgender)
  //{
   // if(selectedgender == Gender.male)
     // {
       // if(maleCardColour == inactivecardcolor)
         // {
           // maleCardColour = activecardcolor;
            //femaleCardColour = inactivecardcolor;
         // }
        //else
          //{
            //maleCardColour = inactivecardcolor;
          //}
      //}
    //if(selectedgender == Gender.female)
      //{
        //if(femaleCardColour == inactivecardcolor)
          //{
            //femaleCardColour = activecardcolor;
            //maleCardColour = inactivecardcolor;
          //}
        //else
          //{
            //femaleCardColour = inactivecardcolor;
          //}
      //}
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedgender = Gender.male;
                      });
                      print('Male card was pressed');
                    },
                    child: ReusableCard(
                      colour: selectedgender == Gender.male ? kActivecardcolor: kInactivecardcolor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                    ),
                  )
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedgender = Gender.female;
                      });
                      print('Female is pressed');
                    },
                    child: ReusableCard(
                      colour:selectedgender == Gender.female ? kActivecardcolor:kInactivecardcolor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  )
              ),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: kActivecardcolor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                        height.toString(),
                      style: kTextlabelstyle,
                    ),
                    Text(
                        'cm',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor:  Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x15EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }
                  ),
                ),
              ],

            ),)
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: kActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'WEIGHT',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      weight.toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                            },
                        ),
                      ],
                    ),
                  ],
                ),)
              ),
              Expanded(child: ReusableCard(
                colour: kActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Age.toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              Age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              Age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),)
              ),
            ],
          )),
          BottomButton(buttonTitle: 'CALCULATE', onTap: ()
            {
              CalculatorBrain calc = CalculatorBrain(
                  height: height, weight: weight
              );
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.CalculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),),);
            },
          ),
        ],
      )
    );
  }
}

