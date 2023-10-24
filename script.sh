#При условии, что nginx уже установлен на хосте, выполним следующее
cd /etc/nginx/sites-available/
 
sudo rm /etc/nginx/sites-available/default
 
cd /etc/nginx/sites-available/ && sudo mkdir static-website-example

#скопируем пользовательский конфиг в необходимую директорию и назначим права на исполнение
mv web-bee.conf /etc/nginx/sites-available/static-website-example/ && chmod 644 web-bee.conf

#выгрузим сайт со статическим контентом с удаленного репозитория
cd ~ && git clone git@github.com:cloudacademy/static-website-example.git
 
#копируем содержимое в нужный каталог
sudo mv static-website-example/ /var/www/

cd /etc/nginx/sites-available

#сделаем симлинк для конфига
sudo ln -s /etc/nginx/sites-available/web-bee.conf /etc/nginx/sites-enabled/

#переместим директории
cd /etc/nginx/ssl/static-website-example/  && \
sudo mv ca /etc/nginx/ssl/static-website-example/ && \
sudo mv private /etc/nginx/ssl/static-website-example/ && \
sudo mv certs /etc/nginx/ssl/static-website-example/ && \
sudo mv dhparam /etc/nginx/ssl/static-website-example/ && \
sudo mv snippets /etc/nginx/
