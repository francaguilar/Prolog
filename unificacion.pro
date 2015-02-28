
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Programación Lógica - Tarea       %
%                                       %
%   Carlos Aponte     		09-10041    %
%   Donato Rolo             10-10640    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4.- Unificación

unificacion(U,V) :- 
   var(U), 
   ground(V),
   U = V.

unificacion(V,U) :- 
   var(U), 
   ground(V),
   U = V.

unificacion(U,V) :- 
   ground(U), 
   ground(V),
   U == V.

unificacion(U,V) :- 
   \+var(U), 
   ground(V),
   functor(U,Functor,Arity),
   functor(V,Functor,Arity),
   unificarArgumentos(U,V,1,Arity).

unificacion(V,U) :- 
   \+var(U), 
   ground(V),
   functor(U,Functor,Arity),
   functor(V,Functor,Arity),
   unificarArgumentos(U,V,1,Arity).

unificacion(U,V):-
	\+var(U),
	\+var(V),
	functor(U,Functor,Arity),
	functor(V,Functor,Arity),
	unificarArgumentos(U,V,1,Arity).

% Caso para unificar los parametros de los 'functores'
unificarArgumentos(_,_,N,Arity) :- 
   N > Arity.
unificarArgumentos(U,V,N,Arity) :- 
   N =< Arity,
   arg(N,U,ArgU),
   arg(N,V,ArgV), 
   unificacion(ArgU,ArgV),
   N1 is N+1, 
   unificarArgumentos(U,V,N1,Arity).
unificarArgumentos(V,U,N,Arity) :- 
   N =< Arity,
   arg(N,U,ArgU),
   arg(N,V,ArgV), 
   unificacion(ArgU,ArgV),
   N1 is N+1, 
   unificarArgumentos(U,V,N1,Arity).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%