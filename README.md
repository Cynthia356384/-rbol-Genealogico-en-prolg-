# 🧠 Árbol Genealógico en Prolog

## 📌 Descripción

Proyecto desarrollado en **Prolog** que implementa un sistema de árbol genealógico familiar mediante **hechos y reglas lógicas**.

El sistema permite realizar consultas sobre diferentes relaciones de parentesco, como padres, hijos, hermanos, abuelos, tíos, primos, esposos y ancestros. :contentReference[oaicite:1]{index=1}

---

## 🎯 Objetivo

Representar las relaciones familiares mediante programación lógica y permitir obtener información sobre los diferentes integrantes de la familia mediante consultas en Prolog.

---

## 👨‍👩‍👧‍👦 Integrantes del árbol familiar

El árbol genealógico contiene diferentes integrantes representados mediante identificadores en Prolog.

### 👨 Hombres

- `porfirio` — Abuelo paterno
- `felipe` — Abuelo materno
- `roger_padre` — Padre principal
- `luis_tio` — Tío
- `manuel` — Hijo de Yudi
- `mario` — Hijo de Yudi
- `luis_primo` — Hijo de Luis Tío
- `raymundo` — Hijo de Nery
- `rodrigo` — Hijo de Roger padre y Clara
- `roger_hijo` — Hijo de Roger padre y Clara
- `mateo` — Hijo de Rodrigo

### 👩 Mujeres

- `maria_abuela` — Abuela paterna
- `lucia` — Abuela materna
- `clara` — Hija de Felipe y Lucía, esposa de Roger padre
- `nery` — Hija de Felipe y Lucía
- `yudi` — Hija de Porfirio y María Abuela
- `maria_prima` — Hija de Yudi
- `olga` — Hija de Luis Tío
- `cynthia` — Hija de Roger padre y Clara

:contentReference[oaicite:2]{index=2}

---

## ⚙️ ¿Cómo funciona?

El programa utiliza dos elementos principales de la programación lógica:

### 📌 Hechos (Facts)

Los hechos representan información declarada directamente y no requieren razonamiento adicional.

Ejemplos:

