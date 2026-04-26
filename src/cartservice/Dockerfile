# Custom Dockerfile for CartService - maintained by eraj22
ARG BUILDPLATFORM=linux/amd64
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:10.0 AS builder
ARG TARGETARCH=amd64
WORKDIR /app
COPY src/cartservice.csproj .
RUN dotnet restore cartservice.csproj -a $TARGETARCH
COPY src/ .
RUN dotnet publish cartservice.csproj \
    -p:PublishSingleFile=true \
    -a $TARGETARCH \
    --self-contained true \
    -c release \
    -o /cartservice

FROM mcr.microsoft.com/dotnet/runtime-deps:10.0
WORKDIR /app
COPY --from=builder /cartservice .
EXPOSE 7070
ENV DOTNET_EnableDiagnostics=0 \
    ASPNETCORE_HTTP_PORTS=7070
USER 1000
ENTRYPOINT ["/app/cartservice"]
