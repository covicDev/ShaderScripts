﻿using UnityEngine;

namespace GitHubShaderPixelImage
{
    [ExecuteInEditMode]
    public class CameraShader : MonoBehaviour
    {
        [SerializeField]
        private Material _material;

        private void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            Graphics.Blit(source, destination, _material);
        }
    }
}


