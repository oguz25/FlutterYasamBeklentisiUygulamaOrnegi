import './result_page.dart';
import './user_data.dart';

import './constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'myCinsiyet.dart';
import 'myContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporSayisi = 0.0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Haftada kaç kez spor yapıyorsunuz',
                    style: kMetinStili,
                  ),
                  Text(
                    sporSayisi.round().toString(),
                    //'${sporSayisi.round()}',
                    style: kSliderSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: sporSayisi,
                    onChanged: (double newValue) {
                      setState(() {
                        sporSayisi = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde kaç sigara içiyorsunuz',
                    style: kMetinStili,
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    //'${icilenSigara.round()}',
                    style: kSliderSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: MyCinsiyet(
                      cinsiyet: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: MyCinsiyet(
                      cinsiyet: 'ERKEK',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                        kilo: kilo,
                        boy: boy,
                        seciliCinsiyet: seciliCinsiyet,
                        sporSayisi: sporSayisi,
                        icilenSigara: icilenSigara,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'HESAPLA',
                style: kMetinStili,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSliderSayiStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 12,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 12,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kilo--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
