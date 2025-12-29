# 使用官方 Node.js 22 Alpine 轻量镜像
FROM node:22-alpine

# 设置工作目录
WORKDIR /app

# 复制依赖文件，利用缓存加速
COPY package*.json ./

# 安装生产依赖
RUN npm install --production

# 复制源代码
COPY danmu_api/ ./danmu_api/
COPY . .

# 暴露端口
EXPOSE 9321

# 启动服务
CMD ["node", "danmu_api/server.js"]

