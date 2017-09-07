# DB Migrate

Este repo contiene un wrapper de ActiveRecord migrations, con soporte únicamente
para MySQL

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
docker build . -t mikroways/dbmigrate
```

El ejemplo anterior invoca el script principal provisto por este repositorio.
Entonces, corriendo el comando anterior, se visualizarán las opciones que admite
el script. Ejemplos de uso con docker:

#### IMPORTANTE SOBRE EL USO CON DOCKER

**En caso de usar una base de datos en la misma PC donde se está corriendo docker,
el host de la base de datos no debe ser loopback ni 127.0.0.1, sino la IP de la
interfaz docker. En caso de usar docker-machine, utilizar la IP del la máquina
anfitrión. Además, considerar los permisos de acceso a la base de datos en otras
direcciones IP diferentes a la 127.0.0.1**

### Crear el schema base

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -d
```

### Crear una nueva migracion

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -n add_new_table
```

### Obtener un sql patch de upgrade

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -m
```

### Obtener un sql patch de rollback

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -r
```


```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -d
```

