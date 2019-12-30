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


#!/bin/bash

docker run -it --rm \
  --runtime=nvidia \
  --shm-size=96g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  -v /scratch/datasets:/datasets \
  -v /scratch/users/gfranco/checkpoints:/checkpoints \
  -v /scratch/users/gfranco/brevitas_fork:/brevitas \
  -v /scratch/users/gfranco/results:/results \
  -v /scratch/users/gfranco/Jasper:/jasper \
  jasper bash
#  -v $PWD:/code \
