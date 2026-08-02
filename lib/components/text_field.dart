import 'package:flutter/material.dart';

class IdTextField extends StatefulWidget {
  final String text;
  final String hintText;
  final bool hasIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  const IdTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.hasIcon,
    required this.controller,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  @override
  State<IdTextField> createState() => _IdTextFieldState();
}

class _IdTextFieldState extends State<IdTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text, style: TextStyle(color: Color(0xFF484555), fontSize: 13, fontWeight: FontWeight.w600)),
          const SizedBox(height: 7),
          SizedBox(
            height: 39,
            width: double.infinity,
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              obscureText: widget.hasIcon && _obscureText,
              keyboardType: widget.hasIcon
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
              textInputAction: widget.textInputAction,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Color(0xFFBEC4CA), fontSize: 14),
                filled: true,
                fillColor: const Color(0xFFF8F9FA),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFC9C4D8),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFFC9C4D8),
                    width: 1.5,
                  ),
                ),
                suffixIcon: widget.hasIcon
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Color(0xFF818C98),
                        ),
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
