# Ищем подходящий image
FROM python:3.5

# Создаем пользователя в UNIX 
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

# Устанавливаем плагин для сборки wheel uWSGI	
RUN apt-get update && apt-get install -y uwsgi-plugin-python3  

#Устанавливаем Flask и uWSGI
RUN pip install Flask uWSGI requests==2.5.1 redis

# Определяем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы с хоста в контейнер
COPY app /app
#Копируем скрипт в контейнер
COPY cmd.sh /

# Говорим, что хотим открыть порты 9090 9191
EXPOSE 9090 9191

# Определяем юзера для всех следующих строк(в том числе CMD и ENTRYPOINT)
USER uwsgi

# Запускаем проект
CMD ["/cmd.sh"]