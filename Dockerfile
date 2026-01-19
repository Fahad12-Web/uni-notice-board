FROM nginx:alpine
# Agar aapki index.html main folder mein hai, to '.' use karein
COPY . /usr/share/nginx/html
EXPOSE 80
