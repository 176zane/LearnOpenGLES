//顶点着色器 是一个可编程的处理单元，执行顶点变换、纹理坐标变换、光照、材质等顶点的相关操作，每顶点执行一次。

attribute vec4 position;
attribute vec2 textCoordinate;
uniform mat4 rotateMatrix;

varying lowp vec2 varyTextCoord;

//attribute 变量(属性变量)只能用于顶点着色器中，不能用于片元着色器。一般用该变量来表示一些顶点数据，如：顶点坐标、纹理坐标、颜色等。
//uniform 是一种从CPU中的应用向GPU中的着色器发送数据的方式，但uniform和顶点属性有些不同。首先，uniform是全局的(Global)。全局意味着uniform变量必须在每个着色器程序对象中都是独一无二的，而且它可以被着色器程序的任意着色器在任意阶段访问。第二，无论你把uniform值设置成什么，uniform会一直保存它们的数据，直到它们被重置或更新。
//sampler 一种特殊的 uniform，用于呈现纹理。sampler 可用于顶点着色器和片元着色器。
//varying变量(易变变量)是从顶点着色器传递到片元着色器的数据变量。顶点着色器可以使用易变变量来传递需要插值的颜色、法向量、纹理坐标等任意值。 在顶点与片元shader程序间传递数据是很容易的，一般在顶点shader中修改varying变量值，然后片元shader中使用该值，当然，该变量在顶点及片元这两段shader程序中声明必须是一致的


//precision 可以用来确定默认精度修饰符。类型可以是int或float或采样器类型，precision-qualifier可以是lowp, mediump, 或者highp。任何其他类型和修饰符都会引起错误。如果type是float类型，那么该精度（precision-qualifier）将适用于所有无精度修饰符的浮点数声明（标量，向量，矩阵）。如果type是int类型，那么该精度（precision-qualifier）将适用于所有无精度修饰符的整型数声明（标量，向量）。包括全局变量声明，函数返回值声明，函数参数声明，和本地变量声明等。没有声明精度修饰符的变量将使用和它最近的precision语句中的精度。


void main()
{
    varyTextCoord = textCoordinate;
    
    vec4 vPos = position;

    vPos = vPos * rotateMatrix;

    gl_Position = vPos;
    //gl_Position 顶点着色器内建变量，表示变换后点的空间位置。 顶点着色器从应用程序中获得原始的顶点位置数据，这些原始的顶点数据在顶点着色器中经过平移、旋转、缩放等数学变换后，生成新的顶点位置。新的顶点位置通过在顶点着色器中写入gl_Position传递到渲染管线的后继阶段继续处理。
}
