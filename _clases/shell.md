---
layout: lecture
title: Shell
description: Sintaxis básica de shell (bash)
nav_order: 1
date: 2024-03-08
ready: true
---

> La *shell* o terminal, es el programa que nos permite interactuar en tiempo real con el sistema operativo atraves de entradas que damos desde el teclado. Casi todos las distribuciones de Linux usan una sintaxis basada en un proyecto GNU llamado **bash** (Bourne-Again SHell) que es una versión sucesora del programa original `sh` para la linea de comandos. En sistemas Mac la sintaxis es casi identica, y Windows la esta empezando a adpotar.

## Prompt

Cuando abras el emulador de terminal (con `ctrl`+`T`) vas a encontar con algo asi:
```shell
usuario@pc:mi_dir$
```

Esto se conoce como **prompt**, antecede siempre al cursor, y nos da alguna informacion de cual es nuestro estado.
Lo primero que dice es quien es el usuario que va a ejecutar las instrucciones (*usuario*), luego del **`@`** dice desde que computadora (*pc*), seguido de **`:`** dice el directorio en el que estamos ubicados dentro de *pc*, y por ultimo un signo que indica los privilegios del usuario (**`$`**: usuario normal, **`#`**:superuser/admin).
El prompt es completamente customizable y por lo tanto es posible encontrar otras estructuras, pero en general por default tienen estos elementos.


## Comandos

La *shell* consiste basicamente en una seríe de comandos (que usualmente son programas en C/C++ ya compilados, es decir ejecutables) que están disponibles para el usuario. La mayoria de los comandos tienen la siguiente sintaxis:

```shell
comando -opciones <argumentos>
```
donde `comando` es el comando que queremos ejecutar. `-opciones` son opciones de ejecución (tambien llamadas *flags*), y `argumentos` son los argumentos del comando a ejecutar. Por ejemplo:

```shell
echo -n "Hola"
```

acá `echo` es un comando que imprime un mensaje en la pantalla. `-n` es una opción para que el mensaje no termine en linea nueva, y el argumento de este comando es el mensaje en si que se busca mostrar.

## Comentarios

Los comentarios son partes de código ó comandos que no se ejecutan. En el caso de la *shell* estos están antecedidos del caracter **`#`**, por ejemplo:

```shell
# Esta linea es un comentario
```

Todo lo que sigue al simbolo **`#`** no hace absolutamente nada. No es algo demasiado útil en el contexto de la *shell* (pero sí en otros contextos), en este tutorial pueden aparecer así que vale la pena mencionarlo.


## Estructura de directorios en UNIX/Linux

Los sistemas UNIX suelen tener una estructura de directorios (carpetas) bastante similar entre sí, acá vamos a describir solo algunos:

![linux-filesystem](./imgs/linux-filesystem.png)

| directorio       | descripción |
|------------------|-------------|
| `/`              | Este es el directorio *base* ó *root* del arbol de archivos.  |
| `/bin`           | Contiene *binarios* ó ejecutables.                            |
| `/home`          | Contiene directorios base de los usuarios.                    |
| `/home/<usuario>`| Carpeta donde están todos los archivos del usuario.           |
| `/lib`           | Contiene librerias del sistema.                               |
| `/usr`           | Contiene ejecutables, librerias, y archivos copartidos.       |
| `/usr/bin`       | Archivos binarios compartidos entre usuarios.                 |
| `/usr/include`   | *headers* compartidos entre usuarios (usados por programas de C/C++). |
| `/usr/lib`       | librerias compartidas entre usuarios.                         |


## Navegación

Veamos como navegar en LINUX, esto es ir de una carpeta a otra y revisar el contenido, etc.

Para conocer la ubicacion absoluta en la que estamos (la del prompt es relativa a la carpeta principal del usuario) utilizamos el comando `pwd`:
```shell
usuario@pc:~$ pwd
/home/usuario
```

Si queremos ver el contenido de la carpeta donde estamos posicionados escribimos:
```shell
usuario@pc:~$ ls	
Desktop  Documents  Music  Pictures  Public  Templates Videos
```

Para "ir a" ó "cambiar" de directorio usamos `cd`:
```shell
usuario@pc:~$ cd Desktop   
usuario@pc:~/Desktop$ cd ..
usuario@pc:~$
```
> Notar que con `cd ..` retornamos al directorio *madre*. 
> Otro *short-cut* útil es: `cd -` que retorna al directorio de trabajo anterior.

