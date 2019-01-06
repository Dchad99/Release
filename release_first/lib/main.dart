import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


  void main() => runApp(new MyApp()); 

  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new LoginPage(), 
      theme: new ThemeData(
        primarySwatch: Colors.teal
      )
); 
}
} 

class LoginPage extends StatefulWidget{
    @override
    State createState() => new LoginPageState();
}


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  
  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }
  void _performLogin(){
  }
bool _obscureText = true;

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// bool _autoValidate = false;

//   void onPressed() {
//     final form = formKey.currentState;

//     if (form.validate()) {
//       form.save();

//       performLogin();
//     }
//   }

//   void performLogin() {
//     final snackbar = new SnackBar(
//       content: new Text("Email : $_email, password : $_password"),
//     );
//     scaffoldKey.currentState.showSnackBar(snackbar);
//   }

AnimationController _iconAnimationController;
Animation<double> _iconAnimation;

@override
void initState() {
  super.initState();
  _iconAnimationController = new AnimationController(
    vsync: this,
    duration: new Duration(milliseconds: 500)
  );
  _iconAnimation = new CurvedAnimation(
    parent: _iconAnimationController,
    curve: Curves.bounceOut
  );
  _iconAnimation.addListener(() => this.setState(() {}));
  _iconAnimationController.forward(); 
}

    @override
    Widget build(BuildContext context){
      return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: Text("SIGN IN"),
          actions:<Widget>[
             IconButton(
               icon: Icon(Icons.add_shopping_cart),
             ),
          ],
          backgroundColor: Colors.teal
        ),
        // backgroundColor: Colors.black,
        
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[ 
            new Image(
              image: new AssetImage("images/main-bg.jpg") ,
              fit: BoxFit.fill, 
              ),
              new Padding(
            padding:  const EdgeInsets.only(top: 40.0),
             ),
             
                new ListView(
                  children: [
                new Padding(
                  padding: EdgeInsets.only(bottom: 120.0),
                ),
              FlutterLogo(
              size: 100.0,
              colors: Colors.teal,
              ),
                new Form(
                  key: formKey,
                  child: Theme(
                  data: new ThemeData(
                    // brightness: Brightness.dark,
                     primaryColor: Colors.teal, 
                    inputDecorationTheme:  new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 22.0,
                      )
                    )
                  ),
                  child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      new TextFormField(
                       decoration: new InputDecoration(
                        hintText: "ivanov@gmail.com", 
                        labelText: "Enter Email",
                        icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.email),
                        ),
                      ),
                         keyboardType: TextInputType.emailAddress,
                          validator: (val) =>
                          !val.contains('@') ? 'Invalid Email' : null,
                          onSaved: (val) => _email = val,
                    ),
                    
                     new TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Enter password',

                          icon: Padding(
                              padding: EdgeInsets.only(top: 15.0), 
                              child: Icon(Icons.lock)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              semanticLabel: _obscureText ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                         validator: (val) =>
                          val.length < 6 ? 'Password too short' : null,
                           onSaved: (val) => _password = val,
                      ),
                    new Padding(
                      padding:  const EdgeInsets.only(top: 30.0),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RaisedButton(
                      color: Colors.teal,
                      textColor: Colors. white,
                      child: const Text('LOGIN'),
                      onPressed: () {
                        if(formKey.currentState.validate()) {
                          setState(()  async {
                                      await Future.delayed(new Duration(seconds: 3),(){
                                            Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => FirstScreen()
                                ));
                                }); 
                          
                        
                            showDialog(
                              context: context,
                              child: new Row(
                                mainAxisSize: MainAxisSize.min,
                                children:[
                                  SizedBox(
                                    width: 100.0,
                                    height: 30.0,
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.all(30.0),
                                    ),
                                    new Center(
                                    child: CircularProgressIndicator(
                                        value: null,
                                        strokeWidth: 5.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                        });
                                // await Future.delayed(new Duration(seconds: 3),(){
                                //             Navigator.of(context).push(MaterialPageRoute(
                                //             builder: (BuildContext context) => FirstScreen()
                                // ));
                            
                       
                       
                       } 
                       },
                    )
                  ),

                   Row(children: <Widget>[
                   Padding(
                     padding:EdgeInsets.only(left: 35.0), 
                     ),
                    new Text("Don't have an account ?", style: TextStyle(color: Colors.tealAccent),),
                    Padding(
                     padding: EdgeInsets.only(right: 5.0),
                   ),
                   
                  new FlatButton(
                      splashColor: Colors.black,
                      padding: EdgeInsets.only(right: 35.0),
                      onPressed:(){
                          Navigator.push(
                            context,
                               MaterialPageRoute(builder:(BuildContext context) => Registration ()));
                      },
                      child: new Text('Create', style: TextStyle(color: Colors.teal),),
                      
                   )
                   
                ])
                      
                     ],
                  ),
                     
                ),
                ),
                )
              ],
            )
          ], 
          
        ),
      ));
    }
    }





