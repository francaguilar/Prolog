# prologProject

--------------------------------------------------------------------------------
-- Proyecto: Haskinator                                                       --
--                                                                            --
-- Fecha: 27/02/2015                                                          --
--                                                                            --
-- Autor:                                                                     --
--         Carlos Aponte 09-10041                                             --
--         Donato Rolo   10-10640                                             --
--------------------------------------------------------------------------------

------------------------------------
    Introducción:
------------------------------------

    Con este archivo Readme se busca aclarar posibles dudas sobre el contenido de 
los archivos del proyectom de las funciones que se implementaron, su accionar,
como se interrelacionan entre sí y las decisiones de diseno que se tomaron.


------------------------------------
    Problemas: 
------------------------------------

--------------
| Problema 1 |
--------------

	estaciones.pro -> se desea un predicato "estacion(X)" que unifique su 
		argumento las posibilidades de la mejor estación/ciudad. Para esto se
		toma en cuenta que:

		- Mejor Ciudad: la ciudad buena mas cercana a sus ciudades grandes.
		- Buena Ciudad: una ciudad pequena euidistante a sus dos ciudades
						grandes mas cercanas.
		- Pequena: una ciudad a lo sumo dos conexiones.
		- Grande: una ciudad con al menos tres conexiones.

			
	Los predicados elaborados para resolver dicho problema son:

		- estacion(X): unifica X con todas las ciudades/soluciones
		 	que pueden considerarse como "mejor".

		- pequena(X): tiene exito si unifica X con una ciudad pequena.

		- grande(X): tiene exito si unifica X con una ciudad grande.

		- bfs(I,F,C): tiene exito si unifica Camino con un
			camino optimo desde inicio hasta fin. 

		- bfs_helper(I,F,R,C,V,Cam): ejecutando el algoritmo de BFS recorre
			el grafo buscando la ruta optima desde el nodo I hasta el nodo F,
			tiene exito si unifica Cam con dicha ruta. 

		- armar_camino(I,R,C,T): recorre la ruta que tomo el BFS de Fin 
			a inicio armando el camino optimo. Tiene exito si unifica C 
			con dicho camino.

		- buena(X,C):- determina si una ciudad es buena y el costo a sus
			ciudades grandes mas cercanas. Tiene exito si unifica X con esa
			ciudad y C con dicho costo.

		- mejor(X): predicado que unifica X con una ciudad que cumpla las 
			condiciones necesarias.

		- todos_mejores(M,L,X): predicado auxiliar que unifica X con cada 
			una de las ciudades de la lista de buenas que pueden ser 
			consideradas como "mejor".

--------------
| Problema 2 |
--------------

	estrellas.pro -> se desea un predicado "estrella(X)" que sea capaz de 
		unificar X con una estrella mágica o que dado un X verifique si es una 
		estrella mágica. Se entiende por estrella mágica de N puntas a una 
		estrella polígono en la cual hay un número en cada vértice e intersección 
		y la suma de estos en cada línea es igual a 4N + 2. Una estrella mágica 
		contiene números en el rango 1..2N sin repeticiones.

		Para nustro problema en particular resovleremos el problema para N = 8,
		es decir una estrella de 8 puntas.

	Los predicados elaborados para resolver dicho problema son:

		- estrella(X): predicado capaz de unificar X con una estrella mágica o
			dado un X ya unificado verificar si este es una estrella mágica.

		- check(A,B,C,D): regla que verifica si los elementos de la linea suman 
			34 (4 * N + 2)

		- checkValues(L): predicado que verifica si los valores de L estan entre
			el 1 y 16 (2*N).

		-checkGreen([A,B,C,_,_,F,_,H,_,J,_,L,_,_,_,_]): predicado que chequea el
			lado izquierdo de ambos cuadrados (esta linea la llamamos linea 
			verde, sirvase de ver la imagen "estrella" ubicada en esta misma
			carpeta para mas claridad).

		-checkBlue([A,B,C,D,E,_,G,_,I,_,_,_,_,_,_,_]): predicado que chequea el
			lado superior de ambos cuadrados (esta linea la llamamos linea azul,
			sirvase de ver la imagen "estrella" ubicada en esta misma carpeta 
			para mas claridad).

		-checkYellow([_,_,_,_,_,_,_,H,_,J,_,L,M,N,O,P]): predicado que chequea el
			lado inferior de ambos cuadrados (esta linea la llamamos linea 
			amarilla, sirvase de ver la imagen "estrella" ubicada en esta misma
			carpeta para mas claridad).

		-checkOrange([_,_,_,_,E,_,G,_,I,_,K,_,_,N,O,P]): predicado que chequea el
			lado derecho de ambos cuadrados (esta linea la llamamos linea 
			naranja, sirvase de ver la imagen "estrella" ubicada en esta misma
			carpeta para mas claridad).

		-generate([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]): predicado que genera las 
			estrellas magicas asegurandose de que cumplan todas las condiciones
			previamente establecidas.

		-genNumeros(0,H): predicado que genera los numeros de 1 hasta N.
		  
