
//导入需要使用的类 包 库
//import 'main.dart'; // as hello 可以起别名
//对于part of 定义的文件可以使用 show 或 hide 去处理不同的包里相同文件
//import 'dart:math';
//可以使用 deferred as name 在需要的时候加载该类。name.loadLibrary()
//import 'package:meta/meta.dart';
import 'dart:io' show Platform;
import 'study/hello.dart' as study;

void main(){

  print('当前操作系统 ${Platform.operatingSystem}');
  //single comment 单行注释
  //print('single comment');

  /* mutil comment 多行注释
  print('多行注释1');
  print('多行注释2');*/

  //doc comment look fun1() or fun2() methods

  //show hello world
//  print("first project hello world");

  //定义变量
//  fun4();

  //funcation 使用
//  fun1(); //fun2() fun3()效果一样
//  print('funcation is return ${fun5()}');
//  print('funcation is return ${fun6(4, 2)}');
//  print('funcation is return ${fun8()}, ${fun8(num2: 1)}');
//  print('funcation is return ${fun9()}, ${fun9(2)}, ${fun9(2, 5)}');

  //in dart collection
//  fun7();

  //in dart switch
//  fun10(1);

  //in dart exception
//  try{
//    fun11();
//  }catch(e){
//    print('rethrow 的异常');
//  }

  //声明类
//  study.Hello.fun1();

  //调用const 修饰的对象构造
//  var point = study.Hello().getConstObject(x: 12, y: 1);
////  point.x = 3;//错误，不能重新复制

  //调用factory 修饰的对象构造
//  study.Hello().getFactoryObject("UI").log('哈哈');
//  study.Hello().getFactoryObject("BB").log('C核弹');
//  study.Hello().getFactoryObject("UI").log('哈哈');
//  print('显示数量 ${study.Hello().getFactoryObject("UI").log("C核弹").cache.length}');

  //调用抽象类 和 接口的实现对象
//  study.Hello().getCls(study.SubCls());
//  study.Hello().getCls(study.IPoint("接口"));

  //枚举使用
//  study.Hello().useEnum(study.Color.RED);

  //mixin对象的使用
  study.Hello().getMixin().entertainMe();
  study.Hello().getMixin().method();
  study.Hello().getMixin().method1();
//  print('\u8809'.runes); //runes is utf-32 , in dart 默认字符串是utf-16

}

class Hello{
  ///
  /// 文档注释（推荐） 声明函数返回值为空类型
  ///
  void fun1(){
    print('funcation 1 return void');
  }

  /**
   * 文档注释（不建议的文档注释） 忽略函数返回值类型，默认返回null
   */
  fun2(){
    print('funcation 2 return ignore');
  }

  fun3() => print('funcation 3 is short');

  fun4(){
    var a = 1;//int 变量
    int a1 = 1;
    num a2 = 2.56;
    var a3 = 2.2;
    print('a = $a a1 = $a1 a2 = $a2, a3 = $a3');

//  const b = a; //error
    const b = 'test'; //字符串常量 只能初始化一次
//  b = 'dfsd';//error
    String b2 = 'test b2';
    print('b = $b b2 = $b2');
    final d = a;//字符串常量 只能初始化一次
//  d = 2;//error
    print('d = $d');

    var e = true;
    bool e1 = false;
    print('e = $e e1 = $e1');

    dynamic id = d;
    print('动态类型 id = $id');
    id = e1;
    print('动态类型 id = $id');
  }

  int fun5(){
    int a = 5, b = 4;
    return a+b;
  }
  ///定义带参数 返回值的函数
  int fun6(int num1, int num2)=> num1 + num2;
  ///定义带默认值参数，实际定义的是map参数
  ///可以通过key: value给对应参数赋值
  int fun8({int num1 = 2, int num2 = 0}){
    return num1 + num2;
  }
  ///定义带默认值参数，实际定义的是list/array参数
  ///不能通过key: value给对应参数赋值
  int fun9([int num1 = 1, int num2 = 0]){
    return num1 + num2;
  }

  void fun7(){
    //定义字符串list
    var list = ['qw', 'fsd', 'dfsd'];
    list.forEach((i){
      print('字符串list集合元素 $i');
    });
    //定义数值list
    var listInt = [1, 2.5, 3];
    for(var item in listInt){
      print("数值list集合信息 $item");
    }

    //定义字符串set
    var setStr = {"fe", "fe2", "dw"};
//  var setStr = <String>{}
//  Set<String> setStr = {};//一样的效果
    setStr.add("dfsd");
    print('setStr type is ${setStr.runtimeType} ${setStr.whereType()}');

    //定义字符串map
    var strs = {1: '23', 2: "32", 3: "dsde"};
    strs.forEach((i, v){
      print('strs[$i] = $v');
    });

//  var strs = {}; //定义一样的效果
//  var strs = Map();
//  Map strs = Map();
  }

  fun10(int param){
    //参数类型可以 integer string compile-time constant
    switch(param){
      case 1:
        print('满足条件1');
        break;
      case 2:
        print('满足条件2');
        break;
      default:
        print('满足默认条件');
        break;
    }
    //如果是两个case并列，但是满足其中一个的部分条件可以走下个case；可以使用
    //continue lable;来达到跳转目的
    switch(param){
      case 1:
        print('满足条件 1');
        continue label;
      case 2:
        print('满足条件 1 2');
        break;
      label:
      default:
        break;
    }
  }

  fun11(){
    try{
      var id = int.parse('e');
    }on FormatException catch(e){
      print('转换异常 $e');
      //可以重新抛出异常
      rethrow;
    }catch(e, s){
      print('异常捕获 e = $e s = $s');
    }finally{
      print('异常 finally');
    }
  }
}