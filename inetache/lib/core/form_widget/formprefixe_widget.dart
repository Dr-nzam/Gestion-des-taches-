import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FormPreFixeWidget extends StatelessWidget {
  final bool isPassword;
  final Icon? prefixIcon;
  final int sizeForm;
  final String? placeholder;
  final String? plein;
  final String? errorMessage;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final VoidCallback? onTap;

   FormPreFixeWidget({
    super.key,
    this.isPassword = false,
    this.placeholder = '',
    this.plein = '',
    this.sizeForm = 1,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon, 
    this.errorMessage = 'Veuillez remplir ce champ.',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ()=> onTap!(),
      maxLines: sizeForm,
      obscureText: isPassword,
      obscuringCharacter: '*',
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: prefixIcon,
        
        // hintStyle: GoogleFonts.nunitoSans(
        //   fontSize: 14,
        //   fontWeight: FontWeight.w400,
        //   color: const Color(0xFF9A9A9A),
        // ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onChanged: (value) {
        // Handle changes to the text field's value
      },
    );
  }
}