Para borrar la pantalla de comandos escribimos:
```shell
usuario@pc:~$ clear
```
> una alternativa de `clear` es `<ctl>`+`l`

## Directorios y archivos

Veamos como crear/borrar directorios y archivos:

Para crear/borrar una carpeta (ó directorio) existen los siguientes comandos:
```shell
usuario@pc:~$ mkdir carpeta	#crea directorio
usuario@pc:~$ rmdir carpeta	#elimina directorio
usuario@pc:~$ rm -r carpeta	#elimina directorio y todo su contenido (OJO!)
```

Para crear/borrar un archivo:
```shell
usuario@pc:~$ touch archivo	#crea archivo/actualiza fecha de acceso
usuario@pc:~$ rm archivo	#borrar archivo
```

Otras acciones que podemos hacer con directorios y archivos son "copiar", "cortar" (mover) y "pegar":
```shell
usuario@pc:~$ cp archivo archivo_copiado  #copiar archivo 
usuario@pc:~$ mv archivo archivo_movido   #mover archivo (tambien sirve para renombrar)
```

## Links simbolicos vs duros

Algo análogo a los "accesos directos" de Windows son los links, y en UNIX los hay de dos tipos: simbólicos (*symlink*) y duros (*hard-links*)

Un link simbólicos se crea así:
```shell
usuario@pc:~$ ln -s archivo link_soft
```

Un link duro se crea así:
```shell
usuario@pc:~$ ln archivo link_hard 
```

estos ultimos son más antiguos que los simbólicos y tienen algunas limitaciones por lo que se recomienda usar links simbólicos.

### Inodes
Para entender la diferencia entre links simbólicos y duros tenemos que saber que los archivos consisten en dos partes: 
- su contenido, 
- y su nombre/metadata.

cuando creamos *hard-links* estamos creando un nombre adicional para un bloque de contenido pre-existente. Tanto el archivo original como el link son indistinguibles ya que son dos formas distintas de nombrar al mismo conjunto de datos. Si borramos el archivo original el link sigue funcionando ya que el contenido no se borra y el link sigue apuntando al bloque datos original.

Cuando creamos un *sym-link* lo que creamos es un nuevo archivo que apunta al nombre del archivo original. En este sentido si borramos el archivo original este link queda "huerfano" y no posee ningun dato.
 
Cada archivo tiene un idenitificador único conocido como *inode-number* podemos ver el inode de cada archivo con el siguiente comando:

```shell 
usuario@pc:~$ ls -li
total 0
23644375 -rw-r--r-- 2 usuario usuario 0 feb 27 11:10 archivo
23644375 -rw-r--r-- 2 usuario usuario 0 feb 27 11:10 link_hard
23644387 lrwxrwxrwx 1 usuario usuario 7 feb 27 11:10 link_soft -> archivo
``` 

notar que los links duros y tienen el mismo *inode-number* que su archivo target, pero los links simbólicos no.


## Input/Output

Muchos de los comandos utilizados hasta ahora generan un output de algun tipo. Estos outputs consisten en dos tipos:
- resultados que el programa esta diseñado a producir (*stdout*)
- estado y mensajes de error  (*stderr*)

Por ejemplo en linux, `ls` manda sus resultados a un archivo especial `/dev/stdout`, y los mensajes de error a otro llamado `/dev/stderr`. Ambos estan linkeados por default con la pantalla.

Ademas muchos programas toman sus argumentos de un *stdin*, por default linkeado a las entradas desde el teclado.


## Redireccion de `stdout`, `stderr` y `stdin`

Las salidas de los comandos por default van a la pantalla, y los inputs se toman desde el teclado.
Sin embargo podemos decidir donde llevar los stdin/stdout utilizando comandos de redireccionamiento:

```shell
usuario@pc:~$ ls /usr/bin > ls-output.txt
```
acá enviamos la lista de los archivos almacenados en `/usr/bin` a un archivo llamado `ls-output.txt`. Podemos ver su contenido usando el comando `cat`:
```shell
usuario@pc:~$ cat ls-output.txt
```

cada vez que redirecionamos utilizando el simbolo `>` el archivo se borra completamente y sobreescribe el mensaje de salida. Pero es posible tambien redireccionar de forma que se agregue como una nueva linea a un archivo preexistente:

```shell
usuario@pc:~$ echo "hola"        >  archivo.txt    #
usuario@pc:~$ echo "como estás?" >> archivo.txt    #archivo a archivo (lo agrega)
usuario@pc:~$ cat archivo.txt
hola
como estás?
```

Hagamos de nuevo una redirección pero esta vez vamos a ejecutar `ls` sobre un directorio que no existe:
```shell
usuario@pc:~$ ls /bin/usr > ls-output.txt
ls: cannot access /bin/usr: No such file or directory
```
vemos un mensaje de error, pero ¿Por que se muestra en pantalla y no fue redireccionado al archivo ls-output.txt? Esto se debe a que los mensajes de error no se envian como *stout*, sino por la vía de *stderr*. Si queremos redireccionar un mensaje de error usamos `2>`:

```shell
usuario@pc:~$ ls /bin/usr 2> ls-error.txt
```

> Es común ver que los mensajes de error se redireccionan a un archivo especial `/dev/null`, a este archivo (también conocido como *bit bucket*) se envian frecuentemente cualquier mensaje o datos que no nos interesan ni serán usados en el futuro.

También es posible redireccionar las entradas que damos por teclado (*stdin*):
```shell
usuario@pc:~$ cat archivo.txt
```

`cat` lee uno o más archivos y los copia dentro de *stdout*. Se usa generalmente para leer archivos cortos, y para concatenar archivos.

Si ejecutamos `cat` sin ningun argumento este redirecciona todo lo que tipeamos en el tecldo (*stdin*) al *stdout*:
```shell
usuario@pc:~$ cat 
hola
hola
como estás?
como estás?
```

Como siempre podemos redireccionar esto a un archivo usando el simbolo `>`:
```shell
usuario@pc:~$ cat  > archivo.txt
hola
como estás?
usuario@pc:~$ cat archivo.txt
hola
como estás?
```
<!-- usuario@pc:~$ read var	#stdin   a variable -->
<!-- usuario@pc:~$ echo "Hola"	#stdin   a stdout   -->


### Pipelines

Una forma comun de redirigir `stdout` de un comando para usarlo como `stdin` de otro comando es mediante el uso de *pipelines* (`|`):

```shell
usuario@pc:~$ ls /usr/bin | sort	 
```
en este ejemplo listamos los archivos presentes en `/usr/bin` y la salida se la pasamos al comando `sort` que ordena la lista de forma alfrabetica. `sort` en este ejemplo juega el rol *filtro*, ya que toma una salida como *stdout*, la procesa y devuelve una nueva salida. Existen otros filtros, por nombrar algunos de los más usados: `uniq`, `grep`, `wc`, entre otros.


Existe un comando frecuentemente usado que toma un *stdout* y lo redirecciona a un archivo y al mismo tiempo a *stdout*, este se llama `tee` :

```shell
usuario@pc:~$ echo "Hola" | tee archivo.txt
Hola
usuario@pc:~$ cat archivo.txt
Hola
```

Hay ciertos comandos que no admiten *stdout* como argumentos, por ejemplo:
```shell
usuario@pc:~$ echo "carpeta" | mkdir
mkdir: missing operand
```

para esto existe el comando `xargs` que toma valores de *stdout* y los convierte a una lista de argumentos para determinados comandos:
```shell
usuario@pc:~$ echo "carpeta" | xargs mkdir	
```


### Status

Luego de ejecutar un comando ó programa podemos revisar el estado del sistema para ver si se ejcuto correctamente:
```shell
usuario@pc:~$ ls /bin/usr
usuario@pc:~$ echo $?
```


---

## Archivos de texto

Veamos como podemos manipular archivos que contienen información como texto. Para ver el contenido de un archivo tenemos varias opciones, para archivos cortos la opción más usada es `cat`:

```shell
usuario@pc:~$ cat archivo.txt	
```

cuando el archivo es muy extenso y sólo queremos ver una parte de este podemos usar `head` ó `tail`, estos muestras las primeras y últimas lineas respectivamente:

```shell
usuario@pc:~$ head archivo.txt
usuario@pc:~$ tail archivo.txt
```

