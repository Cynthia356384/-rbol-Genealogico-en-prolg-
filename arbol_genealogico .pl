%Proyecto en prolog "ARBOL GENEALÓGICO"

%--------------Hechos------------

%Hombres

hombre(porfirio).
hombre(felipe).
hombre(roger_padre). 
hombre(luis_tio).
hombre(manuel).
hombre(mario).
hombre(luis_primo).
hombre(raymundo).
hombre(rodrigo).
hombre(roger_hijo).
hombre(mateo).

%Mujeres

mujer(maria_abuela).
mujer(lucia).
mujer(clara).
mujer(nery).
mujer(yudi).
mujer(maria_prima).
mujer(olga).
mujer(cynthia).

%Relaciones de esposos

esposos(porfirio,maria_abuela).
esposos(felipe,lucia).
esposos(roger_padre,clara).

%Relaciones de padres e hijos

% PADRES
padre(porfirio,roger_padre).
padre(porfirio,yudi).

padre(felipe,luis_tio).
padre(felipe,nery).
padre(felipe,clara).

%hijos de Luis
padre(luis_tio,luis_primo).
padre(luis_tio,olga).

%Hijo de Rodrigo
padre(rodrigo,mateo).

%Hijos principales
padre(roger_padre,rodrigo).
padre(roger_padre,roger_hijo).
padre(roger_padre,cynthia).

% MADRES
madre(maria_abuela,roger_padre).
madre(maria_abuela,yudi).

madre(lucia,luis_tio).
madre(lucia,nery).
madre(lucia,clara).

%Hijos principales
madre(clara,rodrigo).
madre(clara,roger_hijo).
madre(clara,cynthia).

%hijos de Yudi
madre(yudi,manuel).
madre(yudi,maria_prima).
madre(yudi,mario).

%hijos de Nery
madre(nery,raymundo).

%--------------REGLAS-------------

% PADRE DE...
padre_de(X,Y):- padre(X,Y).

% MADRE DE...
madre_de(X,Y):- madre(X,Y).

% HIJOS DE...
hijo_de(X,Y):- padre(Y,X), hombre(X).
hijo_de(X,Y):- madre(Y,X), hombre(X).

hija_de(X,Y):- padre(Y,X), mujer(X).
hija_de(X,Y):- madre(Y,X), mujer(X).

% PROGENITORES...
progenitor(X,Y):- padre_de(X,Y).
progenitor(X,Y):- madre_de(X,Y).

% HERMANOS...
hermano(X,Y):- progenitor(Z,X), progenitor(Z,Y), hombre(X), X \= Y.
hermana(X,Y):- progenitor(Z,X), progenitor(Z,Y), mujer(X), X \= Y.

% ABUELO DE...
abuelo_de(X,Y):- padre(X,Z), padre(Z,Y).
abuelo_de(X,Y):- padre(X,Z), madre(Z,Y).

abuela_de(X,Y):- madre(X,Z), padre(Z,Y).
abuela_de(X,Y):- madre(X,Z), madre(Z,Y).

% TIOS DE...
tio_de(X,Y):- hermano(X,Z), progenitor(Z,Y).

% TIAS DE...
tia_de(X,Y):- hermana(X,Z), progenitor(Z,Y).

% ESPOSOS
esposo_de(X,Y):- esposos(X,Y), hombre(X).
esposo_de(X,Y):- esposos(Y,X), hombre(X).

esposa_de(X,Y):- esposos(X,Y), mujer(X).
esposa_de(X,Y):- esposos(Y,X), mujer(X).

% FAMILIARES
familiar(X,Y):- hermano(X,Y).
familiar(X,Y):- hermana(X,Y).

% PRIMOS

primo(X,Y):- progenitor(A,X), progenitor(B,Y), familiar(A,B), hombre(X), X \= Y.
prima(X,Y):- progenitor(A,X), progenitor(B,Y), familiar(A,B), mujer(X), X \= Y.

%PARA BUSCAR AMBOS ABUELOS (HOMBRE O MUJER)...
abuelo_o_abuela(X,Y):- abuelo_de(X,Y).
abuelo_o_abuela(X,Y):- abuela_de(X,Y). 

% ANCESTROS
ancestro(X,Y):- padre(X,Y).
ancestro(X,Y):- madre(X,Y).

ancestro(X,Y):- padre(X,Z), ancestro(Z,Y).
ancestro(X,Y):- madre(X,Z), ancestro(Z,Y).
