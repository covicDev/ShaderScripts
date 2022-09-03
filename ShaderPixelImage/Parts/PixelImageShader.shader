/**
* Shader Script
* by https://modelivesky.com
**/

Shader "Modelivesky/PixelImageShader"
{
    Properties
    {
        _MainTexture("Texture", 2D) = "white" {}
        _PixelSize("PixelSize", Range(0.001, 0.1)) = 0.001
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

            sampler2D _MainTexture;
            float _PixelSize;

            fixed4 fragmentFunction(v2f_img i) : SV_TARGET
            {
                float rX = (int)(i.uv.x /_PixelSize) * _PixelSize;
                float rY = (int)(i.uv.y /_PixelSize) * _PixelSize;
                return tex2D(_MainTexture, float2(rX,rY));
            }
            ENDCG
        }
    }
}