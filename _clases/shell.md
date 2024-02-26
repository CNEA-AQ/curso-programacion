---
layout: lecture
title: Shell
description: Sintaxis básica de shell (bash)
nav_order: 1
date: 2024-03-08
ready: true
---

> El shell o terminal, es el programa que nos permite interactuar en tiempo real con el sistema operativo atraves de entradas que damos desde el teclado. Casi todos las distribuciones de Linux usan una sintaxis basada en un proyecto GNU llamado **bash** (Bourne-Again SHell) que es una versión sucesora del programa original `sh` para la linea de comandos. En sistemas Mac la sintaxis es casi identica, y Windows la esta empezando a adpotar.


## Comandos

La *shell* consiste basicamente en una seríe de comandos (que usualmente son programas en C/C++ ya compilados, es decir ejecutables) que están disponibles para el usuario. La mayoria de los comandos tienen la siguiente sintaxis:

```shell
mi_comando -opciones <argumentos>
```
donde `mi_comando` es el comando que queremos ejecutar. `-opciones` son opciones de ejecución (tambien llamadas *flags*), y `argumentos` son los argumentos del comando a ejecutar. Por ejemplo:
```shell
ls -l /usr/bin
```
acá `ls` es un comando que lista (muestra) los archivos contenidos en cierto directorio, `-l` es una opción para que el listado contenga ciertos detalles de los archivos, y el argumento es el directorio objetivo, en este caso: `/usr/bin`

## Comentarios

Los comentarios son partes de código ó comandos que no se ejecutan. En el caso de la *shell* estos están antecedidos del caracter **`#`**, por ejemplo:

```shell
# Esta linea es un comentario
```

Todo lo que sigue al simbolo **`#`** no hace absolutamente nada. No es algo demasiado útil en el contexto del *shell* (aunque sí en otros contextos), pero en este tutorial pueden aparecer así que vale la pena mencionarlo.


## Estructura de directorios en UNIX/Linux

Los sistemas UNIX suelen tener una estructura de directorios (carpetas) bastante similar entre sí, acá vamos a describir solo algunos:

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


## Prompt

Cuando abras el emulador de terminal (con `ctrl`+`T`) vas a encontar con algo asi:
```shell
usuario@pc:mi_dir$
```

Esto se conoce como **prompt**, antecede siempre al cursor, y nos da alguna informacion de cual es nuestro estado.
Lo primero que dice es quien es el usuario que va a ejecutar las instrucciones (*usuario*), luego del **`@`** dice desde que computadora (*pc*), seguido de **`:`** dice el directorio en el que estamos ubicados dentro de *pc*, y por ultimo un signo que indica los privilegios del usuario (**`$`**: usuario normal, **`#`**:superuser/admin).
El prompt es completamente customizable y por lo tanto es posible encontrar otras estructuras, pero en general por default tienen estos elementos.

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

<!-- MEJORAR!!  -->
Un análogo a los "accesos directos" de Windows son los links, y hay de dos tipos: simbólicos (*symlink*) y duros (*hard-links*)

Un link simbólicos se crea así:
```shell
usuario@pc:~$ ln -s archivo link_archivo
```
Un link duro se crea así:
```shell
usuario@pc:~$ ln archivo link_archivo 
```
estos ultimos son más antiguos que los anteriores y tienen algunas limitaciones por lo que se acostumbra a usar links simbólicos.
<!-- Para entender la diferencia entre estos links es útil considerar que los archivos en consisten en dos partes: su nombre, y su contenido. Por 
### Inodes
```shell 
ls -i
``` -->


## Input/Output

Muchos de los comandos utilizados hasta ahora generan un output de algun tipo. Estos outputs consisten en dos tipos:
- resultados que el programa esta diseñado a producir (*stdout*)
- mensajes de error  (*stderr*)

Por ejemplo en linux, `ls` manda sus resultados a un archivo especial `/dev/stdout`, y los mensajes de error a otro llamado `/dev/stderr`. Ambos estan linkeados por default con la pantalla.

Ademas muchos programas toman sus argumentos de un *stdin*, por default linkeado a las entradas desde el teclado.