void back() {
  runApp(
    MaterialApp(
      title: 'A Wish List',
      home: FirstScreen(),
    ),
  );
}


class FirstScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context){
    return new MaterialApp(
    home: new  Scaffold(
        appBar: AppBar(
            title: Text('Wish List'),
            backgroundColor: Colors.teal,
            actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {
                         Navigator.pushReplacement(
                            context,
                               MaterialPageRoute(builder:(BuildContext context) =>LoginPage()));
                  },
                ),
        ]
        ),
        body: SecondScreen(
          items: List<String>.generate(100, (i) => "Item $i"),
        )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final List<String> items;

  SecondScreen({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.photo_album),
          title: const Text('Wish List'),
          subtitle: const Text('Information'),
          trailing: const Icon(Icons.phone),
        );
      },
    );
  }
}



void registr() => runApp(new MyApp());

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);

  @override
  _Regist createState() => _Regist();
}

class _Regist extends State<Registration> {
//  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // return new MaterialApp(
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Registration'),
          backgroundColor: Colors.teal,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: FormUI(),
            ),
          ),
        ),
      // ),
    );
  }

// Here is our Form UI
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        new Text('JOIN UP WITH DC', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        new TextFormField( 
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'David',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.supervised_user_circle, color: Colors.teal,),
            ),
            ),
          keyboardType: TextInputType.text,
        ),
        new TextFormField( 
          decoration: InputDecoration(
            labelText: 'Surname',
            hintText: 'Chursa',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.supervised_user_circle, color: Colors.teal,),
            ),
            ),
          keyboardType: TextInputType.text,
        ),
          new TextFormField( 
          decoration: InputDecoration(
            labelText: 'Age',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.supervised_user_circle,color: Colors.teal,),
            ),
            ),
          keyboardType: TextInputType.text,
        ),
        new TextFormField(
          decoration: InputDecoration(
            labelText: 'Mobile',
            hintText: '+380',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.phone, color: Colors.teal,),
            ),
            ),
          keyboardType: TextInputType.phone,
        ),
        new TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'flutter@gmail.com ',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.email, color: Colors.teal,),
            ),
            ),
          keyboardType: TextInputType.emailAddress,
        ),
         new TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.lock, color: Colors.teal,),
            ),
            suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              semanticLabel: _obscureText ? 'show password' : 'hide password',
                            ),
                          ),
            ),
          keyboardType: TextInputType.emailAddress,
        ),
         new TextFormField(
          decoration: InputDecoration(
            labelText: 'Re-Password',
            icon: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.lock_open, color: Colors.teal,),
            ),
            suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              semanticLabel: _obscureText ? 'show password' : 'hide password',
                            ),
                          ),
            ),
          keyboardType: TextInputType.emailAddress,
        ),
        new SizedBox(
          height: 20.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: new Text('Registrate',style: TextStyle(color: Colors.white)),
          color: Colors.teal,
        )
     ],
    );
  }

  void _validateInputs() {
  }
}