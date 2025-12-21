# Gateway Service (Kong)

本專案為 API Gateway，使用 [Kong](https://konghq.com/) 作為反向代理與 API 管理，並以 declarative config 方式設定服務。

## 目錄結構

- `Dockerfile`：Kong 的 Docker 映像建置檔案。
- `kong.yml`：Kong 的 declarative 設定檔，定義服務、路由與插件。

## Kong 設定說明

- 啟用 CORS 插件，允許所有來源、常見 HTTP 方法與標頭，支援憑證。
- 設定三個服務：
  - `post-service`：代理至 `http://post-serv.zeabur.internal:8080`，路由 `/api/posts`
  - `user-service`：代理至 `http://user-serv.zeabur.internal:8080`，路由 `/api/users`
  - `admin-service`：代理至 `http://admin-serv.zeabur.internal:8080`，路由 `/api/admin`

## Docker 執行方式

1. 建立映像：

   ```sh
   docker build -t my-kong-gateway .
   ```

2. 啟動容器：

   ```sh
   docker run -p 8000:8000 my-kong-gateway
   ```

- Kong Proxy 會監聽 8000 port，Admin API 已關閉。

## 參考
- [Kong 官方文件](https://docs.konghq.com/)
- [Declarative Configuration](https://docs.konghq.com/gateway/latest/kong-enterprise/kong-manager/declarative-config/)