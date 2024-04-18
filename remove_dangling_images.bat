for /F "tokens=*" %%i in ('docker images -f "dangling=true" -q') do docker rmi %%i
