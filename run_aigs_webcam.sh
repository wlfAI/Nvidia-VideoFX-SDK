#!/bin/sh

. ./setup_env.sh

# Use --show to show the output in a window or use --out_file=<filename> to write output to file

./AigsEffectApp \
        --model_dir=$_VFX_MODELS \
        --in_file=$_VFX_SHARE/samples/input/tesla.mp4 \
        --out_file=output_0_100_frames.mp4 \
        --comp_mode=2 \
        --mode=0
        --verbose