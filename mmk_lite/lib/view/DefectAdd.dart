import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmk_lite/view/mmk_widgets.dart';

import '../model/Defect.dart';
import '../model/DefectModel.dart';
import '../model/IssueModel.dart';
import 'CertificateLookup.dart';

class DefectAdd extends StatelessWidget {
  @override
  build(context) {
    var defectModel = DefectModel();
    return BlocConsumer<DefectModel, Defect>(
      cubit: defectModel,
      builder: (context, state) {
        var issueModel = context.read<IssueModel>();
        return Scaffold(
          appBar: AppBar(
            title: Text('Дефект'),
            actions: [
              IconButton(
                tooltip: 'Сканировать штрихкод',
                icon: Icon(Icons.qr_code_scanner),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Добавить изображение',
                icon: Icon(Icons.photo_library),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Сфотографировать',
                icon: Icon(Icons.add_a_photo),
                onPressed: () {},
              ),
            ],
          ),
          body: Hpadding1(
            Column(
              children: [
                Stack(children: [
                  TextField(
                    controller: TextEditingController(text: state.certificate),
                    decoration: InputDecoration(labelText: 'Сертификат'),
                    enabled: false,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.add, size: 35),
                      onPressed: () async {
                        defectModel.set(
                            certificate:
                                await Navigator.push(context, MaterialPageRoute(builder: (_) => CertificateLookup())));
                      },
                    ),
                  ),
                ]),
                Stack(children: [
                  TextField(
                    controller: TextEditingController(text: state.position),
                    decoration: InputDecoration(labelText: 'Позиция'),
                    enabled: false,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.add, size: 35),
                      onPressed: () {},
                    ),
                  ),
                ]),
                TextField(
                  controller: TextEditingController(text: state.productType),
                  decoration: InputDecoration(labelText: 'Вид продукции'),
                  onChanged: (v) => defectModel.set(productType: v),
                ),
                TextField(
                  controller: TextEditingController(text: state.notes),
                  decoration: InputDecoration(labelText: 'Замечания'),
                  onChanged: (v) => defectModel.set(notes: v),
                  minLines: 5,
                  maxLines: 5,
                ),
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.only(left: 15, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Изображений: ${state.photos.length}'),
                TextButton(
                  child: Text('Сохранить', style: TextStyle(fontSize: 16)),
                  onPressed: () => _add(context, state, issueModel),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  void _add(context, state, issueModel) {
    issueModel.add(Defect()
      ..certificate = state.certificate
      ..productType = state.productType
      ..notes = state.notes);

    Navigator.pop(context);
  }
}
