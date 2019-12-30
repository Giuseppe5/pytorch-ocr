# Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM pytorch/pytorch:nightly-devel-cuda9.2-cudnn7

#RUN apt-get update && apt-get install -y libsndfile1 && apt-get install -y sox && rm -rf /var/lib/apt/lists/*
WORKDIR /workspace/ocr_req

COPY requirements.txt /workspace/ocr_req
COPY brevitas /pytorch-quantization
COPY warp-ctc /warp-ctc
RUN conda install pytorch==0.3.1 -c pytorch
RUN pip install --disable-pip-version-check -U -r /workspace/ocr_req/requirements.txt
RUN conda install cmake
RUN cd /pytorch-quantization && python build.py . && cd ..
RUN cd /warp-ctc && mkdir /warp-ctc/build && cd /warp-ctc/build && cmake .. && make


ENV PYTHONPATH "${PYTHONPATH}:/pytorch-quantization"
