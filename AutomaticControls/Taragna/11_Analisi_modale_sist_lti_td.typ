#import "../../template.typ": *

#show : project.with(
  title: "Analisi Modale per Sistemi Dinamici LTI TD",
  course: "Controlli Automatici"
)

= Introduzione
Con l'analisi modale non ci interessa più calcolare il valore esatto dello stato istante per istante, ma vogliamo studiare le _proprietà qualitative_ del movimento libero del sistema al tendere del tempo all'infinito ($k arrow.r infinity$). In altre parole: vogliamo sapere se, lasciato a se stesso, il sistema esploderà, si stabilizzerà a zero o oscillerà all'infinito

= La Forma di Jordan e i Modi Naturali
Sappiamo che il movimento libero è governato dalla formula $ x_cal(l) eq A^k x(0)$. Calcolare la potenza di $A^k$ di una generica matrice è laborioso, ma sfruttando la sua forma di Jordan ($A^k eq T tilde(A)^k T^(-1)$), possiamo "smontare" la dinamica complessa in una somma di comportamenti base indipendenti, chiamati *modi naturali*

La forma e il comportamento di questi modi naturali dipendono esclusivamente dalle caratteristiche degli *autovalori ($lambda$)* della matrice A del nostro sistema

Nel tempo continuo, lo spartiacque tra stabilità e instabilità era l'asse immaginario ($s eq 0$). Nel tempo discreto, tutto ruota attorno al *Cerchio di Raggio Unitario* ($abs(lambda) eq 1$) nel piano complesso. Vediamo come si comportano i modi in base a dove "cadono" gli autovalori:

== Autovalori Semplici (Molteplicità 1)
=== Autovalori Reali ($RR$)
Il modo naturale generato è del tipo $lambda^k$
- *Geometricamente converfente* (a zero): se il modulo dell'autovalore è strettamente minore di uno ($lambda lt 1$)

- *Limitato*: se si trova esattamente sulla circonferenza unitaria ($abs(lambda) eq 1$). Attenzione però ai segni:
  - Se $lambda eq 1$, il modo è $1^k eq 1$ (costante)

  - Se $lambda eq -1$, il modo è $(-1)^k$, che oscilla perennemente tra $1$ e $-1$

- *Geometricamente divergente* (esplode a $plus.minus infinity$): se il modulo è maggiore di uno ($lambda gt 1$)

Si noti che, se $Re(lambda) lt 0$, il modo corrispondente origina una sequenza di campioni (*modo alternato*) il cui segno cambia ad ogni passo

=== Autovalori Complessi Coniugati ($CC$)
Si presentano in coppie $lambda eq sigma plus.minus j omega eq v e^(plus.minus j theta)$ e generano dei modi intrinsecamente oscillanti della forma $v^k cos(theta k)$ e $v^k sin(theta k)$. A determinare se il sistema esplode o si stabilizza è unicamente il loro modulo $v$ (cioè $abs(lambda)$):
- *Geometricamente convergenti*: se $v lt 1$ (es. $0.5^k sin(k)$) smorza le oscillazioni verso lo zero)

- *Limitati (oscillanti)*: se $v eq 1$, il sistema oscilla perennemente senza mai fermarsi nè esplodere (es. $sin(5k)$)

- *Geometricamente divergenti*: se $v gt 1$, le oscillazioni diventano sempre più ampie (es. $1.5^k sin(k)$)

== Autovalori Multipli (Molteplicità $mu gt 1$)
Cosa succede se un autovalore si ripete più volte? La forma di Jordan fa comparire la variabile di tempo $k$ come coefficiente moltiplicativo (ad esempio termini come $k lambda^k$ o $k^2 lambda^k$). Questo cambia le regole del gioco sul bordo della stabilità:
- *Se $abs(lambda) lt 1$ (sia reali che complessi)*: L'esponenziale decrescente "vince" sempre sul polinomio di $k$. Il modo rimane *geometricamente convergente*. (es. $k dot 0.5^k$ andrà comunque a zero)

- *Se $abs(lambda) eq 1$ (sia reali che complessi)*: Questa è la grande differenza rispetto agli autovalori semplici. Il modo diventa *Polinomiale divergente*. Ad esempio, l'autovalore reale $1$ ripetuto due volte genera il modo $k dot 1^k eq k$, che va a infinito

- *Se $abs(lambda) gt 1$ (sia reali che complessi)*: Rimane ovviamente *geometricamente divergente*

In sintesi: per avere un sistema che torna in equilibrio da solo, *tutti gli autovalori devono stare rigorosamente dentro il cerchio unitario del piano complesso*

Anche in questo caso (per autovalori in $RR$) sia ha che se $Re(lambda) lt 0$, si hanno dei *modi alternati*

