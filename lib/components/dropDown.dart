import 'package:flutter/material.dart';

class DropDownLista extends StatefulWidget {
  final List<String> list;
  final String label;
  final double width;
  const DropDownLista(
      {super.key,
      required this.list,
      required this.label,
      required this.width});

  @override
  State<DropDownLista> createState() => _DropDownListaState();
}

class _DropDownListaState extends State<DropDownLista> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: widget.width,
      label: Text(widget.label.isEmpty ? 'Selecione' : widget.label),
      initialSelection: widget.list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          widget.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
