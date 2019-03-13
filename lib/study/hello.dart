
class Hello{
  static void fun1(){
    print('我是 study/hello.dart 方法');
    Point(1, 2).showValue();
    Point.fromJson(x:23, y: 32).showValue();
  }

  ConstantPoint getConstObject({num x, num y}){
    return ConstantPoint(x, y);
  }

  FactoryPoint getFactoryObject(var name){
    return FactoryPoint(name);
  }

  void getCls(dynamic type){
    if(type is AbstractCls){
      type.abstractMethod();
      type.method();
    }
    type.method1();
  }

  void useEnum(Color c){
    switch(c){
      case Color.BLACK:
        break;
        default:
          print('默认处理');
    }
  }

  MixinSubCls getMixin(){
    return MixinSubCls();
  }
}
/// 使用class 关键字声明对象
///
class Point{
  num x, y;
  //定义构造函数
  Point(this.x, this.y){
    print('构造函数打印 x = $x y = $y');
  }

  //代理主构造，实现对象创建
  Point.fromJson({num x, num y}): this(x, y);

  void showValue()=> print('x = $x y = $y');
}
///定义只能使用不能修改的对象
///
class ConstantPoint{
  final num x, y;
  //const 修饰不能有构造块
  const ConstantPoint(this.x, this.y);
}
///使用factory定义构造函数
///
/// 表示该类创建时不会实时返回新的实力，相当于java里的单例
class FactoryPoint{
  final name;
  bool mutil = false;

  //私有变量以  _ 开头
  static final _cache = <String, FactoryPoint>{};

  factory FactoryPoint(String name){
    if(_cache.containsKey(name)){
      print('从缓存中读取');
      return _cache[name];
    }else{
      var tmp = FactoryPoint._internal(name);
      _cache[name] = tmp;
      return tmp;
    }
  }

  FactoryPoint._internal(this.name);

  FactoryPoint log(String msg){
    if(!mutil)print('打印信息 $msg');
    return this;
  }

  ///获取缓存信息
  Map<String, FactoryPoint> get cache => _cache;

}
///使用abstract定义抽象对象
abstract class AbstractCls{

  void abstractMethod();
  void method(){
    print("实例方法");
  }
}
///定义一个接口
class IPoint{
  final _name;
  IPoint(this._name);
  void method1()=> print('我是IPoint接口里的method $_name');
}

///使用extends实现继承
class SubCls extends AbstractCls implements IPoint{

  @override
  void abstractMethod() {
    print('我是实现的父类方法');
  }

  @override
  void method() {
    super.method();
    print("SubCls重写了 method");
  }

  @override
  get _name => "SubCls";

  @override
  void method1() {
    print('我是SubCls接口里的method1 $_name');
  }
}
///定义枚举
///
enum Color{
  RED, BLUE, BLACK
}
///使用mixin定义重复利用的代码 定义在dart2.1里
///
/// 它是不能定义有参构造, 可以声明变量 方法
/// 一个类可以使用with 进行多个mixin 对象的添加
/// mixin对象 使用 on 通过继承
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

mixin Maestro on Musical{

//  @override
//  void entertainMe() {
//    print('Maestro 重写');
//  }
}

class MixinSubCls extends SubCls with Musical, Maestro{

}

