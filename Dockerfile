# Ищем подходящий image
FROM python:3.4

#Устанавливаем Flask и uWSGI
RUN pip install Flask==0.10.1 uWSGI==2.0.8

# Определяем рабочую директорию в контейнере
WORKDIR ./app

# Копируем файлы с хоста в контейнер
COPY app /app

# Запускаем проект
CMD ["uwsgi", "--http", "0.0.0.0:9090",\
	 "--wsgi-file", "/app/identidock.py", \
	"--callable", "app", \
	"--stats", "0.0.0.0:9191"]