## Redireccion de `stdout`, `stderr` y `stdin`

Las salidas de los comandos por default generalmente van a la pantalla, y los inputs se toman desde el teclado.
Sin embargo podemos decidir donde llevar los stdin/stdout utilizando comandos de redireccion:
```shell
usuario@pc:~$ ls /usr/bin 1> msg_log.txt
usuario@pc:~$ ls /bin/usr 2> /dev/null
```

> Notar que el mensaje de error en el ultimo ejemplo fue enviado a `/dev/null` que es un archivo usado frecuentemente para enviar cosas que no serán usadas.

```shell
usuario@pc:~$ echo "Hola"		 #stdin   a stdout
usuario@pc:~$ read var			 #stdin   a var
usuario@pc:~$ cat > archivo 		 #stdin   a archivo
usuario@pc:~$ cat archivo >> archivo 	 #archivo a archivo (lo agrega)
```

### Pipelines

Una forma comun de redirigir `stdout` para usarlos en otros comandos es usando *pipelines* (`|`):

```shell
usuario@pc:~$ cat animales | sort	 #comando a comando ("pipe")
usuario@pc:~$ echo "Hola" | tee archivo	 #stdin   a archivo y stdout ("tee")
usuario@pc:~$ echo "Algo" | xargs mkdir	 #xargs: ejecuta comandos de un standard input (los pasa a argumentos de comandos)
```


### Status

Luego de ejecutar un comando ó programa podemos revisar el estado del sistema para ver si se ejcuto correctamente:
```shell
echo $?
```


## Archivos de texto
Para ver el contenido de un archivo de texto tenemos varias opciones:

```shell
usuario@pc:~$ cat archivo	#muestra todo el contenido como stdout
usuario@pc:~$ head archivo	#ver primer parte
usuario@pc:~$ tail archivo	#ver última parte
```

```shell
usuario@pc:~$ more archivo	#solo lectura (viejo)
usuario@pc:~$ less archivo  	#version moderna de less  ("more is less" xD)
```

### Editores de texto
Si buscamos un editor de texto con más funciones, algunos de los mas conocidos son:

```shell
usuario@pc:~$ gedit archivo	#(~ bloc de notas)
usuario@pc:~$ vim archivo	#(Recomiendo!)
usuario@pc:~$ nano archivo	#
usuario@pc:~$ emacs archivo	#
```

### Editores *al vuelo*
Un editor *on the fly* muy utilizado es `sed` (*Stream EDitor*):

```shell
usuario@pc:~$ sed 's/ioeu/a/g' archivo	
```

<!-- (!) Poner 2 ejemplos más para que se aprecie la utilidad que tiene.. -->


### Expresiones regulares
Las expresiones regulares son formulas abstractas que representan patrones de texto que tienen cierta estructura. Son muy útiles para buscar (y modificar) secuencias de texto dentro de un archivo que siga determinado patron.

Hay distintos comandos para trabajar con expresiones regulares, el mas conocido es ``grep``:

```shell
usuario@pc:~$ ls | grep "*.txt"	# mostrar archivos terminados en ".txt"
```

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

## Permisos y usuarios
Linux es un sistema operativo *multiusuario*, esto significa que muchos usuarios pueden estar utilizando la misma computadora en simultaneo.
Cada usuario tiene un id, y tiene ciertos privilegios.

```shell
usuario@pc:~$ id 			#ver id de usuario
usuario@pc:~$ users			#ver users
```

Para utilizar la terminal como otro usuario :

```shell
usuario@pc:~$ su - user2	#ingreso a la cuenta de user2 como si fuese el
usuario@pc:~$ su user2		#ingreso a la cuenta de user2, pero como user actual
```

Para realizar operaciones como *super-user*:

