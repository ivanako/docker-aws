#!/bin/bash -x
#	./bin/cluster-kubernetes-worker.sh
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
set +x && test "$debug" = true && set -x				;
#########################################################################
test -n "$kube"    		|| exit 100                             ;
test -n "$log"                	|| exit 100                             ;
test -n "$token_discovery"      || exit 100                             ;
test -n "$token_token"          || exit 100                             ;
#########################################################################
sudo sed --in-place                                                     \
        /$kube/d                                                        \
        /etc/hosts                                                      ;
sudo sed --in-place                                                     \
        /localhost4/s/$/' '$kube/                                       \
        /etc/hosts                                                      ;
#########################################################################
token_discovery="$(                                                     \
        echo                                                            \
                $token_discovery                                        \
        |                                                               \
        base64                                                          \
                --decode                                                \
)"                                                                      ;
token_token="$(                                                         \
        echo                                                            \
                $token_token                                            \
        |                                                               \
        base64                                                          \
                --decode                                                \
)"                                                                      ;
#########################################################################
while true                                                              ;
do                                                                      \
        sudo systemctl                                                  \
                is-enabled                                              \
                        kubelet                                         \
        |                                                               \
                grep enabled                                            \
                && break                                                \
                                                                        ;
done                                                                    ;
#########################################################################
while true                                                              ;
do                                                                      \
        sudo $token_token                                               \
                $token_discovery                                        \
                --ignore-preflight-errors                               \
                        all                                             \
                2>&1                                                    \
        |                                                               \
        tee $log                                                        \
                                                                        ;
        grep 'This node has joined the cluster' $log && break           ;
        sleep 10                                                        ;
done                                                                    ;
#########################################################################
