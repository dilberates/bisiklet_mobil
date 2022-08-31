import 'package:bisiklet_mobil/Constants/languageItem.dart';
import 'package:bisiklet_mobil/Constants/mask_phone.dart';
import 'package:bisiklet_mobil/Constants/myColors.dart';
import 'package:bisiklet_mobil/Pages/logPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool _isObscure=true;
  bool _isObscure2=true;
  TextEditingController passwordControler=TextEditingController();
  TextEditingController passwordControler2=TextEditingController();
  TextEditingController emailControler=TextEditingController();
  TextEditingController nameControler=TextEditingController();
  TextEditingController phoneControler=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItem.registerAppTitle),
              actions:[
                IconButton(
                    onPressed: (){
                      _navLogPage(context);
                    },
                  icon: Icon(Icons.login_outlined),
                )
              ]
        ),
      body:  Container(
              margin: EdgeInsets.only(right: 15,left:15),
              padding:EdgeInsets.only(top: 10,bottom: 10),
                  child: ListView(
                    shrinkWrap: true,
                        reverse: true,
                        children: <Widget>[
                          LogoImageWidget(),
                          NameTextFieldWidget(nameControler: nameControler,buildMet: _buildOutlineInputBorder()),
                          EmailTextFieldWidget(emailControler: emailControler, buildMet: _buildOutlineInputBorder()),
                          PhoneTextFieldWidget(phoneControler: phoneControler, buildMet: _buildOutlineInputBorder()),
                          PasswordTextFieldWidget(passwordControler: passwordControler, buildMet: _buildOutlineInputBorder(), isObscure: _isObscure),
                          PasswordAgainTextFieldWidget(passwordAgainControler: passwordControler2, buildMet: _buildOutlineInputBorder(), isObscure2: _isObscure2),
                          TextButton(
                              onPressed: () {
                                _navLogPage(context);
                              },
                              child: Text(LanguageItem.loginUser),
                          ),
                          Container(
                              margin: EdgeInsets.all(10),
                              height: 50,
                              child: ElevatedButton(
                                    onPressed:(){
                                      if(nameControler.text.isNotEmpty && emailControler.text.isNotEmpty && passwordControler.text.isNotEmpty && passwordControler2.text.isNotEmpty){
                                        if(EmailValidator.validate(emailControler.text)==false){
                                          final snackBar = _buildSnackBar(LanguageItem.checkEmail);
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }else if(!isValidPhone(phoneControler.text)){
                                          final snackBar = _buildSnackBar(LanguageItem.checkPhone);
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }else{
                                          _navLogPage(context);
                                        }
                                      }
                                      else{
                                        final snackBar = _buildSnackBar(LanguageItem.checkEmpty);
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }

                                    },
                                    child: Text(LanguageItem.regBtnTxt)
                              ),
                            ),

                        ].reversed.toList(),
                    ),
                ),
    );
  }

  SnackBar _buildSnackBar(String? text) {
    return SnackBar(
                            content: Text(text!),
                            backgroundColor: MyColors.error,
                            action: SnackBarAction(
                              textColor: MyColors.white,
                              label: LanguageItem.snackBarTxt,
                              onPressed: () {
                              },
                            ),
                          );
  }

  void _navLogPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LogPage(),
    ));
  }



  Spacer _buildSpacer() => Spacer();

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      );
  }

  bool isValidPhone(String email){
    RegExp _regExp = RegExp(r'^[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return _regExp.hasMatch(email);
  }
}

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: const Image(image:
      AssetImage('images/cropped-logo-293x71.png'),
      ),
    );
  }
}

class NameTextFieldWidget extends StatelessWidget {
  final TextEditingController nameControler;
  final InputBorder buildMet;
  const NameTextFieldWidget ({
    Key? key,
    required this.nameControler,
    required this.buildMet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 32,
      controller: nameControler,
      decoration: InputDecoration(
          hintText: LanguageItem.regName,
          border: buildMet,
          suffixText: '*',

          prefixIcon: Icon(
              Icons.person_outline
          )
      ),
    );
  }
}
class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController emailControler;
  final InputBorder buildMet;
  const EmailTextFieldWidget ({
    Key? key,
    required this.emailControler,
    required this.buildMet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 30,
      controller: emailControler,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: buildMet,
          hintText: LanguageItem.regEmail,
          suffixText: '*',
          prefixIcon: Icon(
              Icons.mail_outline
          )
      ),
    );
  }
}

class PhoneTextFieldWidget extends StatelessWidget {
  final TextEditingController phoneControler;
  final InputBorder buildMet;
  const PhoneTextFieldWidget ({
    Key? key,
    required this.phoneControler,
    required this.buildMet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        MaskPhone.maskFormatter
      ],
      maxLength: 15,
      controller: phoneControler,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: buildMet,
          hintText: LanguageItem.regPhone,
          prefixIcon: Icon(
              Icons.phone
          )
      ),
    );
  }
}
class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController passwordControler;
  final InputBorder buildMet;
   bool isObscure;
  PasswordTextFieldWidget ({
    Key? key,
    required this.passwordControler,
    required this.buildMet,
    required this.isObscure,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordControler,
      maxLength: 12,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
          border: widget.buildMet,
          hintText: LanguageItem.regPassword,
          suffixText: '*',
          suffixIcon: IconButton(
              icon: Icon(
                widget.isObscure ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: (){
                setState((){
                  widget.isObscure=!widget.isObscure;
                });
              }
          )
      ),
    );
  }
}
class PasswordAgainTextFieldWidget extends StatefulWidget {
  final TextEditingController passwordAgainControler;
  final InputBorder buildMet;
  bool isObscure2;
   PasswordAgainTextFieldWidget ({
    Key? key,
    required this.passwordAgainControler,
    required this.buildMet,
    required this.isObscure2,
  }) : super(key: key);

  @override
  State<PasswordAgainTextFieldWidget> createState() => _PasswordAgainTextFieldWidgetState();
}

class _PasswordAgainTextFieldWidgetState extends State<PasswordAgainTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordAgainControler,
      obscureText: widget.isObscure2,
      maxLength: 12,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: widget.buildMet,
          hintText: LanguageItem.regPassswordAgain,
          suffixText: '*',
          suffixIcon: IconButton(
              icon: Icon(
                widget.isObscure2 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: (){
                setState((){
                  widget.isObscure2=!widget.isObscure2;
                });
              }
          )
      ),
    );
  }
}




