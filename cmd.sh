#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
	echo "Запуск сервера для разработки"
	exec python "identidock.py"
else
	echo "Запуск сервера для эксплуатации"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
	--callable app --stats 0.0.0.0:9191
fi