--------------
| Problema 3 |
--------------
	
	laberinto.pro -> se desea ser capaz de leer, resolver y escribir un laberinto
		rectangular de tamano MxN, siendo estos el numero de filas y columnas
		respectivamente. En este laberinto tenemos que:

		- Los espacios abiertos estan representados por espacios " ".
		- Los espacios cerrados/muros estan representados por numerales "#".
		- Los puntos de la solucion estan representados por puntos ".".

	Los predicados elaborados para resolver dicho problema son:

		- leer(L,M,N): predicado que se encarga de recibir un nombre de archivo,
			leer su contenido,interpretarlo y unificarlo con una lista "L" de
			puntos abiertos. Asi mismo, se encarga de unificar M y N con el 
			numero de filas y columnas respectivamente.

		- resolver(A,M,N,C): predicado que toma las medidas M y N del laberinto
			asi como la lista de puntos abiertos "A" y de determinar todos los 
			caminos "C" que lleven del inicio (0,0) a las salida.

		- escribir(C,M,N,A): pedicado que toma las medidad M y N del laberinto
			asi como una lista de puntos abiertos "A" y una solucion "C" del 
			laberinto y escribe por salida estandar dicho laberinto con su 
			respectiba solucion.

		- resolver_optimo(A,M,N,C): predicado extra que retorna una solucion
			optima para cada salida que exista en el grafo. Esto, mediante el
			uso del algoritmo BFS.

		- arriba(X,Y,X,Y2): predicados que da las cordenadas resultantes luego
			de moverse hacia arriba en el eje Y (una fila menos).

		-abajo(X,Y,X,Y2): predicados que da las cordenadas resultantes luego
			de moverse hacia abajo en el eje Y (una fila mas).

		-derecha(X,Y,X2,Y): predicados que da las cordenadas resultantes luego
			de moverse hacia la derecha en el eje X (una columna mas).

		-izquierda(X,Y,X2,Y): predicados que da las cordenadas resultantes luego
			de moverse hacia la izquierda en el eje X (una columna menos).

		-valido(X,Y,M,N): redicado que determina si un punto esta dentro del 
			laberinto.

		- moverse(X,Y,X2,Y2): predicado que determina todos los movimientos 
			desde un punto de inicio (x,y).

		-vecino(X,Y,VX,VY,M,N,A): predicado que determina si un punto es vecino
			de otro.

		-salida(X,Y,N,L):predicado que determina si un punto es salida del 
			laberinto. Para esto se ve si es un punto abierto y esta en la 
			ultima columna.

		-camino(Xini,Yini,Xfin,Yfin,M,N,A,C): predicado que calcula los caminos
			"C" desde el punto (Xini,Yini) hasta (Xfin,Yfin) a traves de los 
			puntos abiertos en la lista "A".

		-calcular(Xini,Yini,Xini,Yini,M,N,C,A,V): predicado
			que recorre el laberinto en busca de la salida tomando la decision
			de hacia donde moverse dependiendo de los casos presentados. Tiene
			exito si logra unificar "C" con un camino hasta la salida.

		-bfs(Xi,Yi,Xf,Yf,M,N,A,C) tiene exito si unifica Camino con un
			camino optimo desde inicio hasta fin. 

		-bfs_helper(Xi,Yi,Xf,Yf,M,N,A,R,C,V,Cam): ejecutando el algoritmo de BFS
			recorre el laberitno buscando la ruta optima desde la entrada a cada 
			una de las salidas existentes. Tiene exito si logra unificar "Cam" 
			con dicha solucion.

		- armar_camino(Xi,Yi,R,C,T): recorre la ruta que tomo el BFS de Fin
			a inicio armando el camino optimo. Tiene exito si unifica C 
			con dicho camino.

		- procesar_lectura(Ch,S,X,Y,M,N,A,T): predicado que se encarga de
			interpretar los caracteres leidos del archiv "S". Determinando las 
			dimensiones M y N, asi como la lista "A" de puntos abiertos.

		- procesar_escritura(X,Y,S,O,M,N):- predicado que se encarga de imprimir
			en salida standard un laberinto dada una lista de espacios abiertos 
			y un camino/solucion.

		- siguiente(X,Y,XN,YN,M,N): predicado que determina cual es el siguiente
			 punto a imprimir dentro del laberinto asumiendo que este se recorre
			 de izquierda a derecha y de arriba abajo.

--------------
| Problema 4 |
--------------
	
	unificacion.pro -> se desea implantar el Algoritmo de Unificación de Prolog
		 con “Occurs Check” para garantizar terminación. Para esto se debe 
		 dar un predicado unifica(X,Y) que tendrá éxito en el caso que sus 
		 argumentos de entrada unifiquen y falle en caso contrario.

              


------------------------------------   
      Decisiones de Diseno
------------------------------------ 
     
    1) Implementacion de BFS: se decidio implementar el algoritmo de BFS para 
    		el problema 1 ya que esto mejora considerablemente la velocidad
    		con que se consigue la respuesta del mismo. Al usar este algoritmo
    		garantizamos que las dos primeras ciudades grandes que encontremos
    		seran las mas cercanas y en ese momento podemos comparar sus 
    		distancias y no tener que buscar otras posibilidades, las cuales no
    		serian utiles.

     Revisiones en Estrellas ->
     
     3) Puntos del Laberinto --> Se toman los puntos como tuplan de coordenadas
     		(X,Y), siendo "X" la referente a la fila y "Y" a la columna.

     4) Resolucion Optima del Laberinto -> se decidio implementar un predicado
     		extra llamado "resolver_optimo" el cual optiene una ruta optima para 
     		cada posible salida del laberinto, siendo necesario para esto que se
     		modificara el algoritmo de BFS implementado para el problema 1.


     magia en unificacion -> 
         
------------------------------------   
        Contacto
------------------------------------ 

caat91@gmail.com
donatorolo93@gmail.com
