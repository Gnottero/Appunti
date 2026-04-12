#import "../template.typ": *

#show : project.with(
  title: "Analisi Modale per Sistemi Dinamici LTI TC",
  course: "Controlli Automatici"
)

= Fondamenti del Movimento Libero
Lo studio dell'analisi modale origina dall'esigenza di caratterizzare il *movimento libero $x_cal(l) (t)$* di un sistema dinamico LTI TC di ordine $n$, descritto formalmente dall'equazione differenziale di stato: 
$ dot(x)(t) eq A x(t) $
La soluzione di tale equazione, derivante dalla formula di Lagrange, è espressa come:
$ x_cal(l)(t) eq e^(A t) x(0_-) $
Dove $x(0_-) in RR^n$ rappresenta il vettore di stato inziale e $e^(A t)$ è la matrice esponenziale. L'evoluzione temporale del sistema in assenza di forzamenti dipende intrinsecamente dalle proprietà di questa matrice esponenziale

Poichè il calcolo analitico diretto di $e^(A t)$ risulta complesso qualora la matrice $A$ non sia strettamente diagonale, si ricorre a una trasformazione in forma di Jordan $tilde(A)$ tramite una matrice di trasformazione $T$, tale per cui $e^(A t) eq T e^(tilde(A) t) T^(-1)$

Si ha:
$ x_cal(l) eq e^(A t) x(0_-) eq T e^(tilde(A) t) T^(-1) x(0_-) $
Poichè $T$ e $x(0_-)$ sono costituite da numeri reali:
- L'espressione analitica di $x_cal(l)(t)$ è una combinazione lineare degli elementi della matrice $e^(tilde(A)t)$

- La forma semplificata di $tilde(A)$ (e quindi di $e^(tilde(A)t)$) permette di mettere immediatamente in evidenza la forma dei modi naturali

- Si possono così analizzare in modo più immediato le proprietà qualitative del movimento libero $x_cal(l)(t)$

= Definizione e Classificazione dei Modi Naturali
L'espressione analitica di $x_cal(l)(t)$ si configura come una combinazione lineare degli elementi della matrice $e^(tilde(A) t)$. Le funzioni elementari del tempo che compongono tale risposta, tipicamente della forma $m_i (t) eq e^(lambda_i t)$, prendono il nome di *modi naturali* (o modi propri) del sistema e sono associati agli autovalori $lambda_i$ della matrice della dinamica $A$

L'analisi modale si concentra sul comportamento asintotico di tali modi per $t arrow.r infinity$. Essi si classificano rigorosamente in:

- *Convergenti*: Se il limite asintotico del modulo del modo è nullo, ovvero 
$ lim_(t arrow.r infinity) abs(m(t)) eq 0 $

- *Limitati*: Se esiste un maggiorante reale $M$ tale che l'ampiezza non ecceda mai tale valore per ogni istante di tempo, ossia
$ 0 lt abs(m(t)) lt.eq M lt infinity, forall t gt.eq 0 $

- *Divergenti*: Se l'ampiezza del modo cresce indefinitamente, ovvero
$ lim_(t arrow.r infinity) abs(m(t)) eq infinity $

= Analisi Modale in base alle Proprietà degli Autovalori
Il comportamento specifico di un modo naturale è strettamente dettato dalla tipologia del relativo autovalore nel piano complesso (reale o complesso coniugato) e dalla sua molteplicità algebrica $mu$

== Autovalori con Molteplicità Unitaria (Semplici)
=== Autovalori Reali ($lambda in RR$)
Generano modi puramente esponenziali del tipo $e^(lambda t)$
- Sono _esponenzialmente convergenti_ se $Re(lambda) lt 0$

- Sono _limitati_ (costanti) se $Re(lambda) eq 0$

- Sono _esponenzialmente divergenti_ se $Re(lambda) gt 0$

=== Autovalori Complessi Coniugati ($lambda eq sigma plus.minus j omega$)
Danno origine a componenti oscillatorie modulate in ampiezza, espresse come $e^(sigma t) cos(omega t)$ e $e^(sigma t) sin(omega t)$. L'inviluppo esponenziale dipende dalla sola parte reale $sigma$:
- Sono _esponenzialmente convergenti_ se $sigma lt 0$

- Sono _limitati_ (puramente oscillanti) se $sigma eq 0$

- Sono _esponenzialmente divergenti_ se $sigma gt 0$

== Autovalori con Molteplicità Multipla ($mu gt 1$)
La presenza di blocchi di Jordan di dimensione $mu'$ (con $mu' lt.eq mu$) introduce una dipendenza polinomiale nel tempo
=== Autovalori Reali Multipli
Generano un set di modi del tipo $t^(mu' - 1)e^(lambda t), dots, t e^(lambda t), e^(lambda t)$

L'introduzione del termine polinomiale altera drasticamente la stabilità marginale:
- Restano _esponenzialmente convergenti_ se $Re(lambda) lt 0$, poichè l'esponenziale decrescente domina asontoticamente sul polinomio

- Diventano _polinomialmente divergenti_ se $Re(lambda) eq 0$ (es. modo lineare $t$)

- Risultano _esponenzialmente divergenti_ se $Re(lambda) gt 0$

=== Autovalori Complessi Multipli
Esibiscono lo stesso fenomeno. Generano modi combinati come $t^(mu' - 1)e^(sigma t) cos(omega t)$. La convergenza permane se $sigma lt 0$, ma in caso di autovalori puramente immaginari multipli ($sigma eq 0$), il sistema esibisce modi _polinomialmente divergenti_ e _oscillanti_

= Costante di Tempo ($tau$)
Esclusivamente per i modi convergenti (associati ad autovalori con $Re(lambda) lt 0$), si definisce una metrica fondamentale detta *costanted di tempo*, calcolata come:
$ tau eq abs(1/Re(lambda)) $
Questa quantità fornisce una misura quantitativa della velocità (o prontezza) con cui il transitorio associato a quel modo decade verso zero. Un autovalore la cui parte reale è maggiormente negativa presenterà una costante di tempo minore, traducendosi in una convergenza più rapida. Da un punto di vista geometrico, la costante di tempo $tau$ corrisponde al punto di intersezione tra l'asse delle ascisse (dei tempi) e la retta tangente alla curva del modo $e^(lambda t)$ o $e^(sigma t)$, valutata nell'istante di ascissa nulla