import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_elevated_button.dart';

class ViagemCriadaView extends StatelessWidget {
  const ViagemCriadaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LayoutBuilder(builder: (context, viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/illustração_send.png",
                        width: 127.9, height: 128.31),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "Viagem criada",
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Vamos ver os volumes já disponíveis para a sua viagem.",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Ao prosseguir, você declara para efeitos legais, administrativos, jurídicos e demais aplicáveis, a veracidade de todas as informações prestadas antes, durante e após qualquer uma das etapas do app.",
                        style: TextStyle(fontSize: 12,
                        color: Color.fromRGBO(34, 34, 34, 0.54)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          CustomElevatedButton(onPress: () {
            Navigator.of(context).pop();
          }, text: "Visualizar volumes",)
        ],
      ),
    );
  }
}
