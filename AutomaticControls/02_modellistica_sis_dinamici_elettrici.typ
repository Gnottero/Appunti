#import "../template.typ": *

#show : project.with(
  title: "Modellistica dei Sistemi Dinamici Elettrici",
  course: "Controlli Automatici"
)

= I Componenti Elettrici Fondamentali
Il primo passo per modellare un circuito è classificare i suoi componenti in statici e dinamici (con memoria), poichè questo determina quali variabili diventeranno le "variabili di stato" del nostro sistema

== Resistore Ideale ($R$)
È un componente puramente *statico*. La sua equazione costitutiva nel dominio del tempo è puramente algebrica:
$ v_R (t) eq R dot i_R (t) $
Mentre nel dominio delle trasformate di Laplace è:
$ V_R (s) eq R dot I_R (s) $
Non avendo memoria, non è associato ad alcuna variabile di stato

== Condensatore Ideale ($C$)
È un componente *dinamico*. La sua equazione costitutiva è di tipo differenziale:
$ i_C (t) eq C dot (d v_C (t))/(d t) $
Mentre nel dominio delle trasformate di Laplace è:
$ I_C (s) eq s C V_C (s) - C v_C (t eq 0_-) $
Poichè "memorizza" l'energia sotto forma di campo elettrico, la prassi impone di *scegliere la tensione $v_C$ come variabile di stato*

== Induttore Ideale ($L$)
Anch'esso è un componente *dinamico*. La sua evoluzione è dettata da:
$ v_L (t) eq L dot (d i_L (t))/(d t) $
Mentre nel dominio delle trasformate di Laplace è:
$ V_L (s) eq s L I_L (s) - L i_L (t eq 0_-) $
Memorizzando energia magnetica associata al flusso, *si sceglie la corrente $i_L$ come variabile di stato*

== Generatori Ideali (di Tensione o Corrente)
Questi elementi rappresentano le forzanti esterne e costituiscono le variabili di *ingresso* del nostro sistema dinamico. A ciascun generatore si associa una variabile $u_j$

= La Metodologia in Variabili di Stato
Per ricavare il modello dinamico di una rete elettrica, dobbiamo eseguire un protocollo rigoroso composto da passi ben definiti. Definiamo, quindi, uno schema da poter applicare sistematicamente:

+ *Definizione di Stato e Ingressi*: Si introduce una variabile di stato $x_j$ per ogni componente dotato di memoria (la tensione per i condensatori e la corrente per gli induttori). Parallelamente, si associa una variabile di ingresso $u_j$ ad ogni generatore ideale

+ *Equazioni Costitutive*: Si scrivono le equazioni differenziali proprie dei soli componenti con memoria

+ *Equazioni Topologiche*: Si "legge" la geometria del circuito applicando le Leggi di Kirchhoff ai Nodi (KCL) e alle Maglie (KVL)

+ *Manipolazione Algebrica (L'equazione di Stato)*: Bisogna manipolare le equazioni trovate per esprimere le derivate degli stati ($dot(x)_i$) _esclusivamente_ in funzione delle variabili di stato attuali ($x(t)$) e degli ingressi ($u(t)$). Si arriva così alla forma canonica: $ dot(x)_i eq f_i (t, x(t), u(t)) $ 

+ *Equazioni di Uscita*: Infine, le grandezze fisiche di interesse per il nostro studio (le uscite $y_k$) devono essere espresse unicamente come combinazione lineare o non lineare di stati e ingressi: $ y_k eq g_k (t, x(t), u(t)) $

= Il Concetto di "Rete Degenere"
Fino ad ora abbiamo applicato la regola aurea: "un componente con memoria = una variabile dis stato". In una rete normale, la dimensione del sistema $n$ è pari al numero totale di condensatori e induttori

Tuttavia, una rete elettrica si definisce *degenere* se contiene:
- *Maglie di condensatori*: percorsi chiusi formati esclusivamente da condensatori e/o generatori di tensione

- *Tagli di induttori*: nodi o rami in cui convergono esclusivamente induttori e/o generatori di corrente (il caso più classico è quello di induttori in serie)

Nelle reti degeneri, le tensioni sui condensatori o le correnti negli induttori _non sono tutte linearmente indipendenti_. Il numero di variabili di stato effettive $n$ sarà strettamente minore del numero di componenti reattivi fisicamente presenti