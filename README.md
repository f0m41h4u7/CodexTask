# CodexTask

Скрипт begin.sh собирает информацию об устройстве, с которого запущен, и отправляет собранные данные на тестовый сервер в виде json файла.
Тестовый сервер запускается скриптом runServer.sh

Upd.: Добавлена возможность конфигурирования интервала отправки и адреса сервера.
$ sudo ./begin.sh 30 http://abc.com:1337/
