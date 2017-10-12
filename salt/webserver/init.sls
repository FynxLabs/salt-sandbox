
pull nginx image:
  dockerng.image_present:
    - name: nginx

copy index.html:
  file.managed:
    - name: /data/webserver/index.html
    - source: salt://webserver/index.html
    - template: jinja
    - makedirs: true

start web server:
  dockerng.running:
    - name: webserver
    - image: nginx
    - port_bindings:
      - 80:80/tcp
    - binds:
      - /data/webserver:/usr/share/nginx/html:ro
    - stop_signal: SIGTERM

