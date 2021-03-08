import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmk_lite/model/IssueModel.dart';
import 'package:mmk_lite/mmk_widgets.dart';

import '../model/Issue.dart';
import '../model/IssueModel.dart';
import '../model/Defect.dart';
import 'DefectAdd.dart';

class IssueAdd extends StatelessWidget {
  @override
  build(context) {
    var model = context.read<IssueModel>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.text_snippet),
        title: Text('Новое дело'),
        actions: [
          IconButton(
            tooltip: 'Добавить дефект',
            icon: Icon(Icons.add, size: 40),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DefectAdd())),
          ),
          Container(width: 15),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 7, top: 3),
        child: BlocBuilder<IssueModel, Issue>(
          builder: (context, state) {
            return (state.defects.length > 0)
                ? ListView(
                    children: state.defects.map((v) => _DefectTile(v, model)).toList(),
                  )
                : Center(
                    child: Hpadding2(Text('Нажмите "+" чтобы добавить дефект в дело', textAlign: TextAlign.center)),
                  );
          },
        ),
      ),
    );
  }
}

class _DefectTile extends StatelessWidget {
  final Defect defect;
  final IssueModel issueModel;
  _DefectTile(this.defect, this.issueModel);

  @override
  build(context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 5),
              Row(
                children: [
                  Expanded(child: Text('Серт. №', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                  Expanded(child: Text(defect.certificate)),
                ],
              ),
              Hr1(),
              Row(
                children: [
                  Expanded(child: Text('Вид продукции', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                  Expanded(child: Text(defect.productType)),
                ],
              ),
              Hr1(),
              Row(
                children: [
                  Expanded(child: Text('Дефект', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                  Expanded(child: Text(defect.defect)),
                ],
              ),
              Hr2(),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _del(context, issueModel, defect),
        ),
      ],
    );
  }
}

void _del(context, model, v) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('Удалить дефект?'),
      actions: <Widget>[
        TextButton(child: Text('Нет'), onPressed: () => Navigator.pop(context)),
        TextButton(
          child: Text('Да'),
          onPressed: () {
            model.del(v);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
