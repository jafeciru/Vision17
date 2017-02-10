# 1. grep:
Su funcionalidad es la de escribir en salida estándar aquellas líneas que concuerden con un patrón. Busca patrones en archivos.
Sintaxis: grep [-cilnv] expr nom_archivos.
# 2. prune:
Es una restriccion a la funcion find. Esta impide que la funcion find busque por todo el directorio, restringe la busqueda.
Ejemplo: find . -name .snapshot -prune -o -name "*.foo" -print
Este comando encontrara los archvivos que contienen "*.foo" que no estan en los directorios ".snapshot".
# 3. cut
Ttiene como uso principal mostrar una columna de una salida determinada. La opción -d va seguida del delimitador de los campos y la opción -f va seguida del número de campo a mostrar. El “delimitador” por defecto es el tabulador, nosotros lo cambiamos con la opción -d. Tiene algunas otras opciones útiles.
Sintaxis: cut [opciones] nom_archivo.
# 4. rsync:
Es una herramineta de copiado de archivos rapida y versatil. Puede copiar desde o hacia otro host, sobre cualquier shell remoto
# 5. diff:
Busca y muestra diferencias entre archivos.
# 6. tail:
Este comando es utilizado para examinar las últimas líneas de un fichero.
Sintaxis: tail -count nom_archivo.
# 7. tail-f
Sinónimo del comando tail -f, permite ver en tiempo real la parte final de un archivo, es decir, conforme se va escribiendo, útil para monitorear bitácoras.
# 8. link:
El comando link se usa para crear un enlace a un archivo. También se le llama enlace duro. El inodo será el mismo para el origen y el destino.

	del 1 al 8. [1]
#9. ```#! /bin/bash:
Esta linea indica donde se encuentra el interprete de comandos en nuestro sistema. Por defecto todos los sistemas que tengan Bash instalado, lo tendran en el directorio /bin. Al utilizar esta linea, podremos ejecutar el script como un programa normal, ya que el sistema sabra que es un script en Bash y que tiene que hacer con el.[2] 

#10. Hay 8 usuarios en el servidor del curso.

#11. 
Se uso el comando 
	cut -d: -f1,6 /etc/passwd| cut -d/ -f1,2| sort -b. 
Este comando realiza dos cortes en / y en :. Luego deja el primer nombre y el shell. 
12. 
	```#! /bin/bash
	md5sum *| sort |uniq -w33 -D   [3]
	Este script permite indentificar las imagenes que se encuentran duplicadas.
13. Se descargo la carpeta con el comando:
	scp -r vision@157.253.63.7:/datos1/vision/BSR_bsds500.tar
Para descomprimirlo se uso el comando:
	tar -xzvf Imagenes/BSR_bsds500.tgz
14. Para hallar el disco que ocupa se utilizo el comando:
	du -bs Imagenes/BSR   [4]
Tiene un tamaño de 73540912 bytes

Hay 500 imagenes en el directorio solicitado
Se utilizao el comando:
	find Imagenes/BSR/BSDS500/data/images -name "*.jpg" | wc -l

15. Las imagenes tienen un formato de .jpg y presentan una resolucion de 154K pixeles.
Se utilizao el comando:
	identify -verbose "*.jpg". Se utilizo en cada carpeta de imagenes [5]

16.Hay 348 imagenes landscape y 152 imagenes 
	find Imagenes/BSR/BSDS500/data/images -name "*.jpg" -exec identify {} \; | grep -i 481x321 | wc -l. Este codigo esta basado en la guia, el cambio se hace por 481x321. Esto funciona ya que todas las imagenes son de tamaño 481x321 o 321x481

17. Para recortar las imagenes usamos:
	convert -resize 256x256! *.jpg [6]

Bibliografia: 

[1]. Tomado de https://www.computerhope.com/
[2]. Tomando de http://www.linux-es.org/node/147
[3]. Tomado de http://www.elsotanillo.net/2006/10/linux-script-bash-para-encontrar-ficheros-duplicados-con-diferentes-nombres-en-el-mismo-directorio-2/
[4]. Tomado de http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[5]. Tomado de https://www.imagemagick.org/script/identify.php 
[6]. Tomado de http://blog.desdelinux.net/como-manipular-imagenes-desde-el-terminal/

