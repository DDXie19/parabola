// OpenSCAD 为免费开源的跨平台建模软件
// 作者：上海市第三女子初级中学 谢丁

function position(x) =
  [
    8 * x, // x 坐标
    -3 * x * x + 3 // y坐标
  ];

module curve() // 这里其实绘制的是一个多边形，使用for循环进行迭代绘制
polygon([for (a = [ -1 : 0.005 : 1]) position(a)]);
// a 的起始值为-1，步长值为0.005，终值为1，这里步长值大小决定了抛物线光滑的程度，起始值和终值决定了抛物线的沿y轴的对称性。

module parabola()
{
  color("gold") curve(); // 金黄色的树叶
}

for (n = [0 : 18]) // 一共循环19次
{
  translate([0, 0, n * 1]) // 每次上移1mm
  rotate([0, 0, n * 10]) // 每次旋转10°
  {
    parabola(); // 生成x轴上半部分抛物线
    mirror([0, -1, 0]) parabola(); // 镜像得到x轴下半部分抛物线
  }
}
