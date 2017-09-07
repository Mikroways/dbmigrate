# DB Migrate

Este repo contiene un wrapper de ActiveRecord migrations, con soporte únicamente
para MySQL.

## Configuración

Este wrapper necesita la información de conexión a la base de datos para poder
trabajar con ella. Para especificarla, renombrar el archivo db/config.yml-sample
a db/config.yml y completar con los datos correspondientes.

A continuación se explican las dos formas de utilizarlo, con Ruby nativo o con
Docker.

#### IMPORTANTE SOBRE EL USO CON DOCKER

**Si se utiliza una base de datos en la misma PC donde esté ejecutando Docker,
el host de la BBDD no debe ser ni loopback ni 127.0.0.1, sino la IP de la
interfaz de Docker. Si, en cambio, Docker se ejecuta con docker-machine,
utilizar la IP de la máquina anfitriona. Además, considerar los permisos de
acceso a la base de datos desde direcciones IP diferentes a la 127.0.0.1**.

## Uso

Este wrapper se puede usar de dos maneras: con Ruby nativo o con Docker. Es
indistinto cuál de ellas se utilice, sólo se deberán considerarse las
aclaraciones enunciadas para cada situación.

### Con Ruby nativo

Instalar ruby como lo explica [rbenv](https://github.com/rbenv/rbenv) y
[ruby-build](https://github.com/rbenv/ruby-build). Luego proceder con la
instalación  de la gema bundler:

```bash
gem install bundler
```

Y finalmente instalar las dependencias:

```bash
bundle install
```

Utilizar el wrapper provisto en el directorio `bin/dbmigrate`.

### Con Docker

Ejecutar el siguiente comando, que imprimirá la ayuda:

```
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate
```

El ejemplo anterior invoca el script principal provisto por este repositorio.
Entonces, corriendo el comando anterior, se visualizarán las opciones que admite
el script. Debajo se listan algunos ejemplos de uso.

#### Crear el schema base

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -d
```

#### Crear una nueva migracion

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -n add_new_table
```

#### Obtener un sql patch de upgrade

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -m
```

#### Obtener un sql patch de rollback

```bash
docker run --rm -it -v `pwd`/db:/dbmigrate/db mikroways/dbmigrate -r
```

### Modificar la imagen

Si se desea modificar la imagen, editar el archivo `docker/Dockerfile` y
construirla nuevamente con el siguiente comando:

```bash
docker build . -t mikroways/dbmigrate
```
