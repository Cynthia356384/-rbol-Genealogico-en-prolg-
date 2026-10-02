# 🧠 Árbol Genealógico en Prolog

## 📌 Descripción

Proyecto académico desarrollado en **Prolog** que implementa un sistema de árbol genealógico familiar mediante **hechos y reglas lógicas**.

El sistema permite realizar consultas sobre diferentes relaciones de parentesco, como:

- Padres.
- Hijos.
- Hermanos.
- Abuelos.
- Tíos.
- Primos.
- Esposos.
- Ancestros.

El proyecto utiliza programación lógica para representar las relaciones familiares y obtener nueva información mediante reglas e inferencia lógica.

---

# 🎯 Objetivo

Representar las relaciones familiares mediante **programación lógica** y permitir obtener información sobre los diferentes integrantes de la familia mediante consultas en Prolog.

El proyecto permite trabajar con hechos, reglas, variables, consultas y mecanismos para obtener múltiples resultados.

---

# 👨‍👩‍👧‍👦 Integrantes del árbol familiar

El árbol genealógico contiene diferentes integrantes representados mediante identificadores en Prolog.

## 👨 Hombres

- `porfirio` — Abuelo paterno.
- `felipe` — Abuelo materno.
- `roger_padre` — Padre principal.
- `luis_tio` — Tío.
- `manuel` — Hijo de Yudi.
- `mario` — Hijo de Yudi.
- `luis_primo` — Hijo de Luis Tío.
- `raymundo` — Hijo de Nery.
- `rodrigo` — Hijo de Roger padre y Clara.
- `roger_hijo` — Hijo de Roger padre y Clara.
- `mateo` — Hijo de Rodrigo.

## 👩 Mujeres

- `maria_abuela` — Abuela paterna.
- `lucia` — Abuela materna.
- `clara` — Hija de Felipe y Lucía, esposa de Roger padre.
- `nery` — Hija de Felipe y Lucía.
- `yudi` — Hija de Porfirio y María Abuela.
- `maria_prima` — Hija de Yudi.
- `olga` — Hija de Luis Tío.
- `cynthia` — Hija de Roger padre y Clara.

---

# ⚙️ ¿Cómo funciona?

El programa utiliza principalmente dos elementos de la programación lógica:

## 📌 Hechos (Facts)

Los hechos representan información declarada directamente y sirven como base para que Prolog pueda realizar inferencias.

Ejemplos:

