#!/bin/bash

while :
do
  # $vmstat
  #procs -----------memory---------- ---swap-- -----io---- --system-- -----cpu-----
  # r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
  # 0  0      0 204740  41712 1374880    0    0     1     5   13   15  0  0 100  0  0
  declare -i number 
  vmstatus=`vmstat 1 3|tail -n 1`
  echo $vmstatus|awk -F " " '{print $1}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/pros/r &
  echo $vmstatus|awk -F " " '{print $2}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/pros/b &
  echo $vmstatus|awk -F " " '{print $3}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/memory/swpd &
  echo $vmstatus|awk -F " " '{print $4}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/memory/free &
  echo $vmstatus|awk -F " " '{print $5}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/memory/buff &
  echo $vmstatus|awk -F " " '{print $6}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/memory/cache &
  echo $vmstatus|awk -F " " '{print $7}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/swap/si &
  echo $vmstatus|awk -F " " '{print $8}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/swap/so &
  echo $vmstatus|awk -F " " '{print $9}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/io/bi &
  echo $vmstatus|awk -F " " '{print $10}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/io/bo &
  echo $vmstatus|awk -F " " '{print $11}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/system/in &
  echo $vmstatus|awk -F " " '{print $12}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/system/cs &
  echo $vmstatus|awk -F " " '{print $13}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/cpu/us &
  echo $vmstatus|awk -F " " '{print $14}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/cpu/sy &
  echo $vmstatus|awk -F " " '{print $15}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/cpu/id &
  echo $vmstatus|awk -F " " '{print $16}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/cpu/wa &
  echo $vmstatus|awk -F " " '{print $17}' |xargs -i curl -s -F number={} http://localhost:5125/api/vmstat/cpu/st &

  #$ LC_ALL=C mpstat
  #Linux 2.6.32-279.14.1.el6.x86_64         12/04/12        _x86_64_        (1 CPU)
  #
  #11:59:52     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
  #11:59:52     all    0.37    0.00    0.10    0.01    0.00    0.00    0.00    0.00   99.51
  #mpstatus=`mpstat|sed -n '4p'`
  #echo $mpstatus|awk -F " " '{print $3}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/usr
  #echo $mpstatus|awk -F " " '{print $4}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/nice
  #echo $mpstatus|awk -F " " '{print $5}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/sys
  #echo $mpstatus|awk -F " " '{print $6}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/iowait
  #echo $mpstatus|awk -F " " '{print $7}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/irq
  #echo $mpstatus|awk -F " " '{print $8}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/soft
  #echo $mpstatus|awk -F " " '{print $9}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/steal
  #echo $mpstatus|awk -F " " '{print $10}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/guest
  #echo $mpstatus|awk -F " " '{print $11}' #|xargs -i curl -s -F number={} http://localhost:5125/api/mpstat/cpu/idle

  for i in `seq 50`
  do 
    curl -s -F number="-${i}" http://localhost:5125/api/ninjyatoriai/items/syuriken_no_ureta_kazu &
  done
  wait
  sleep 2
done
exit 0
