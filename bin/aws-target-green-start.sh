#!/bin/bash -x
#	./bin/aws-target-green-start.sh
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
source ./etc/conf.d/aws.conf                                            ;
#########################################################################
file=aws-target-green.sh                                                ;
path=$uuid/bin                                                          ;
#########################################################################
./$path/$file                                                           ;
#########################################################################