```prolog
hombre(porfirio).
mujer(clara).

padre(roger_padre, rodrigo).
madre(clara, rodrigo).

esposos(porfirio, maria_abuela).

Los hechos permiten representar información como:

Género de una persona.
Relaciones de parentesco.
Relaciones entre padres e hijos.
Relaciones matrimoniales.
📌 Reglas (Rules)

Las reglas permiten deducir nueva información a partir de los hechos existentes.

Ejemplo:

hermano(X, Y) :-
    progenitor(Z, X),
    progenitor(Z, Y),
    hombre(X),
    X \= Y.

Esta regla permite determinar si una persona es hermano de otra cuando comparten un progenitor y no son la misma persona.

Las reglas permiten construir relaciones más complejas a partir de información previamente definida.

🔤 Variables en Prolog

Las variables en Prolog comienzan con mayúscula.

Ejemplos:

X
Y
Z

Al realizar una consulta, Prolog busca los valores que satisfacen las condiciones establecidas.

Por ejemplo:

?- padre_de(roger_padre, X).

La variable X representa a las personas que cumplen la relación indicada.

Durante una consulta:

; permite solicitar otra solución.
Enter permite terminar la búsqueda de soluciones.
🔎 Consultas

El programa permite realizar diferentes consultas para explorar las relaciones familiares.

👨 Padres

Consulta:

?- padre_de(Padre, Hijo).

Ejemplo:

?- padre_de(roger_padre, X).

Resultado:

X = rodrigo ;
X = roger_hijo ;
X = cynthia
👩 Madres

Consulta:

?- madre_de(Madre, Hijo).

Ejemplo:

?- madre_de(clara, X).

Resultado:

X = rodrigo ;
X = roger_hijo ;
X = cynthia
👦 Hijos e hijas

Consultas:

?- hijo_de(Hijo, Progenitor).
?- hija_de(Hija, Progenitor).
Ejemplo: hijos de Clara
?- hijo_de(X, clara).

Resultado:

X = rodrigo ;
X = roger_hijo
Ejemplo: hijas de Clara
?- hija_de(X, clara).

Resultado:

X = cynthia
👬 Hermanos y hermanas

Consultas:

?- hermano(Hermano, Referencia).
?- hermana(Hermana, Referencia).
Ejemplo: hermanos de Cynthia
?- hermano(X, cynthia).

Resultado:

X = rodrigo ;
X = roger_hijo
Ejemplo: hermana de Rodrigo
?- hermana(X, rodrigo).

Resultado:

X = cynthia
👴 Abuelos y abuelas

Consultas:

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

Consultas:

?- tio_de(Tio, Sobrino).
?- tia_de(Tia, Sobrino).
Ejemplo: tíos de Rodrigo
?- tio_de(X, rodrigo).

Resultado:

X = luis_tio
Ejemplo: tías de Rodrigo
?- tia_de(X, rodrigo).

Resultado:

X = yudi ;
X = nery
🧑 Primos y primas

Consultas:

?- primo(Primo, Referencia).
?- prima(Prima, Referencia).
Ejemplo: primos de Rodrigo
?- primo(X, rodrigo).

Resultado:

X = manuel ;
X = mario ;
X = raymundo ;
X = luis_primo
Ejemplo: primas de Rodrigo
?- prima(X, rodrigo).

Resultado:

X = maria_prima ;
X = olga
💍 Esposos y esposas

Consultas:

?- esposo_de(Esposo, Esposa).
?- esposa_de(Esposa, Esposo).
Ejemplo
?- esposo_de(porfirio, maria_abuela).

Resultado:

true
Ejemplo
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

También se pueden obtener los diferentes ancestros de una persona:

?- ancestro(X, mateo).

El sistema devuelve los diferentes ancestros definidos en el árbol.

📋 Consultas con setof

El proyecto utiliza setof para recopilar todos los resultados que cumplen una condición y devolverlos en una lista ordenada y sin duplicados.

Sintaxis
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

Prolog es el lenguaje utilizado en este proyecto para implementar:

La representación del conocimiento.
Las relaciones familiares.
Los hechos.
Las reglas lógicas.
Las consultas del sistema.
La inferencia lógica.
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

⭐ Resumen

Árbol Genealógico en Prolog es un proyecto académico basado en programación lógica que representa una familia mediante hechos y reglas, permitiendo realizar consultas sobre relaciones de parentesco y obtener información mediante inferencia lógica.

Tecnología: Prolog
Tipo: Proyecto académico de programación lógica
Estado: Terminado


### Una cosa importante para tu portafolio

Este README **no lo mezclaría con los otros proyectos**.

Tu portafolio puede tenerlos separados así:

| Proyecto | Tipo | Tecnología | Tu participación |
|---|---|---|---|
| 🐄 **MI-RANCHO** | Aplicación móvil | Flutter / Dart / RFID | UX/UI y Diseño Visual |
| 🥐 **Dulce Tentación** | Aplicación de escritorio | Java / JavaFX / FXML / CSS | Diseño y desarrollo de interfaces |
| 🧠 **Árbol Genealógico** | Proyecto de programación lógica | Prolog | Proyecto académico de programación lógica |

Así el profesor puede ver que son **tres proyectos diferentes**, con tecnologías y objetivos distintos, y no parece que estés presentando un solo proyecto con diferentes partes.
dame todo junto no lo separes

Claro. Aquí tienes TODO el README completo junto, sin dividirlo en partes ni agregar explicaciones fuera del README. Mantengo toda la información de tu proyecto y solo la organizo para que quede limpia y profesional.

# 🧠 Árbol Genealógico en Prolog

## 📌 Descripción

Proyecto académico desarrollado en **Prolog** que implementa un sistema de árbol genealógico familiar mediante **hechos y reglas lógicas**.

El sistema permite realizar consultas sobre diferentes relaciones de parentesco, como padres, hijos, hermanos, abuelos, tíos, primos, esposos y ancestros.

---

## 🎯 Objetivo

Representar las relaciones familiares mediante **programación lógica** y permitir obtener información sobre los diferentes integrantes de la familia mediante consultas en Prolog.

El proyecto permite trabajar con hechos, reglas, variables, consultas y mecanismos para obtener múltiples resultados.

---

## 👨‍👩‍👧‍👦 Integrantes del árbol familiar

El árbol genealógico contiene diferentes integrantes representados mediante identificadores en Prolog.

### 👨 Hombres

- `porfirio` — Abuelo paterno.
- `felipe` — Abuelo materno.
- `roger_padre` — Padre principal.
- `luis_tio` — Tío.
- `manuel` — Hijo de Yudi.
- `mario` — Hijo de Yudi.
- `luis_primo` — Hijo de Luis Tío.
- `raymundo` — Hijo de Nery.
- `rodrigo` — Hijo de Roger padre y Clara.
- `roger_hijo` — Hijo de Roger padre y Clara.
- `mateo` — Hijo de Rodrigo.

### 👩 Mujeres

- `maria_abuela` — Abuela paterna.
- `lucia` — Abuela materna.
- `clara` — Hija de Felipe y Lucía, esposa de Roger padre.
- `nery` — Hija de Felipe y Lucía.
- `yudi` — Hija de Porfirio y María Abuela.
- `maria_prima` — Hija de Yudi.
- `olga` — Hija de Luis Tío.
- `cynthia` — Hija de Roger padre y Clara.

---

# ⚙️ ¿Cómo funciona?

El programa utiliza dos elementos principales de la programación lógica:

## 📌 Hechos (Facts)

Los hechos representan información declarada directamente y no requieren razonamiento adicional.

Ejemplos:

```prolog
hombre(porfirio).
mujer(clara).

