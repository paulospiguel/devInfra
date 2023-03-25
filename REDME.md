## HTTPS in Local environment 

----------------------------

For MacOS using Homebrew:
```bash
brew install mkcert
brew install nss # only if you use Firefox
```
For Windows using Chocolatey:
```bash
choco install mkcert
```
For Linux using Linuxbrew:
```bash
brew install mkcert
```

### Creating and using a certificate
```bash
mkcert -install
````

```bash
mkcert example.test
or
mkcert example.test "*.example.test" 127.0.0.1
```

#### Nginx configuration
```bash
...

 server {
    listen 443 ssl;
    server_name example.test;

    ssl_certificate /etc/nginx/certs/example.test.pem;
    ssl_certificate_key /etc/nginx/certs/example.test.pem;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
      proxy_buffering off;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-Host $host;
      proxy_set_header X-Forwarded-Port $server_port;

      proxy_pass http://localhost:8080;
    }
  }
  ....
  ```

#### Obs:
##### Change your hosts added in the ```/etc/hosts```

  ```bash
  127.0.0.1  example.test
  ```

