import 'package:flutter/cupertino.dart';

class BSpacer extends StatelessWidget {
  final double _space;
  const BSpacer(this._space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: EdgeInsets.only(bottom: _space));
}

class RSpacer extends StatelessWidget {
  final double _space;
  const RSpacer(this._space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: EdgeInsets.only(right: _space));
}
