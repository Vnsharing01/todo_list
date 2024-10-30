import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeTextFieldView extends StatefulWidget {
  const CustomeTextFieldView({
    super.key,
    this.onChanged,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText,
    this.minLines,
    this.maxLines,
    this.text,
  });
  final String? hintText, errorText;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String text)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final int? minLines, maxLines;
  final String? text;

  @override
  State<CustomeTextFieldView> createState() => _CustomeTextFieldViewState();
}

class _CustomeTextFieldViewState extends State<CustomeTextFieldView> {
  final TextEditingController _controller = TextEditingController();
  String _errorTxt = '';
  @override
  Widget build(BuildContext context) {
    setState(() {
      _errorTxt = widget.errorText ?? '';
      _controller.text = widget.text ?? '';
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: setColorBorder()),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
          obscureText: widget.obscureText ?? false,
          obscuringCharacter: '*',
          controller: _controller,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
        ),
        if (_errorTxt.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _errorTxt,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          )
      ],
    );
  }

  setColorBorder() {
    MaterialColor? color;
    setState(() {
      color = _errorTxt.isNotEmpty ? Colors.red : Colors.grey;
    });
    return color;
  }
}