Para ver el contenido de un archivo de forma interactiva existe el comando `less`, ó su versión precedente `more`:
```shell
usuario@pc:~$ less archivo.txt 
```
al ejecutarlo se entra a un modo de visualización donde podemos explorar el archivo de forma interactiva, scroleando hacia abaho usando las flechitas, para salir apretamos la tecla `q` de *quit*.

### Editores de texto
Si buscamos una herramienta para leer y editar un archivo de texto que contenga más funciones, tenemos varias alternativas:

- `gedit`: es lo más parecido a un bloc de notas de Windows, es fácil de utilizar pero no tiene demasiadas funcionalidades.
- `vim`, `nano`, `emacs`, etc. : estos son editores con muchas más capacidades.


### Editores *al vuelo*
Un editor *on the fly* muy utilizado es `sed` (*Stream EDitor*), este permite realizar cambios u obtener porciones bien especificas del archivo con una escritura muy compacta y performance alta:

```shell
usuario@pc:~$ sed 's/[eiou]/a/g' archivo.txt > archivo_nuevo.txt
```

en este ejemplo reemplazamos todas las vocales presentes en `archivo.txt` por la vocal `a`, y redirigimos el *stdout* al archivo `archivo_nuevo.txt`. 


### Expresiones regulares

Las expresiones regulares son formulas abstractas que representan patrones de texto que tienen cierta estructura. Son muy útiles para buscar (y modificar) secuencias de texto dentro de un archivo que siga determinado patron.

Hay distintos comandos para trabajar con expresiones regulares, el mas conocido es ``grep``:

```shell
usuario@pc:~$ ls | grep "*.txt"	# mostrar archivos terminados en ".txt"
```

---

## Busqueda de archivos
Hay dos comandos principales para buscar archivos:

El primero es ``locate``, busca archivos por su nombre:
```shell
usuario@pc:~$ locate <patron> 	#Busca archivos por nombre en una jerarquia de directorios
```

El comando ``find`` incorpora otras variables para la busqueda:
```shell
usuario@pc:~$ find <patron>   	#Busca en directorio archivos con patron y los lista.
usuario@pc:~$ find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
usuario@pc:~$ find <patron> \(-type d \) -and/-or/-not  \(-size M  \)
usuario@pc:~$ find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
usuario@pc:~$ find <patron> -delete/-ls/-print/-quit
usuario@pc:~$ find <patron> -delete/-ls/-print/-quit -exec ls -l '{}' ';'
```


--- 

## Permisos y usuarios
Linux es un sistema operativo *multiusuario*, esto significa que muchos usuarios pueden estar utilizando la misma computadora en simultaneo. Cada usuario tiene un id, pertenece a almenos un grupo y tiene ciertos privilegios.

```shell
usuario@pc:~$ id    
usuario@pc:~$ users 
usuario@pc:~$ groups
```
Para ver cual es nuestra identidad podemos usar `whoami`:
```shell
usuario@pc:~$ whoami
usuario
```

A veces ocurre que no tenemos permisos para ejecutar ciertos comandos, por ejemplo:

```shell
usuario@pc:~$ ./enviar_cohete_a_marte.sh
bash: ./enviar_cohete_a_marte.sh: permision denied
```

con el comando `su` podemos cambiar de identidad al usuario con permiso de ejecución:
```shell
usuario@pc:~$ su elon 
elon@pc:~$ ./enviar_cohete_a_marte.sh
Enviando cohete...
elon@pc:~$ 
```

por razones de seguridad en la actualidad es más común el uso de `sudo`, sobre todo para poder ejecutar comandos en calidad de administrador ó *super-user*:

```shell
usuario@pc:~$ sudo
```
esto es muy útil cuando se quieren instalar programas ó hacer cambios importantes en la configuración de la computadora.

## Informacion de archivos

```shell
usuario@pc:~$ file <archivo>	#te muestra tipo de archivo
usuario@pc:~$ stat <archivo>  	#te muestra el estado del archivo
```

