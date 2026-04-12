#import "../template.typ": *

#show : project.with(
  title: "Linearizzazione di Sistemi Dinamici",
  course: "Controlli Automatici"
)

= Introduzione
I sistemi dinamici reali non sono quasi mai perfettamente lineari. Tuttavia, la matematica dei sistemi non lineari è estremamente complessa da gestire. Si ricorre quindi ad un trucco: approssimare il comportamento del sistema non lineare con un modello lineare, ma solo nell'intorno di un punto specifico

= Il Concetto Matematico
Alla base di tutto c'è un concetto di Analisi Matematica. Se hai una funzione non lineare $f(x)$ e vuoi studiarla vicino a un punto $x_0$, puoi usare lo *sviluppo in serie di Taylor*. Se ci limitiamo a spostamenti molto piccoli ($delta x eq x - x_0$), possiamo "troncare" la serie fermandoci al termine di primo grado (quello lineare). Geometricamente, significa sostituire la curva complessa con la sua retta tangente nel punto $x_0$:
$ f(x) tilde.equiv f(x_0) + (d f(x))/(d x) |_(x eq x_0) delta x $

L'approssimazione sarà tanto più precisa quanto più la nostra perturbazione $delta x$ si mantiene piccola

= Perturbazioni
Trasliamo questo concetto ai nostri sistemi dinamici. Immaginiamo che il sistema stia seguendo un suo percorso "ideale", che chiamiamo *movimento nominale*, descritto da uno stato $tilde(x)(t)$ e un ingresso $tilde(u)(t)$ e a cui corrisponde un'uscita $tilde(y)(t)$. Se nella realtà applichiamo un ingresso leggermente diverso, il sistema seguirà un *movimento perturbato $x(t)$*

Definiamo le *perturbazioni* come la differenza tra il comportamento reale e quello ideale:
- $delta x(t) eq x(t) - tilde(x)(t)$ (Perturbazione dello stato)

- $delta u(t) eq u(t) - tilde(u)(t)$ (Perturbazione dell'ingresso)

- $delta y(t) eq y(t) - tilde(y)(t)$ (Perturbazione dell'uscita)

Il nostrom nuovo obiettivo non è più calcolare il valore assoluto $x(t)$, ma calcolare come evolve la sua perturbazione $delta x(t)$

= Le Matrici Jacobiane
Applicando il troncamento di Taylor alle equazioni di stato differenziali $dot(x)(t) eq f(x(t), u(t))$ e calcolando la derivata della perturbazione $delta dot(x)(t)$, otteniamo un'equazione lineare:
$ delta dot(x)(t) tilde.equiv A(t)delta x(t) + B(t) delta u(t) $

Le matrici $A(t)$ e $B(t)$ (e le corrispettive $C(t)$ e $D(t)$ per l'equazione di uscita) sono composte dalle *derivate parziali* delle nostre funzioni non lineari. Queste matrici di derivate prendono il nome di *Matrici Jacobiane*
- La matrice $A(t)$ è lo Jacobiano della funzione $f$ calcolata rispetto allo stato $x$

- La matrice $B(t)$ è lo Jacobiano della funzione f calcolata rispetto all'ingresso $u$

*Attenzione*: Queste derivate devono essere valutate (cioè devi sostituire i valori numerici di $x$ e $u$) esattamente in corrispondenza del _movimento nominale_ $tilde(x)(t)$ e $tilde(u)(t)$

= La "Magia" del Punto di Equilibrio
Fino a qui, le matrici $A, B, C, D$ che abbiamo trovato dipendono ancora dal tempo $t$ (perchè la traiettoria nominale si muove nel tempo). Gestire matrici tempo-variante è, però, molto complesso.

Tuttavia, *se scegliamo come movimento nominale un Punto di Equilibrio costante $(dash(x), dash(u))$*, non essendoci più variazioni nel tempo, le derivate parziali produrranno delle *matrici con coefficienti rigorosamente costanti*

Il nostro sistema non lineare si è trasformato, quindi, in un *sistema LTI* per le piccole perturbazioni:
$ delta dot(x)(t) eq A delta x(t) + B delta u(t) \ delta y(t) eq C delta x(t) + D delta u(t) $

Le stesse identiche formule valgono per il tempo discreto, sostituendo le derivate con i campioni $k + 1$

Questa approssimazione LTI è il motivo per cui nel 90% delle applicazioni industriali si studia la teoria di Laplace/Zeta: ci basta calcolare lo Jacobiano nel punto in cui vogliamo far lavorare la macchina e usare le matrici risultati per progettare il controllore. L'unica regola è quella che le perturbazioni devono rimanere piccole