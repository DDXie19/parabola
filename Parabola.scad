// OpenSCAD 为免费开源的跨平台建模软件
// 作者：上海市第三女子初级中学 谢丁

function position(x) =
  [
    8 * x, // x 坐标
    -3 * x * x+3 // y坐标
  ];

module curve() // 这里其实绘制的是一个多边形，使用for循环进行迭代绘制
polygon([for (a = [ -1 : 0.005 : 1]) position(a)]);
// a 的起始值为0，步长值为0.005，终值为1，这里步长值大小决定了抛物线光滑的程度

module parabola()
{ 
  color("gold") curve(); // 金黄色的树叶
}

parabola();
mirror([0,-1,0]) parabola();

union() // 将下面生成的所有抛物面片段合并
{
  for (n = [1 : 18])
  {
    translate([0,0,n*1])
    rotate([0, 0, n * 10])
    {
        parabola();
        mirror([0,-1,0]) parabola();
    }
  }
}