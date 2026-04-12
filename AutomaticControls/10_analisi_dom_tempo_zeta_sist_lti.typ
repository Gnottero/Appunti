#import "../template.typ": *

#show : project.with(
  title: "Soluzione per Sistemi Dinamici LTI TD",
  course: "Controlli Automatici"
)

= Introduzione
L'obiettivo di questo capitolo è quello di calcolare il movimento dello stato $x(k)$ e dell'uscita $y(k)$ partendo da uno stato inziale noto $x(0)$ e da un ingresso noto $u(k)$. Come per i sistemi a tempo continuo, abbiamo due strade: restare nel dominio del tempo o passare al dominio della frequenza

Iniziamo dalla prima strada, che nei sistemi discreti è più intuitiva

= Modello a Tempo Discreto
Nei sistemi a tempo discreto non abbiamo più le derivate ($dot(x)$), ma abbiamo le *equazioni alle differenze*, che ci dicono come calcolare lo stato al passo successivo $x(k+1)$ conoscendo lo stato attuale $x(k)$ e l'ingresso attuale $u(k)$

Le equazioni di ingresso-stato-uscita assumono questa forma algebrica:
- *Equazione di stato*:
$ x(k+1) eq A x(k) + B u(k) $

- *Equazione di uscita*: 
$ y(k) eq C x(k) + D u(k) $

Dove le matrici $A, B, C, D$ hanno lo stesso identico significato dimensionale che avevano nel continuo

= La Soluzione nel Dominio del Tempo (Formula di Lagrange)
Nel tempo continuo, per trovare la formula di Lagrange dovevamo risolvere un'equazione differenziale complessa con un integrale di convoluzione. Nel tempo discreto, invece, la soluzione si ricava con dei banali passaggi iterativi (sostituzioni successive)

Conoscendo $x(0)$ e $u(0)$, come troviamo i passi successivi?
- Al passo 1: 
$ x(1) eq A x(0) + B u(0) $

- Al passo 2: 
$ x(2) eq A x(1) + B u(1) \ x(2) eq A(A x(0) + B u(0)) + B u(1) \ x(2) eq A^2 x(0) + A B u(0) + B u(1) $

- Al passo 3:
$ x(3) eq A^3 x(0) + A^2 B u(0) + A B u (1) + B u(2) $

Se generalizziamo questo meccanismo per un generico istante $k$, otteniamo la *Formula di Lagrange per i sistemi a tempo discreto*:
$ x(k) eq A^k x(0) + sum_(i eq 0)^(k - 1) A^(k - i - 1) B u(i) $

Esattamente come nel continuo, questa formula ci mostra che l'evoluzione del sistema è la somma di due contributi separati:
+ *Movimento Libero ($x_cal(l) (k)$)*: Il termine $A^k x(0)$. Dipende solo dalle condizioni iniziali e rappresenta l'evoluzione del sistema "lasciato a se stesso"

+ *Movimento Forzato ($x_f (k)$)*: Il termine con la sommatoria. Dipende esclusivamente dall'ingresso applicato $u(i)$ e parte da zero

Sostituendo questa espressioen di $x(k)$ nell'equazione di uscita $y(k) eq C x(k) + D u(k)$, otteniamo una separazione analoga per la risposta del sistema:
$ y(k) eq C A^k x(0) + C sum_(i eq 0)^(k - 1) A^(k - i - 1) B u(i) + D u(k) eq y_cal(l) (k) + y_f (k) $

Anche qui riconosciamo una *risposta libera* $y_cal(l) (k)$ e una *risposta forzata* $y_f (k)$

Tuttavia, calcolare la potenza di una matrice ($A^k$) è un'operazione complessa e lunga. Per questo motivo, come facevamo con Laplace, preferiamo passare nel dominio della frequenza usando la Trasformata Zeta

== Dalle Equazioni alle Differenze all'Algebra
Il procedimento è concettualmente identico a quello fatto con Laplace per i sistemi a tempo continuo. Partiamo dalle nostre equazioni di sistema nel dominio del tempo discreto $k$:
$ x(k + 1) eq A x(k) + B u(k) \ y(k) eq C x(k) + D u(k) $

Applichiamo la Trasformata Zeta ad ambo i membri. Per l'equazione di stato, dobbiamo usare il *Teorema dell'Anticipo*, visto nella lezione precedente:
$ cal(Z) {x(k+1)} eq z X(z) - z x(0) $
Sostituendo otteniamo:
$ z X(z) - z x(0) eq A X(z) + B U(z) \ Y(z) eq C X(z) + D U(z) $

== Calcolo dello Stato $X(z)$
Il nostro obiettivo è isolare il vettore di stato $X(z)$. Portiamo i termini con $X(z)$ a sinistra e la condizione iniziale $z x(0)$ a destra:
$ z X(z) - A X(z) eq z x(0) + B U(z) $

Raccogliamo $X(z)$ a fattore comune ricordando di introdurre la Matrice Identità $I$ (esattamente come in Laplace):
$ (z I - A) X(z) eq z x(0) + B U(z) $

Infine, pre-moltiplichiamo per la matrice inversa $(z I - A)^(-1)$:
$ X(z) eq z(z I - A)^(-1)x(0) + (z I - A)^(-1) B U(z) $

Come sempre, il movimento totale dello stato è diviso in due aprti perfette:
- *Movimento Libero ($X_cal(l) (z)$)*: È il primo termine $z(z I - A)^(-1)x(0)$. Dipendo solo dallo stato iniziale $x(0)$

- *Movimento forzato ($X_f (z)$)*: È il secondo termine $(z I - A)^(-1) B U(z)$. Dipende solo dall'ingresso $U(z)$

Da notare che in questo caso, rispetto al corrispettivo in tempo continuo, è presente una $z$ in più all'inzio, dovuta al *Teorema dell'Anticipo*

Ponendo:
$ H^x_0 (z) eq z(z I - A)^(-1) \ H^x_f (z) eq (z I - A)^(-1) B $

Possiamo riscrivere la formula nel seguente modo:
$ X(z) eq H^x_0 (z) x(0) + H^x_f (z) U(z) $

== Calcolo dell'Uscita $Y(z)$ e Matrice di Trasferimento
Ora prendiamo l'espressione di $X(z)$ appena trovata e la sostituiamo nell'equazione di uscita $Y(z) eq C X(z) + D U(z)$
Otteniamo:
$ Y(z) eq z C (z I - A)^(-1) x(0) + (C (z I - A)^(-1) B + D) U(z) $

Anche qui abbiamo una separazione:
- *Risposta Libera $Y_cal(l) (z)$*: Dipende da $x(0)$

- *Risposta Forzata $Y_f (z)$*: Dipende da $U(z)$

Il blocco matriciale che moltiplica l'ingresso $U(z)$ nella risposta forzata prende il nome di *Matrice di Trasferimento $H(z)$*:
$ H(z) eq C (z I - A)^(-1) B + D $

Inoltre se poniamo:
$ H_0 (z) eq z C (z I - A)^(-1) $

Possiamo riscrivere l'equazione di uscita come:
$ Y(z) eq H_0(z) x(0) + H(z) U(z) $

Se il sistema ha un solo ingresso e una sola uscita (SISO), questa matrice collassa in uno scalare e diventa la *Funzione di Trasferimento*, che si presenta come un rapporto di polinomi in $z$. I poli di questa funzione (le radici del denominatore $det(z I - A)$) ci diranno se il nostro sistema digitale è stabile oppure no