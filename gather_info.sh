#!/bin/bash

infos=$(kubectl get pods -l tai-runner -o=custom-columns-file=FORMAT)
#echo $infos
infox=$(echo $infos | sed -r 's/\s+/;/g')
#echo "Q: $infox"
IFS=';' read -ra arr <<< "$infox"
index=${#arr[@]}
for (( i=0; i<${index}; i+=2 ))
do
  # Skips header
  if [[ $i -eq 0 ]]
  then
    continue  
  fi
  echo "${arr[$i+1]}"
  echo "${arr[$i]}"
  kubectl logs "${arr[$i]}"
done
