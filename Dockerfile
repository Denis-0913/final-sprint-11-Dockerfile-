# Базовый образ
FROM golang:1.23.1

# Переходим в рабочую директорию
WORKDIR /usr/src/app 

# Копирование исходного кода в текущую директорию
COPY . .

# Установка зависимостей
RUN go mod tidy 

# Компиляция бинарного файла
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

#его запуск
CMD ["/my_app"] 

# команда, которой был собран образ
#docker build -t denisdegtyarev/42-docker-final-main:v1 .
