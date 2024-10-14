import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatelessWidget {
  final bool isPassword;
  final IconButton suffixIcon;
  final int sizeForm;
  final String? placeholder;
  final String? plein;
  final String? errorMessage;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  Function(String)? callback;

   FormWidget({
    Key? key,
    this.isPassword = false,
    this.placeholder = '',
    this.plein = '',
    this.sizeForm = 1,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon = const IconButton(
      icon: Icon(null),
      onPressed: null,
      color: Colors.white24,
    ),
    this.errorMessage = 'Veuillez remplir ce champ.',
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: sizeForm,
      obscureText: isPassword,
      obscuringCharacter: '*',
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        suffixIcon: suffixIcon,
        
        // hintStyle: GoogleFonts.nunitoSans(
        //   fontSize: 14,
        //   fontWeight: FontWeight.w400,
        //   color: const Color(0xFF9A9A9A),
        // ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onChanged: (value) {
        if (callback != null) {
          callback!(value);
        }
      },
    );
  }
}
