import 'dart:math';
class CalculatorBrain
{
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  String CalculateBMI()
  {
    double _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    double _bmi = 0;
    if(_bmi >= 25)
      {
        return 'OverWeight';
      }
    else if(_bmi > 18.5)
      {
        return 'Normal';
      }
    else
      {
        return 'UnderWight';
      }
  }

  String getInterpretation()
  {
    double _bmi = 0;
    if(_bmi >=25)
      {
        return 'Your have a higher than normal body  weight. Try to exercise more';
      }
    else if(_bmi >= 18.5)
      {
        return 'You have a normal body weight. Good Job';
      }
    else
      {
        return 'You have a lower than a normal body weight. Try to eat more';
      }
  }
}