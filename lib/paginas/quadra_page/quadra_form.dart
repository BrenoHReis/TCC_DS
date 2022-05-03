// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc/paginas/widgets/input_field.dart';

import '../../models/quadra_model.dart';

class QuadraForm extends StatefulWidget {
  final QuadraModel? quadra;
  const QuadraForm({this.quadra,Key? key}) : super(key: key);

  @override
  State<QuadraForm> createState() => _QuadraFormState();
}

class _QuadraFormState extends State<QuadraForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  QuadraModel quadra = QuadraModel();

  @override
  void initState(){
    super.initState();
    if(widget.quadra != null){
      quadra = widget.quadra!;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              InputField(
                "Nome",
                Icons.autofps_select_sharp,
                false,
                initialValue: quadra.nome,
                validator:(value){
                  if (value!.isEmpty){
                    return "Campo não pode ficar vazio";
                  }
                },
                onsaved: (value){
                  quadra.nome = value;
                },
              ),
              InputField(
                "Descrição",
                Icons.description_outlined,
                false,
                initialValue: quadra.descricao,
                validator:(value){
                  if(value!.isEmpty){
                    return "Campo não pode ficar vazio";
                  }
                },
                onsaved: (value){
                  quadra.descricao = value;
                },
              ),
              InputField(
                "Endereço",
                Icons.description_outlined,
                false,
                initialValue: quadra.endereco,
                validator:(value){
                  if(value!.isEmpty){
                    return "Campo não pode ficar vazio";
                  }
                },
                onsaved: (value){
                  quadra.endereco = value;
                },
              ),
              InputField(
                "Bairro",
                Icons.description_outlined,
                false,
                initialValue: quadra.bairro,
                validator:(value){
                  if(value!.isEmpty){
                    return "Campo não pode ficar vazio";
                  }
                },
                onsaved: (value){
                  quadra.bairro = value;
                },
              ),
              InputField(
                "Número",
                Icons.description_outlined,
                false,
                initialValue: "${quadra.numero}",
                keyboardType: TextInputType.number,
                validator:(value){
                  if(value!.isEmpty){
                    return "Campo não pode ficar vazio";
                  }
                },
                onsaved: (value){
                  quadra.numero = value;
                },
              ),
              InputField(
                "Cidade",
                Icons.description_outlined,
                false,
                initialValue: quadra.cidade,
                validator:(value){
                  if(value!.isEmpty){
                    return "Campo não pode ficar vazio";
                  }
                },
                onsaved: (value){
                  quadra.cidade = value;
                },
              ),
              RaisedButton(onPressed: (){
                _imagemQuadra();
              },
              child: Text("Selecionar Imagem"),
              ),
              
            ],
          ),
        ),
        ),
    );
    
  }
  Future<void> _imagemQuadra() async{
    final ImagePicker _picker = ImagePicker();
    try{
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

      photo!.readAsBytes().then((imagem){
        
        setState(() {
          quadra.imagem = base64Encode(imagem);
        });

      });
      }catch (e){
        print("Erro, Selecionando a foto da quadra: $e");
      }
    }
  }