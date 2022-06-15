FROM python:3.7

LABEL version="1.0.5"
LABEL author="catas"

COPY pip.conf /root/.pip/pip.conf

# 创建 myproject 文件夹
RUN mkdir -p /var/LabManager

# 将 myproject 文件夹为工作目录
WORKDIR /var/LabManager

# 将当前目录加入到工作目录中（. 表示当前目录）
ADD . /var/LabManager

# 更新pip版本
RUN python -m pip install --upgrade pip

# 利用 pip 安装依赖
RUN python -m pip install -r requirments.txt

# RUN apt-get update
# RUN apt-get install iputils-ping -y

# 给start.sh可执行权限
RUN chmod 754 ./start.sh

EXPOSE 8000
EXPOSE 9000


# CMD bash ./start.sh
ENTRYPOINT [ "bash", "./start.sh" ]


