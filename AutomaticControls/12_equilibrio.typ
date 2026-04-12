#import "../template.typ": *

#show : project.with(
  title: "Equilibrio e Stabilità di Sistemi Dinamici",
  course: "Controlli Automatici"
)

= Introduzione
Se fino ad ora abbiamo tratto il problema riguardante il _come si muove_ un sistema nel tempo, in questo capitolo ci concentreremo sul capire *dove il sistema si ferma e resta immobile*

= La Definizione Universale di Equilibrio
Indipendentemente dalla natura del sistema (elettrico, meccanico, termico, continuo o discreto), la definizione di equilibrio è rigorosa. Un sistema stazionario si trova in equilibrio quando si verificano contemporaneamente tre condizioni:
+ *L'ingresso è costante*: Applichiamo un ingresso che non cambia nel tempo, indicato con $u(t) eq dash(u)(t)$ (detto ingresso di equilibrio)

+ *Lo stato è costante*: Il sistema si trova in uno stato iniziale tale per cui, sotto quell'ingresso $dash(u)$, le variabili di stato si "congelano" e rimangono identiche per sempre: $x(t) eq dash(x)$ (detto stato di equilibrio)

+ *L'uscita è costante*: Di conseguenza, anche l'uscita che osserviamo non cambierà mai: $y(t) eq dash(y)$ (detta uscita di equilibrio)

La coppia $(dash(x), dash(y))$ prende il nome di *Punto di Equilibrio*

= Calcolo dell'Equilibrio nel Tempo Continuo (TC)
Se lo stato non cambia nel tempo, significa che la sua "velocità di variazione" è nulla. In termini matematici: *la derivata dello stato è zero $dot(x)(t) eq 0$*

== Sistemi Non Lineari
Si prende l'equazione di stato $dot(x)(t) eq f(x(t), u(t))$, si azzera la derivata e si sostituiscono le variabili costanti:
$ f(dash(x), dash(y)) eq 0 $

Si tratta di risolvere un sistema di equazioni algebriche non lineari per trovare $dash(x)$

== Sistemi LTI (Matriciali)
Se il sistema è descritto dalle matrici $dot(x)(t) eq A x(t) + B u(t)$, la condizione diventa un banale sistema lineare:
$ A dash(x) + B dash(u) eq 0 arrow.r.double.long A dash(x) eq - B dash(u) $

Quanti stati di equilibrio esistono? Dipende dalla matrice $A$:
- Se la matrice $A$ è *invertibile* (cioè $det(A) eq.not 0$), esiste *uno e un solo stato di equilibrio isolato* per quel dato ingresso, calcolabile come $dash(x) - A^(-1) B dash(u)$

- Se la matrice $A$ è *singolare* (cioè $det(A) eq 0$), il sistema potrebbe avere *infiniti* stati di equilibrio (se l'ingresso "collabora") oppure *nessuno*

L'uscita di equilibrio si calcolerà semplicemente come $dash(y) eq C dash(x) + D dash(u)$

= Calcolo dell'Equilibrio nel Tempo Discreto (TD)
Nel mondo digitale (discreto) non ci sono le derivate. Come diciamo matematicamente che lo stato non cambia? Affermiamo che *lo stato al passo successivo è identico allo stato al passo attuale*. Ovvero:
$ x(k + 1) eq x(k) eq dash(x) $

== Sistemi Non Lineari
L'equazione $x(k + 1) eq f(x(k), u(k))$ diventa:
$ f(dash(x), dash(u)) eq dash(x) $

Attenzione: a differenza del tempo continuo dove mettevamo $eq 0$, qui c'è $eq dash(x)$ a secondo membro

== Sistemi LTI (Matriciali)
Per le matrici $x(k + 1) eq A x(k) + B u(k)$, l'equazione diventa:
$ dash(x) eq A dash(x) + B dash(u) $

Portando $A dash(x)$ a primo membro e raccogliendo per $dash(x)$ con la matrice identità $I$, otteniamo:
$ (I - A)dash(x) eq B dash(u) $

In questo caso, per sapere se l'equilibrio è unico non si analizza $A$, ma la matrice $(I - A)$

- Se $det(I-A) eq.not 0$, la matrice è invertibile e avremo un *unico stato di equilibrio isolato*: 
$ dash(x) eq (I - A)^(-1) B dash(u) $

- Se $det(I - A) eq 0$, potremmo avere infiniti o nessun equilibrio