```shell
usuario@pc:~$ sudo			#ejecutar comando como superuser
```

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
La primer secencia de letras y guíones describe el tipo de archivo (primer letra, **d**: directorio, **l**: link, **-** otro.) y el modo ó permisos para usar de cada arcihvo ó directorio (últimos 9 caracteréres, donde: **r**: permiso de lectura, **w**: permiso de escritura, **x**: permiso de ejecucion

El modo queda definido por tres numeros binarios (ó su equivalente hexadecimal). Por ejemplo `Desktop` tiene modo 111 101 101 (es decir: 755) y `examples.desktop` tiene modo 110 100 100 (es decir 644). La forma de leerlo es:

| descr.   | {tipo} |  {user}   | {group}  | {anyone} | 
|:-------- |:------:|:---------:|:--------:|:--------:| 
| alphanum |   -    | r w x  -  | r w x  - | r w x    | 
| binario  |        | 1 1 1  -  | 0 1 0  - | 1 0 1    | 
| decimal  |        |   7       |   2      |    5     | 


Para modificar el *modo* se utiliza el comando `chmod`:

```shell
usuario@pc:~$ chmod <opcion> <archivo>	#cambiar modo de archivo 
```

```shell
usuario@pc:~$ chmod +x script.sh	#agregar permiso de ejecución a todos.
```

Para cambiar de propetiario y grupo de un archivo se utilizan los siguientes comandos:
```shell
usuario@pc:~$ chown archivo	#change owner (propietario)
usuario@pc:~$ chgrp archivo	#change group 
```

## Procesos

Los sistemas operativos basados en linux son *multi-task*, esto quiere decir que la secuencia de ejecucion de programas la realizan de tal forma que pareciera que se estan realizando multiples tareas en simultaneo (esto es estrictamente asi cuando la computadora posee varias unidades de procesamiento, que hoy en dia es lo más común):

Hay distintos comandos que nos dan informacion de los procesos que se estan ejecutando en la computadora:
```shell
usuario@pc:~$ ps	      #muestra snapshot de procesos: -A  -s -ef
usuario@pc:~$ top	      #muestra procesos en tiempo real
usuario@pc:~$ jobs	      #muestra procesos activos
usuario@pc:~$ free	      #memoria libre
usuario@pc:~$ df	      #espacio libre en el disco rigido
```

Para dar/quitar prioridad a un proceso por el resto de los otros:
```shell
usuario@pc:~$ bg		#manda proceso al fondo
usuario@pc:~$ fg		#manda proceso arriba
```
Para terminar un proceso:
```shell
usuario@pc:~$ kill <PID>    # mata proceso (PID)  OJOOO CON ESTO!!
usuario@pc:~$ killall	      #mata proceso por nombre
```

ver pID de proceso bash: `echo $$`


## Señales


```shell
kill [señal] PID
```


Señales comúnes:


|Num| Nombre | Significado                                        |
|---|--------|----------------------------------------------------|
|1  | ` HUP` | Hang up.                                           |
|2  | ` INT` | Interrupt. (CTRL -C)                               |
|9  | `KILL` | Kill.                                              |
|15 | `TERM` | Terminate. (default).                              |
|18 | `CONT` | Continue. Restaura proceso luego de una señal STOP.|
|19 | `STOP` | Stop. Pausa sin terminar el proceso.               |
|3  | `QUIT` | Quit.                                              |
|11 | `SEGV` | Segmentation violation.                            |
|20 | `TSTP` | Terminal stop.                                     |
|28 |`WINCH` | Window change.                                     |


## COMANDOS UTILES:

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
usuario@pc:~$ ./<ejecutable>			#forma típica de ejecución de binarios.
```

### Informacion del sistema
```shell
usuario@pc:~$ date 	#fecha
usuario@pc:~$ cal	#calendario cool
usuario@pc:~$ uname 	#datos del sistema operativo
usuario@pc:~$ env	#variables de ambiente
usuario@pc:~$ df 	#                     
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



## Brace expansions:

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
usuario@ram:~/test$ echo ${var#Pre}
HolaPost
usuario@ram:~/test$ echo ${var#Post}
PreHolaPost
usuario@ram:~/test$ echo ${var%Post}
PreHola
usuario@ram:~/test$ echo ${var/Hola/CHAU}
PreCHAUPost

```


##  `set`

```shell
set -x
```
