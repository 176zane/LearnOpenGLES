//片元着色器 是一个处理片元值及其相关联数据的可编程单元，片元着色器可执行纹理的访问、颜色的汇总、雾化等操作，每片元执行一次
varying lowp vec2 varyTextCoord;

uniform sampler2D colorMap;


void main()
{
    gl_FragColor = texture2D(colorMap, varyTextCoord);
    //gl_FragColor 片元着色器内置变量，用来保存片元着色器计算完成的片元颜色值，此颜色值将送入渲染管线的后继阶段进行处理。
}
