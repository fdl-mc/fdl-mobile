import 'package:flutter/cupertino.dart';

class Space extends StatelessWidget {
  final double _space;
  const Space(this._space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: EdgeInsets.only(bottom: _space));
}
