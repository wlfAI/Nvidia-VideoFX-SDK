# a helper script to set up LD_LIBRARY_PATH + PATH
# for running the sample apps

findpath() {
    # findpath "descriptive error text" <something-that-must-exist> <locations-to-look>...
    # used to find a library based on files that should exist in that location
    err_desc="$1"
    req_file="$2"
    shift 2
    for prefix in "$@"
    do
        if [ -e "$prefix/$req_file" ]
        then
            echo $prefix
            return
        fi
    done
    echo "ERROR: Could not find $err_desc" 1>&2
    exit 1
}

add_ldlibpath() {
    if [ -n "$1" ]
    then
        case "$LD_LIBRARY_PATH" in
            *:"$1":* | *:"$1" | "$1":* );;
            "") export LD_LIBRARY_PATH="$1";;
            *) export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$1";;
        esac
    fi
}


# 7.2.2.3 -> 7.2.2
_TRT_VER_SHORT=$(echo "8.2.5.1" | sed 's/^\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\..*/\1.\2\.\3/')

_CUDALIB=`findpath  "Cuda 11.6"   libcudart.so \
    $CUDA_TOOLKIT \
    /usr/local/cuda-11.6/lib64 \
    /usr/lib/x86_64-linux-gnu \
    /usr/lib64`
add_ldlibpath "$_CUDALIB"

_TRTLIB=`findpath  "TensorRT 8.2.5.1"  libnvinfer.so.${_TRT_VER_SHORT} \
    $TensorRT_DIR \
    /home/project/install/TensorRT-8.2.5.1/lib \
    /usr/lib/x86_64-linux-gnu \
    /usr/lib64`
add_ldlibpath "$_TRTLIB"

_CUDNNLIB=`findpath  "cuDNN 8.4.0"  libcudnn.so.8.4.0 \
    /usr/local/cuda-8.4.0/lib64 \
    /usr/local/cuda/lib64 \
    /usr/lib/x86_64-linux-gnu \
    /usr/lib64`
add_ldlibpath "$_CUDNNLIB"

_VFX_LIB=`findpath  "VideoFX lib" libVideoFX.so \
    /usr/lib/x86_64-linux-gnu \
    /usr/lib64 \
    /usr/local/VideoFX/lib`
add_ldlibpath "$_VFX_LIB"

_VFX_MODELS=`findpath  "VideoFX models" . \
    /usr/share/libvideofx/models \
    /usr/local/VideoFX/lib/models`

_VFX_SHARE=`findpath  "VideoFX share"  build_samples.sh \
    /usr/share/libvideofx \
    /usr/local/VideoFX/share`

export PATH=`pwd`:$PATH
