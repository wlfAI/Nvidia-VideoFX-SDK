# Nvidia_Maxine_SDK(Video Effects SDK)
Adopts Nvidia_sdk to realize functions
1.Virtual Background ****
2.Super Resolution (up to 4X scaling factor)
3.Upscaler (up to 4X scaling factor)
4.Artifact Reduction
5.Video Noise Removal



Prerequisites:

1.Ubuntu 18.04 or Ubuntu 20.04 or Centos 7

2.graphics driver: minimum 510.47.03

3.CUDA 11.6.1

4.cuDNN 8.4.0.27

5.TensorRT 8.2.5.1


The Video Effects SDK can be downloaded from：https://catalog.ngc.nvidia.com/orgs/nvidia/teams/maxine/resources/maxine_linux_video_effects_sdk_ga/version
![image](https://user-images.githubusercontent.com/51230137/199392568-2b662728-f20c-4427-ac17-a163fa5d937a.png)

1.To install the SDK

sudo tar -xvf NVIDIA_VFX_SDK_<OS>_version>.tar.gz -C /usr/local

2.To build the sample applications

/usr/local/VideoFX/share/build_samples.sh

3.run the AI sample(Matting fuction)

cd /home/xxxx/mysamples

./run_aigs_webcam.sh

        
"AigsEffectApp [args ...]"

        "  --in_file=<path>           input file to be processed\n"

        "  --out_file=<path>          output file to be written\n"

        "  --bg_file=<path>           background file for composition\n"

        "  --webcam                   use a webcam as input\n"

        "  --cam_res=[WWWx]HHH        specify resolution as height or width x height\n"

        "  --model_dir=<path>         the path to the directory that contains the models\n"

        "  --codec=<fourcc>           the FOURCC code for the desired codec (default " DEFAULT_CODEC ")\n"

        "  --show                     display the results in a window\n"

        "  --progress                 show progress\n"

        "  --mode=(0|1)               pick one of the green screen modes\n"

        "                             0 - Best quality\n"

        "                             1 - Best performance\n"

        "  --comp_mode                choose the composition mode - {\n"

        "                               0 (show matte - compMatte),\n"

        "                               1 (overlay mask on foreground - compLight),\n"

        "                               2 (composite over green - compGreen),\n"

        "                               3 (composite over white - compWhite),\n"

        "                               4 (show input - compNone),\n"

        "                               5 (composite over a specified background image - compBG),\n"

        "                               6 (blur the background of the image - compBlur) }\n"

        "  --blur_strength=[0-1]      strength of the background blur, when applicable\n"

        "  --cuda_graph               Enable cuda graph.\n"
 