Si llamamos a `ls -l` vemos que lista los archvivos en el directorio presente, por ejemplo:
```shell
usuario@pc:~$ ls -l
drwxr-xr-x  8 usuario usuario    69632 may 19 22:55  Desktop
-rw-r--r--  1 usuario usuario     8980 abr  9 12:03  examples.desktop
lrwxrwxrwx  1 usuario usuario       15 may 27 14:43  dni.pdf -> Desktop/dni.pdf
```
La primer secencia de 10 letras y guíones describe el tipo de archivo (primer letra, **d**: directorio, **l**: link, **-** otro.) y el modo ó permisos para usar de cada arcihvo ó directorio (últimos 9 caracteréres, donde: **r**: permiso de lectura, **w**: permiso de escritura, **x**: permiso de ejecucion

El modo queda definido por tres numeros binarios (ó su equivalente hexadecimal). Por ejemplo `Desktop` tiene modo 111 101 101 (es decir: 755) y `examples.desktop` tiene modo 110 100 100 (es decir 644). La forma de leerlo es:

| descr.   | {tipo} |  {user}   | {group}  | {anyone} | 
|:-------- |:------:|:---------:|:--------:|:--------:| 
| alphanum |   -    | r w x  -  | - w -  - | r - x    | 
| binario  |        | 1 1 1  -  | 0 1 0  - | 1 0 1    | 
| decimal  |        |   7       |   2      |    5     | 

Para modificar el *modo* se utiliza el comando `chmod`, por ejemplo para agregar permiso de ejecución:

```shell
usuario@pc:~$ chmod +x script.sh
```

Para cambiar de propetiario y grupo de un archivo se utilizan los siguientes comandos:
```shell
usuario@pc:~$ chown archivo.txt	#change owner (propietario)
usuario@pc:~$ chgrp archivo.txt	#change group 
```


--- 

## Procesos

Los sistemas operativos basados en linux son *multi-task*, esto quiere decir que la secuencia de ejecucion de programas la realizan de tal forma que pareciera que se estan realizando multiples tareas en simultaneo (esto es estrictamente asi cuando la computadora posee varias unidades de procesamiento, que hoy en dia es lo más común):


### Como funciona un proceso?
Cuando el sistema se inicia, el kernel inicia sus actividades como procesos y lanza un programa llamado `init`. `init` a su vez ejecuta una serie de scripts (ubicados en `/etc`) llamados *init scripts*, que comienzan los servicios del sistema. Muchos de estos servicios se implementan como *daemons*, estos son programas que estan en las sombras haciendo sus cosas sin interferir con el suario. Por lo que aunque ni estemos logeados el sistema está ocupado haciendo sus cosas rutinarias.
El hecho de que el programa lance subprogramas se denomina *proceso madre*, produce *procesos hijos*.
El kernel mantiene información sobre cada proceso para mantener todo organizado. Por ejemplo, a cada proceso se le asigna un numero llamado *process ID* (`PID`). Los PIDs son asignados en orden ascendente donde `init` siempre tiene el valor de 1. El kernel tambien mantiene control de la memoria asignada a cada proceso, asi como su estado para continuar la ejecución. Como los archivos, los procesos también tienen *owners*, *user ID*, y demás.

### Ver procesos

El comando más usado para ver un *snapshot* de los procesos en ejecución es `ps`:
```shell
usuario@pc:~$ ps
    PID TTY          TIME CMD
 317940 pts/2    00:00:00 bash
 383698 pts/2    00:00:00 ps
```
podemos ver que hay dos procesos `bash` y el proceso `ps`, muestra los PID de cada proceso, el `TTY` (*teletype*) que es la terminal desde donde se controla el proceso, el `TIME` es el tiempo de CPU consumido por cada proceso.

Si agregamos el flag `xau` podemos ver los procesos controlados por todos los TTY: 
```shell
usuario@pc:~$ ps xau
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 166792 10852 ?        Ss   10:42   0:02 /sbin/init splash
root           2  0.0  0.0      0     0 ?        S    10:42   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   10:42   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<   10:42   0:00 [rcu_par_gp]
root           5  0.0  0.0      0     0 ?        I<   10:42   0:00 [slub_flushwq]
root           6  0.0  0.0      0     0 ?        I<   10:42   0:00 [netns]
...
```
Además de que vemos los procesos de otros TTY (gracias al flag `x`), también vemos que hay más información (gracias a los flags `a` y `u`), tenemos información del `USER` que ejecuta el proceso, el `PID`, el porcentaje de CPU y Memoria que consume, el `RSS` (*Resident Set Size*) es una medida de la memoria RAM utilizada, también podemos ver el estado del proceso `STAT` (donde `R`: running, `S`: sleeping, `T`: Stopped, `Z`: zombie, `N`: low-priority process, etc.), el `TIME` en que fue lanzado y por último el nombre del comando lanzado.

Existen otros comandos para seguir procesos, uno muy utilizado es `top` que permite seguir procesos en tiempo real:
```shell
usuario@pc:~$ top
```

### Control de procesos

Ahora que podemos monitorear los procesos intentemos realizar cosas con ellos.

Vamos a lanzar un proceso que simplemente muestra un logo en una ventana emergente llamado `xlogo`:

```shell
usuario@pc:~$ xlogo &
[1] 420000
usuario@pc:~$ jobs
[1]+  Running                 xlogo &
```

al usar `&` mandamos directamente el proceso al fondo inmediatamente luego de ejecutarlo. Para traerlo al frente usamos:

```shell
usuario@pc:~$ fg %1
```

vamos a ver que la terminal ya no está disponible, para parar el proceso podemos usar `CTRL` + `Z`, veremos que ahora el proceso está parado:

```shell
[1]   Interrupt               xlogo
usuario@pc:~$ jobs
[2]+  Stopped                 xlogo
```

para volver a inicial el proceso pero en el fondo podemos usar:
```shell
usuario@pc:~$ bg %2
```

Si queremos terminar el proceso podemos traerlo al frente denuevo con `fg %1` y luego matarlo con `CTRL`+`C`.


### Señales

Hay una forma más prolija de manejar procesos y esto es mediante el envio de señales con el comando `kill`.

Para terminar un proceso podemos usar `kill`:
```shell
usuario@pc:~$ kill <PID>   
```

además de matar un proceso con `kill` podemos enviar otras señales:

```shell
kill [señal] PID
```

Señales comúnes:

| Num.| Nombre  | Significado                                        |
|:----|:--------|:---------------------------------------------------|
| 1   | `HUP`   | Hang up.                                           |
| 2   | `INT`   | Interrupt. (`CTRL`-`C`)                            |
| 3   | `QUIT`  | Quit.                                              |
| 9   | `KILL`  | Kill.                                              |
| 15  | `TERM`  | Terminate. (default).                              |
| 18  | `CONT`  | Continue. Restaura proceso luego de una señal STOP.|
| 19  | `STOP`  | Stop. Pausa sin terminar el proceso.               |
| 11  | `SEGV`  | Segmentation violation.                            |
| 20  | `TSTP`  | Terminal stop. (`CTRL`-`Z`)                        |
| 28  | `WINCH` | Window change.                                     |


> Notar que cuando usamos `CTRL`-`C` y `CTRL`-`Z` en realidad lo que estabamos haciendo es enviar las señales de `INT`y `TSTP` respectivamente.


Aveces queremos eliminar multiples procesos a la vez, esto es posible mediante el uso del comando `killall <nombre_del_programa>`

---
## Información del sistema

```shell
usuario@pc:~$ date 	#fecha
usuario@pc:~$ cal	#calendario cool
```


```shell
usuario@pc:~$ uname 	#datos del sistema operativo
usuario@pc:~$ env	#variables de ambiente
usuario@pc:~$ df 	#                     
```


```shell
usuario@pc:~$ free	      #memoria libre
usuario@pc:~$ df	      #espacio libre en el disco rigido
```








---
## Otros comandos y herramientas útiles

### Historial de comandos
Con las flechas de direccion (arriba y abajo) podemos revisar comandos ejecutados anteriormente. 
Una forma de ver todo lo que fue ejecutado en la terminal abrierta es con el comando:``history``.
Podemos buscar lineas ejecutadas anteriormente aprentando ``<ctl>+r ``  y escribiendo el patron que se desea buscar.

### Ayuda 	
```shell
usuario@pc:~$ help
usuario@pc:~$ <comando> --help
usuario@pc:~$ help grep	#informacion sobre uso del comando
 
usuario@pc:~$ whatis grep	#te dice que es es el comando
usuario@pc:~$ type grep	#te dice que tipo de comando es
usuario@pc:~$ which grep	#te dice donde se ubica el comando
usuario@pc:~$ apropos copy	#busca una funcion apropiada para "copy"
 
usuario@pc:~$ man grep	#abre documentación de comando "grep"
usuario@pc:~$ info grep	#abre información de comando "grep"
```


### Compresión de archivos
Para comprimir se puede utilizar el programa ``tar``, cuyas opciones principales son ``-c`` para comprimir y ``-x`` para descomprimir. 
```shell 
usuario@pc:~$ tar -cvf comprimido.tar.gz carpeta 
usuario@pc:~$ tar -xzvf comprimido.tar.gz
```

### Manejo de paquetes y librerias
```shell
 apt-get --install <programa>	#instalar programa
	--update		#actualizar sistema
	--upgrade		#
``` 

### Otros
```shell
usuario@pc:~$ sort lista	#ordena lista de strings
usuario@pc:~$ uniq lista	#muestra todos los elementos de la lista sin repetirlos
usuario@pc:~$ split archivo	#divide archivos en partes iguales
usuario@pc:~$ wc archivo	#cuenta palabras del archivo/bits

usuario@pc:~$ diff archivo1 archivo2	#muestra diferencias entre archivos
```

### Ejecutables/programas 
```shell
usuario@pc:~$ ldd <ejecutable>		#lista las dependencias del ejecutable
usuario@pc:~$ ./<ejecutable>		#forma típica de ejecución de binarios.
```


## Variables internas:

| Variable   |	Details |
|------------|----------|
| `$*` /`$@`      | Function/script positional parameters (arguments). Expand as follows:
|                 | `$*` and `$@` are the same as $1 $2 ... (note that it generally makes no sense to leave those unquoted)
|                 | `$*` is the same as "$1 $2 ..." 1
|                 | `$@` is the same as "$1" "$2" ...
|                 |  1. Arguments are separated by the first character of $IFS, which does not have to be a space.
| `$#	          | Number of positional parameters passed to the script or function
| `$!	          | Process ID of the last (righ-most for pipelines) command in the most recently job put into the background (note that it's not necessarily the same as the job's process group ID when job control is enabled)
| `$$`	          | ID of the process that executed bash
| `$?`	          | Exit status of the last command
| `$n`	          | Positional parameters, where n=1, 2, 3, ..., 9
| `${n}`          | Positional parameters (same as above), but n can be > 9
| `$0`            | In scripts, path with which the script was invoked; with bash -c 'printf "%s\n" "$0"' name args': name (the first argument after the inline script), otherwise, the argv[0] that bash received.
| `$_`	          | Last field of the last command
| `$IFS`          | Internal field separator
| `$PATH`         | PATH environment variable used to look-up executables
| `$OLDPWD`       | Previous working directory
| `$PWD`          | Present working directory
| `$FUNCNAME`     | Array of function names in the execution call stack
| `$BASH_SOURCE`  | Array containing source paths for elements in FUNCNAME array. Can be used to get the script path.
| `$BASH_ALIASES` | Associative array containing all currently defined aliases
| `$BASH_REMATCH` | Array of matches from the last regex match
| `$BASH_VERSION` | Bash version string
| `$BASH_VERSINFO`| An array of 6 elements with Bash version information
| `$BASH`         | Absolute path to the currently executing Bash shell itself (heuristically determined by bash based on argv[0] and the value of $PATH; may be wrong in corner cases)
| `$BASH_SUBSHELL` | Bash subshell level
| `$UID`           | Real (not effective if different) User ID of the process running bash
| `$PS1`           | Primary command line prompt; see Using the PS Variables
| `$PS2`           | Secondary command line prompt (used for additional input)
| `$PS3`           | Tertiary command line prompt (used in select loop)
| `$PS4`           |Quaternary command line prompt (used to append info with verbose output)
| `$RANDOM`        | A pseudo random integer between 0 and 32767
| `$REPLY `        |Variable used by read by default when no variable is specified. Also used by select to return the user-supplied value
| `$PIPESTATUS`  | Array variable that holds the exit status values of each command in the most recently executed foreground pipeline.



## Expansiones



### Brace expansions

```shell
echo hola_{0..9}_{.txt,.dat}
```



## Arrays
```shell
letras=("a", "b", "c")

echo ${letras[@]}
echo ${letras[*]}
echo ${letras[@]}

```


```shell
var="PreHolaPost"
usuario@pc:~/test$ echo ${var#Pre}
HolaPost
usuario@pc:~/test$ echo ${var#Post}
PreHolaPost
usuario@pc:~/test$ echo ${var%Post}
PreHola
usuario@pc:~/test$ echo ${var/Hola/CHAU}
PreCHAUPost

```


##  `set`

```shell
set -x
```
