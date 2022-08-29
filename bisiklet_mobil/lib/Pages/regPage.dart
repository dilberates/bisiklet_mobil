import 'package:bisiklet_mobil/Constants/languageItem.dart';
import 'package:bisiklet_mobil/Constants/myColors.dart';
import 'package:bisiklet_mobil/Pages/logPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure=true;
  bool _isObscure2=true;
  TextEditingController passwordControler=TextEditingController();
  TextEditingController passwordControler2=TextEditingController();
  TextEditingController emailControler=TextEditingController();
  TextEditingController nameControler=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(right: 15,left:15,bottom:30,top: 10),
          padding:EdgeInsets.only(top: 10,bottom: 10),
          child: Column(
                children:[
                  Image(image:
                  AssetImage('images/cropped-logo-293x71.png')
                  ),
                 _buildSpacer(),
                 TextField(
                   maxLength: 32,
                   controller: nameControler,
                      decoration: InputDecoration(
                          border: _buildOutlineInputBorder(),
                        hintText: LanguageItem.regName,
                        suffixText: '*',

                        prefixIcon: Icon(
                          Icons.person_outline
                        )
                      ),
                    ),
                  _buildSpacer(),
                  TextField(
                    maxLength: 30,
                    controller: emailControler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: _buildOutlineInputBorder(),
                      hintText: LanguageItem.regEmail,
                      suffixText: '*',
                      prefixIcon: Icon(
                        Icons.mail_outline
                      )
                    ),
                  ),
                  _buildSpacer(),
                  TextField(
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: _buildOutlineInputBorder(),
                      hintText: LanguageItem.regPhone,
                      prefixIcon: Icon(
                        Icons.phone
                      )
                    ),
                  ),
                  _buildSpacer(),
                  TextField(
                    controller: passwordControler,
                    maxLength: 12,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: _buildOutlineInputBorder(),
                      hintText: LanguageItem.regPassword,
                      suffixText: '*',
                      suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: (){
                            setState((){
                              _isObscure=!_isObscure;
                            });
                          }
                      )
                    ),
                  ),
                  _buildSpacer(),
                  TextField(
                    controller: passwordControler2,
                    obscureText: _isObscure2,
                    maxLength: 12,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: _buildOutlineInputBorder(),
                      hintText: LanguageItem.regPassswordAgain,
                      suffixText: '*',
                      suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure2 ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: (){
                            setState((){
                              _isObscure2=!_isObscure2;
                            });
                          }
                      )
                    ),
                  ),
                  _buildSpacer(),
                  TextButton(
                      onPressed: () {

                        _navLogPage(context);
                      },
                      child: Text('Zaten bir hesabınız var mı ?')
                  ),
                  _buildSpacer(),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                          onPressed:(){
                            if(nameControler.text.isNotEmpty && emailControler.text.isNotEmpty && passwordControler.text.isNotEmpty && passwordControler2.text.isNotEmpty){
                              if(EmailValidator.validate(emailControler.text)==false){
                                final snackBar = _buildSnackBar('Lütfen geçerli bir e posta adresi giriniz !');
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }else{
                                _navLogPage(context);
                              }
                            }
                            else{
                              final snackBar = _buildSnackBar('Zorunlu(*) alanlar boş bırakılmamalı !');
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }

                          },
                          child: Text('KAYIT OL')
                    ),
                  ),

                ],
            ),
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
                              label: 'Tamam',
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


}






