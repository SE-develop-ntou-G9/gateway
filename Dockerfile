FROM kong:3.6

COPY kong.yml /kong/declarative/kong.yml

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/kong/declarative/kong.yml
ENV KONG_PROXY_LISTEN=0.0.0.0:8000
ENV KONG_ADMIN_LISTEN=off

EXPOSE 8000
