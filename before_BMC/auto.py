import subprocess
import os
import glob
import re
import time
import psutil
flag=0
while flag==0:
 for i in range(1877):
    s4='results/gDel_minRN%dcom.mat' %(i+1)
    s='results/gDel_minRN%d.mat' %(i+1)
    if os.path.exists(s4)==True:
        if os.path.exists(s)==True:
            subprocess.run(["rm","-f",s4])
    else:
        if os.path.exists(s)==False:
            cpu = psutil.cpu_percent(interval=1)
            print(cpu)
            if cpu < 70:
              s3='results/gDel_minRN%dcom.mat' %(i+1)
              print(s3)
              subprocess.run(["cp","results/token.txt",s3])
              #s2='initCobraToolbox, run_gDel_minRN(%d)' %(i+1)
              s2='run_gDel_minRN(%d)' %(i+1)
              subprocess.call('pwd')
              print(s2)
              subprocess.run(["matlab","-nosplash","-r",s2,"&"])    
            else:
              time.sleep(20)   

