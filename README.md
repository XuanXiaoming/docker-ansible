# docker-ansible

`cd` 到当前路径下使用:
```
docker build -t xbuntu .
docker compose up
```

######
######

容器结构：  
- xcontroller
  - xnode1
  - xnode2

######
######

启动后在xcontroller下使用 `ansible -m ping all` 验证，如下图所示即为成功。  

  ![WX20220420-165919](https://user-images.githubusercontent.com/10046849/164191679-99be8b69-f886-4565-be37-8ec790b001bf.png)

######
