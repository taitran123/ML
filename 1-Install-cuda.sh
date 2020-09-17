wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda
sudo reboot

#sudo apt install nvidia-cuda-toolkit
#https://gist.github.com/raulqf/f42c718a658cddc16f9df07ecc627be7

cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_C_COMPILER=/usr/bin/gcc-6 \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D INSTALL_C_EXAMPLES=OFF \
-D WITH_TBB=ON \
-D WITH_CUDA=ON \
-D BUILD_opencv_cudacodec=OFF \
-D ENABLE_FAST_MATH=1 \
-D CUDA_FAST_MATH=1 \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=ON \
-D CUDA_ARCH_BIN=7.0 \
-D BUILD_TIFF=ON \
-D WITH_CUBLAS=1 \
-D WITH_V4L=ON \
-D WITH_QT=OFF \
-D WITH_OPENGL=ON \
-D WITH_GSTREAMER=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_PC_FILE_NAME=opencv.pc \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_PYTHON3_INSTALL_PATH=/home/thtai/Source/pycam-detect/exe_code/lib/python3.6/site-packages \
-D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-4.2.0/modules \
-D PYTHON_EXECUTABLE=/home/thtai/Source/pycam-detect/exe_code/bin/python3 \
-D BUILD_EXAMPLES=ON ..






nproc
make -j8
sudo make install


pip3 install https://github.com/cupy/cupy/releases/download/v8.0.0rc1/cupy_cuda110-8.0.0rc1-cp36-cp36m-manylinux1_x86_64.whl
Collecting cupy-cuda110==8.0.0rc1