```prolog
hombre(porfirio).
mujer(clara).

padre(roger_padre, rodrigo).
madre(clara, rodrigo).

esposos(porfirio, maria_abuela).


Reglas (Rules)

Las reglas permiten deducir nueva información a partir de los hechos existentes.

Ejemplo:

hermano(X, Y) :-
    progenitor(Z, X),
    progenitor(Z, Y),
    hombre(X),
    X \= Y.

Esta regla permite determinar si una persona es hermano de otra cuando comparten un progenitor y no son la misma persona.

🔤 Variables en Prolog

Las variables en Prolog comienzan con mayúscula, como:

X
Y
Z

Al realizar una consulta, Prolog busca los valores que satisfacen las condiciones establecidas.

El símbolo ; permite solicitar más soluciones, mientras que Enter permite terminar la búsqueda.

🔎 Consultas

El programa permite realizar diferentes consultas para explorar las relaciones familiares.

👨 Padre
?- padre_de(Padre, Hijo).

Ejemplo:

?- padre_de(roger_padre, X).

Resultado:

X = rodrigo ;
X = roger_hijo ;
X = cynthia

👩 Madre
?- madre_de(Madre, Hijo).

Ejemplo:

?- madre_de(clara, X).

Resultado:

X = rodrigo ;
X = roger_hijo ;
X = cynthia

👦 Hijo e hija
?- hijo_de(Hijo, Progenitor).
?- hija_de(Hija, Progenitor).

Ejemplos:

?- hijo_de(X, clara).

Resultado:

X = rodrigo ;
X = roger_hijo
?- hija_de(X, clara).

Resultado:

X = cynthia

👬 Hermanos y hermanas
?- hermano(Hermano, Referencia).
?- hermana(Hermana, Referencia).

Ejemplos:

?- hermano(X, cynthia).

Resultado:

X = rodrigo ;
X = roger_hijo
?- hermana(X, rodrigo).

Resultado:

X = cynthia

👴 Abuelos y abuelas
?- abuelo_de(Abuelo, Nieto).
?- abuela_de(Abuela, Nieto).
?- abuelo_o_abuela(X, Nieto).

Ejemplo:

?- abuelo_o_abuela(X, rodrigo).

Resultado:

X = porfirio ;
X = felipe ;
X = maria_abuela ;
X = lucia

👨 Tíos y 👩 Tías
?- tio_de(Tio, Sobrino).
?- tia_de(Tia, Sobrino).

Ejemplos:

?- tio_de(X, rodrigo).

Resultado:

X = luis_tio
?- tia_de(X, rodrigo).

Resultado:

X = yudi ;
X = nery

🧑 Primos y primas
?- primo(Primo, Referencia).
?- prima(Prima, Referencia).

Ejemplo:

?- primo(X, rodrigo).

Resultado:

X = manuel ;
X = mario ;
X = raymundo ;
X = luis_primo
?- prima(X, rodrigo).

Resultado:

X = maria_prima ;
X = olga

💍 Esposos y esposas
?- esposo_de(Esposo, Esposa).
?- esposa_de(Esposa, Esposo).

Ejemplos:

?- esposo_de(porfirio, maria_abuela).

Resultado:

true
?- esposa_de(X, felipe).

Resultado:

X = lucia

También es posible consultar todas las parejas:

?- esposos(X, Y).

🌳 Ancestros

El sistema también permite consultar relaciones de ancestros.

Ejemplo:

?- ancestro(rodrigo, mateo).

Resultado:

true

También se pueden obtener todos los ancestros de una persona:

?- ancestro(X, mateo).

El sistema devuelve los diferentes ancestros definidos en el árbol.

📋 Consultas con setof

El proyecto utiliza setof para recopilar todos los resultados que cumplen una condición y devolverlos en una lista ordenada y sin duplicados.

Sintaxis:

?- setof(Qué_buscar, Condición, Lista).

A diferencia de una consulta directa, setof permite obtener todos los resultados juntos en una lista.

Ejemplo: hermanos
?- setof(Y, hermano(roger_hijo, Y), Lista).

Resultado:

Lista = [cynthia, rodrigo]
Ejemplo: hijos
?- setof(Y, padre_de(roger_padre, Y), Lista).

Resultado:

Lista = [cynthia, rodrigo, roger_hijo]
Ejemplo: ancestros
?- setof(X, ancestro(X, mateo), Lista).

Resultado:

Lista = [clara, felipe, lucia, maria_abuela, porfirio, rodrigo, roger_padre]

🔍 Consultas de exploración general

También es posible utilizar variables libres para obtener las diferentes instancias de una relación.

Ejemplos:

?- hombre(X).
?- mujer(X).
?- padre(X, Y).
?- madre(X, Y).
?- hermano(X, Y).
?- hermana(X, Y).
?- primo(X, Y).
?- prima(X, Y).
?- tio_de(X, Y).
?- tia_de(X, Y).
?- esposos(X, Y).
?- abuelo_o_abuela(X, Y).
?- ancestro(X, Y).

Estas consultas permiten explorar las diferentes relaciones existentes en el árbol genealógico.

🧠 Conceptos utilizados

Durante el desarrollo del proyecto se trabajaron conceptos de:

Programación lógica.
Hechos (Facts).
Reglas (Rules).
Variables.
Consultas.
Relaciones familiares.
Inferencia lógica.
Relaciones de parentesco.
Ancestros y descendientes.
Listas.
setof.
findall.
📚 Documentación

El proyecto incluye un manual con información sobre:

Introducción al programa.
Integrantes de la familia.
Hechos y reglas.
Variables en Prolog.
Consultas directas.
Consultas con setof.
Consultas de exploración general.
Ejemplos de resultados.
Recomendaciones para ejecutar consultas.
📁 Archivos del proyecto
📁 Árbol Genealógico
│
├── 📄 arbol_genealogico
├── 📄 manual_arbol_prolog.pdf
└── 📄 README.md
🛠️ Tecnología utilizada
Prolog

Lenguaje utilizado para implementar la representación de conocimiento, las relaciones familiares, las reglas lógicas y las consultas del sistema.

🎓 Aprendizajes

Este proyecto permitió trabajar y comprender conceptos relacionados con:

Programación lógica.
Representación de conocimiento.
Creación de hechos.
Creación de reglas.
Variables en Prolog.
Consultas lógicas.
Relaciones entre personas.
Inferencia a partir de reglas.
Consultas con múltiples resultados.
Uso de setof.
Uso de findall.
📌 Estado del proyecto

🟢 Proyecto académico terminado

Proyecto desarrollado como práctica de Programación Lógica utilizando Prolog.
