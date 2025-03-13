import 'package:flutter/material.dart';

class TableComponent extends StatefulWidget {
  const TableComponent({super.key, this.color, this.child});
  final Color? color;
  final Widget? child;

  @override
  State<TableComponent> createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: widget.child,
    );
  }
}
