#!/system/bin/sh
# 不要假设您的模块将位于何处。
# 如果您需要知道此脚本和模块的放置位置，请使用$MODDIR
# 这将确保您的模块仍能正常工作
# 即使Magisk将来更改其挂载点
MODDIR=${0%/*}

# 此脚本将在late_start service 模式执行
boot_start=true
pid_file="$MODDIR/UnblockNeteaseMusic.pid"

if [ -f ${pid_file} ] ; then
    rm -rf ${pid_file}
fi

if [ $boot_start = "true" ]; then
   for i in $(seq 1 50); do
      ping -c 1 music.163.com > /dev/null 2>&1
      if [ $? -eq 0 ];then
      UNM start
      break
      fi
      sleep 7
   done
fi