import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/PositionModel.dart';
import '../mmk_widgets.dart';

class PositionLookup extends StatelessWidget {
  @override
  build(context) {
    var model = context.read<PositionModel>();
    model.clearFilter();
    var searchController = TextEditingController();
    return BlocBuilder<PositionModel, PositionState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: MmkFilterLield(
            hint: 'Найти позицию...',
            controller: searchController,
            onChanged: (v) => model.filter(v),
          ),
        ),
        body: (!state.waiting)
            ? ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, i) {
                  var position = state.data[i];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text(position.num.toString()), flex: 1),
                        Expanded(child: Text(position.roll), flex: 3),
                        Expanded(child: Text(position.batch.toString()), flex: 2),
                        Expanded(child: Text(position.dimensions), flex: 3),
                        Expanded(child: Text(position.quantity.toString()), flex: 4),
                      ],
                    ),
                    onTap: () => Navigator.pop(context, position.roll),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      );
    });
  }
}
