---
layout: page
title: Introducción a la programación científica
nositetitle: true
---

El objetivo del curso es exponer las bases para el desarrollo de aplicaciones computacionales con fines científicos, poniendo enfasis en los aspectos prácticos de su programación e implementación.

No se asume conocimientos previos de programación por lo que la primer parte consiste en una introducción al uso de linea de comando (*shell*), luego veremos como trabajar con un sistema de control de cambios (`Git`) y por último revisaremos la sintaxis de los lenguajes más utilizados en esta disciplina (`Python` `R`, y `Fortran`).

El foco del curso está puesto en exponer la sintaxis de programas escritos en Python, R y Fortran.

<!--Acá subiremos algunas [aplicaciones](./ejemplos/) que se mencionan en el curso.-->
Acá subiremos algo de [material](./material/) para profundizar los temas tratados.

# Programa del curso

<ul>
{% assign clases = site['clases'] | sort: 'date' %}
{% for clase in clases %}
    {% if clase.phony != true %}
      {% if clase.ready %}
        <li>
        <strong>{{ clase.date | date: '%d/%m' }}</strong>:
            <a href="{{site.baseurl}}{{ clase.url }}">{{ clase.title }}</a>
        </li>
        {% else %}
        <li>
        <strong>{{ clase.date | date: '%d/%m' }}</strong>:
            {{ clase.title }} [coming soon]
        </li>
        {% comment %}
        	 <li>  {{ clase.title }} {% if clase.noclass %}[no class]{% endif %}</li> 
        {%endcomment%}
      {% endif %}
    {% endif %}
{% endfor %}
</ul>

<!-- Los video tutoriales estarán disponible [en Youtube](https://www.youtube.com/@ramiroespadaguerrero/playlists). -->

---

<div class="small center">
<p><a href="https://github.com/CNEA-AQ/curso-programacion">Repositorio</a>.</p>
<p>Grupo de Química de la Atmósfera,</p>
<p>CNEA.</p>
</div>
