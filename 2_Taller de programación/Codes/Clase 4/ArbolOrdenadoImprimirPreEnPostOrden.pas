program arboles;
const
 r=11;
type
	arbol=^nodoA;
	nodoA=record
		dato:integer;
		izq:arbol;
		der:arbol;
	end;
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;


procedure insertar(var a:arbol; d:integer);
var
	aux:arbol;
begin
	if (a=nil)then begin
		new(aux);
		aux^.dato:=d;
		aux^.der:=nil;
		aux^.izq:=nil;
		a:=aux;
		end
	else 
		if(d>a^.dato) then insertar(a^.der,d)
		else insertar(a^.izq,d);
end;

procedure imprimirArbolEnOrden(a:arbol);
begin
	if(a<>nil)then begin
		imprimirArbolEnOrden(a^.izq);						
		writeln(a^.dato,' - ');
		imprimirArbolEnOrden(a^.der);
	end;
end;

procedure imprimirArbolPreOrden(a:arbol);
begin
	if(a<>nil)then begin
		writeln(a^.dato,' - ');
		imprimirArbolPreOrden(a^.izq);						
		imprimirArbolPreOrden(a^.der);
	end;
end;

procedure imprimirArbolPostOrden(a:arbol);
begin
	if(a<>nil)then begin
		imprimirArbolPostOrden(a^.izq);						
		imprimirArbolPostOrden(a^.der);
		write(a^.dato,' - ');
	end;
end;

procedure crearLista(var l:lista);
var
	d:integer;
	aux:lista;
begin
	d:=random(r);
	while (d<>0) do begin
		new(aux);
		aux^.dato:=d;
		aux^.sig:=l;
		l:=aux;
		d:=random(r);
	end;
end;

procedure recorrerLista(l:lista;var a:arbol);
begin
	while (l<>nil)do begin
		insertar(a,l^.dato);
		l:=l^.sig;
	end;
end;

procedure imprimirLista(l:lista);
begin
	write('Datos de Lista: ');
	while (l<>nil)do begin
		writeln(l^.dato);
		l:=l^.sig;
	end;
	writeln();
	writeln();
end;

var
	l:lista;
	a:arbol;
begin
	randomize;
	a:=nil;
	l:=nil;
	crearLista(l);
	imprimirLista(l);
	recorrerLista(l,a); //Recorre la lista cargando el arbol
	writeln('Datos del Arbol: ');
	writeln('PRE ORDEN: ');
	imprimirArbolPreOrden(a);
	writeln('EN ORDEN: ');
	imprimirArbolEnOrden(a);
	writeln('POST ORDEN: ');
	imprimirArbolPostOrden(a);
	readln();
end.