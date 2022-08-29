import 'package:bisiklet_mobil/Constants/languageItem.dart';
import 'package:bisiklet_mobil/Pages/registerPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(LanguageItem.loginAppTitle),
              actions:[
                IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                      ));
                    },
                  icon: Icon(Icons.person_outline_rounded),
                )
              ]
        ),
      body: Container(
        margin: EdgeInsets.only(right: 15,left:15,bottom:100,top: 50),
        child: Column(
              children:[
               TextField(
                    decoration: InputDecoration(
                        border: _buildOutlineInputBorder(),
                        hintText: LanguageItem.loginName,
                      prefixIcon: Icon(
                        Icons.person_outline
                      )
                    ),
                  ),
                _buildSpacer(),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: _buildOutlineInputBorder(),
                    hintText: LanguageItem.loginEmail,
                    prefixIcon: Icon(
                      Icons.mail_outline
                    )
                  ),
                ),
                _buildSpacer(),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: _buildOutlineInputBorder(),
                    hintText: LanguageItem.loginPhone,
                    prefixIcon: Icon(
                      Icons.phone
                    )
                  ),
                ),
                _buildSpacer(),
                TextField(
                  decoration: InputDecoration(
                    border: _buildOutlineInputBorder(),
                    hintText: LanguageItem.loginPassword,
                    suffixIcon: Icon(
                      Icons.password,
                    ),
                  ),
                ),
                _buildSpacer(),
                TextField(
                  decoration: InputDecoration(
                    border: _buildOutlineInputBorder(),
                    hintText: LanguageItem.loginPassswordAgain,
                    suffixIcon: Icon(
                      Icons.password,
                    )
                  ),
                ),
                _buildSpacer(),
                TextButton(
                    onPressed: null,
                    child: Text('Zaten bir hesabınız var mı ?')
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                        onPressed: null,
                        child: Text('KAYIT OL')
                  ),
                ),

              ],
          ),
      ),
    );
  }

  Spacer _buildSpacer() => Spacer();

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      );
  }
}






