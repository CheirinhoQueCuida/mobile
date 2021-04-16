import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key? key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Sobre Nós"),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, conbstraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                height: 100,
                child: CachedNetworkImage(
                    imageUrl:
                        "https://i2.wp.com/cheirinhoquecuida.com.br/wp-content/uploads/2020/04/cropped-1-1-2.png?fit=1500%2C579&ssl=1"),
              ),
              Divider(
                color: AppColors.secondaryColor,
                height: 60,
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      height: conbstraints.maxWidth * 0.35,
                      width: conbstraints.maxWidth * 0.35,
                      child: CachedNetworkImage(
                          imageUrl:
                              "https://assets.nfadevelop.com.br/dbimg/img41.png")),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 20, 0),
                      height: conbstraints.maxWidth * 0.35,
                      child: RichText(
                        text: TextSpan(
                          text: 'Me chamo ',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Valdirene Alves',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ', mas todos me conhecem como '),
                            TextSpan(
                                text: 'Vall Batistáh',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' tenho ',
                            ),
                            TextSpan(
                                text: '40 anos.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    ' Sou formada em pedagogia, tecnólogo em terapias integrativa e pós graduada em Naturopatia.'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: AppColors.secondaryColor,
                height: 60,
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Sempre gostei de ensinar e sou apaixonada pelas ',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'medicinas alternativas',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            ', até que em um momento muito delicado na minha vida tive que aplicar todos esses conhecimentos devido a um câncer que acometeu minha mãe.',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'As ',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'terapias integrativas trouxe conforto',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            ', os poucos meses de vida que a medicina tradicional previa para minha mãe durou anos e depois de seu falecimento diante ao luto pela sua perda, resolvi ir a luta.',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Fundei a ',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Cheirinho Que Cuida Terapias Integrativas',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            ', nesse período me dediquei mais enfaticamente na arte e poder dos aromas, passei a promover workshops e palestras relacionados ao tema com um único e principal objetivo, cuidar de pessoas.',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Hoje me dedico somente na arte de ensinar sobre as ',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'práticas integrativas ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            'e todos os benefícios que elas nos traz para termos mais ',
                      ),
                      TextSpan(
                          text: 'equilibrio, saúde e qualidade de vida ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'no intuito de ',
                      ),
                      TextSpan(
                          text: 'cuidar de pessoas.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Pois a natureza tem um arsenal de cura, basta sabermos usá-las!',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Sejam Bem-Vindos! Entre e fique à vontade.',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Vall Batistáh - Terapeuta integrativa',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
