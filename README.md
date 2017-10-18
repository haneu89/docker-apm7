<a name="english"></a>[[한국어]](#korean)
# docker-apm7
docker image to run php apache

## build
```bash
docker build -t haneu89/apm7 .
```

## run
in your php project directory

```bash
docker run -d -p 80:80 --name apm7 -v $(pwd):/var/www/html/ apm7
```

<a name="korean"></a>[[English]](#english)
# docker-apm7
php7 와 apache 기반의 docker image

## build
```bash
docker build -t haneu89/apm7 .
```

## run
php프로젝트 디렉토리 안에서 실행

```bash
docker run -d -p 80:80 --name apm7 -v $(pwd):/var/www/html/ apm7
```
