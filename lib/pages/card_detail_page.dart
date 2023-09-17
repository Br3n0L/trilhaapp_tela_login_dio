import 'package:flutter/material.dart';

class CardDetailsPage extends StatefulWidget {
  const CardDetailsPage({super.key});

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nossos Cursos',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Curso de Mecânico',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                    'https://www.sofit4.com.br/wp-content/uploads/2015/02/3-conselhos-para-contratar-os-melhores-mec%C3%A2nicos-.jpg'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Curso de Técnico em Infomática',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                    'https://i2.wp.com/www.elaborata.com.br/blog/wp-content/uploads/2018/06/tecninco-em-informatica-guiatech.jpg?fit=1200%2C800&ssl=1'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Curso de Técnico de Enfermagem',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                    'https://wordpress-cms-gc-prod-assets.quero.space/uploads/2019/07/nurse-measuring-patient-blood-pressure-3-1.jpg'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Curso de Bombeiro Civil',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                    'https://www.grupoalbatroz.com.br/site/views/data/blog/image-1582289276.jpg'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ));
  }
}
