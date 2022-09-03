/**
* Shader Script: Four Game Colors.
* by https://modelivesky.com
**/

Shader "Modelivesky/FourColorGameShader"
{
    Properties
    {
        [NoScaleOffset] _MainTex("Texture", 2D) = "white" {}

        [Header(Pixel size)]
        [Space]
        _PixelSize("PixelSize", Range(0.001, 0.1)) = 0.001

        [Header(Four game colors)]
        [Space]
        _C1("Color 1", Color) = (0.71,0.46,0.46,1)
        _C2("Color 2", Color) = (0.30,0.12,0.39,1)
        _C3("Color 3", Color) = (0.11,0.11,0.11,1)
        _C4("Color 4", Color) = (0.16,0.08,0.08,1)

        [Header(Game color gradient)]
        [Space]
        _CG("Color gradient", Color) = (0.30, 0.60, 0.10)
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" }

        Pass
        {
            CGPROGRAM
            #include "UnityCG.cginc"
            
            #pragma vertex vert_img
            #pragma fragment fragmentFunction

            sampler2D _MainTex;
            float _PixelSize;
            fixed4 _C1,_C2,_C3,_C4;
            float3 _CG;

            fixed4 fragmentFunction(v2f_img i) : SV_TARGET
            {
                float4 c;
                float rX = (int)(i.uv.x /_PixelSize) * _PixelSize;
                float rY = (int)(i.uv.y /_PixelSize) * _PixelSize;
                c = tex2D(_MainTex, float2(rX,rY));
                c = dot(c.rgb, _CG);
                if(c.r <= 0.25) c = _C1;
                else if(c.r > 0.75) c = _C2;
                else if(c.r > 0.25 && c.r <= 0.5) c = _C3;
                else c = _C4;
                return c;
            }
            ENDCG
        }
    }
}