padre(roger_padre, rodrigo).
madre(clara, rodrigo).

esposos(porfirio, maria_abuela).

Los hechos permiten representar información como:

Género de una persona.
Relaciones de parentesco.
Relaciones entre padres e hijos.
Relaciones matrimoniales.
📌 Reglas (Rules)

Las reglas permiten deducir nueva información a partir de los hechos existentes.

Ejemplo:

hermano(X, Y) :-
    progenitor(Z, X),
    progenitor(Z, Y),
    hombre(X),
    X \= Y.

Esta regla permite determinar si una persona es hermano de otra cuando comparten un progenitor y no son la misma persona.

🔤 Variables en Prolog

Las variables en Prolog comienzan con mayúscula.

Ejemplos:

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

Ejemplo:

?- hijo_de(X, clara).

Resultado:

X = rodrigo ;
X = roger_hijo

Ejemplo:

?- hija_de(X, clara).

Resultado:

X = cynthia
👬 Hermanos y hermanas
?- hermano(Hermano, Referencia).
?- hermana(Hermana, Referencia).

Ejemplo:

?- hermano(X, cynthia).

Resultado:

X = rodrigo ;
X = roger_hijo

Ejemplo:

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

Ejemplo:

?- tio_de(X, rodrigo).

Resultado:

X = luis_tio

Ejemplo:

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

Ejemplo:

?- prima(X, rodrigo).

Resultado:

X = maria_prima ;
X = olga
💍 Esposos y esposas
?- esposo_de(Esposo, Esposa).
?- esposa_de(Esposa, Esposo).

Ejemplo:

?- esposo_de(porfirio, maria_abuela).

Resultado:

true

Ejemplo:

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

Sintaxis
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

Prolog es el lenguaje utilizado para implementar la representación del conocimiento, las relaciones familiares, las reglas lógicas y las consultas del sistema.

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

⭐ Resumen del proyecto

Árbol Genealógico en Prolog es un proyecto académico basado en programación lógica que representa las relaciones familiares mediante hechos y reglas.

El sistema permite realizar consultas sobre padres, hijos, hermanos, abuelos, tíos, primos, esposos y ancestros, utilizando mecanismos de inferencia lógica para obtener información a partir de los datos definidos.

Tecnología: Prolog
Tipo: Proyecto académico de programación lógica
Estado: Terminado
