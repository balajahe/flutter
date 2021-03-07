import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  build(conetxt) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/mmk_logo.png'),
          Container(width: 10),
          Text('LITE', style: TextStyle(fontSize: 50, color: Colors.blue[900])),
        ],
      );
}

class AnonAvatar extends StatelessWidget {
  @override
  build(context) => Image.asset('assets/anon_avatar.png');
}

class Hpadding1 extends StatelessWidget {
  final Widget child;
  Hpadding1(this.child);
  @override
  build(context) => Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: child,
      );
}

class Hpadding2 extends StatelessWidget {
  final Widget child;
  Hpadding2(this.child);
  @override
  build(context) => Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: child,
      );
}

class Hr1 extends StatelessWidget {
  @override
  build(context) => Container(height: 1, color: Colors.grey);
}

class Hr2 extends StatelessWidget {
  @override
  build(context) => Container(height: 2, color: Colors.grey);
}

class MmkElevatedButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  MmkElevatedButton({this.child, this.onPressed});

  @override
  build(context) => Container(
        width: 200,
        child: ElevatedButton(
          child: child,
          onPressed: onPressed,
        ),
      );
}
