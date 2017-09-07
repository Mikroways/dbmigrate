# DB Migrate

Este repo contiene un wrapper de ActiveRecord migrations

## Usando ruby nativo

Simplemente instalar ruby como lo explica [rbenv](https://github.com/rbenv/rbenv) y
[ruby-build](https://github.com/rbenv/ruby-build). Luego proceder con la
instalación  de la gema bundler:

```bash
gem install bundler
```

Y finalmente instalar las dependencias:

```bash
bundle install
```

Utilizar el wrapper provisto en el directorio `bin/dbmigrate`

## Usando docker

Simplemente correr:

```
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate
```

Si se desea modificar la imagen, editar el archivo `docker/Dockerfile` y
construir con el siguiente comando:

```bash
docker build -f docker/Dockerfile . -t mikroways/dbmigrate
```

