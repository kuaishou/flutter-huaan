import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title:Text(
        '华安保险掌上宝',
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(250, 250, 250, 1.0)),
        ),
         flexibleSpace: Container(
          color: Color(0xFFef473a),
        ),
        ),
        
      body:Container(
        child: Column(
           children: <Widget>[
                LogoImg(),//logo图标
                LoginFrom(),//登录表单
           ],
        )
      )
    );
  }
}


// logo图标
class LogoImg extends StatelessWidget {
  final List swiperDateList;
  LogoImg({Key key, this.swiperDateList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.fromLTRB(100.0,0.0,100.0,0.0),
      height: ScreenUtil.getInstance().setHeight(500),
      child: Center(
               child:  new Image.network(
               'https://mtest.sinosafe.com.cn/eb-web/new-www/images/logo/logo-hua.png',
               width: ScreenUtil.getInstance().setWidth(320),
               height: ScreenUtil.getInstance().setHeight(250),
               ),
             )
    );
  }
}


// 登录表单

class LoginFrom extends StatefulWidget {
  @override
  _LoginFromState createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {

   final List<Tab> _myTabs = <Tab>[
    Tab(text: '选项一',icon: Icon(Icons.add_shopping_cart),),
    Tab(text: '选项二',icon: Icon(Icons.wifi_tethering),),
    Tab(text: '选项三',icon: Icon(Icons.airline_seat_flat_angled),)
  ];
    
  final List<Widget> tabBodies = [
    HomePage(),
    ToolPage(),
    StudyPage(),
    MyPage()
  ];

  int currentIndex=0;
  var currentPage;
@override
void initState() { 
  currentPage=tabBodies[currentIndex];
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
         onTap: (index) {
           setState(() {
            currentIndex=index;
            currentPage=tabBodies[currentIndex];
          });
            }
      ),
      body: currentPage,
    );
  }
}

