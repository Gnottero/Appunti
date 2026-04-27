#import "../../template.typ": *

#show : project.with(
  title: "Modellistica dei Sistemi Elettromeccanici",
  course: "Controlli Automatici"
)

= Introduzione
Fino ad ora abbiamo studiato sistemi puramente elettrici o puramente meccanici. I sistemi elettromeccanici, come suggerisce il nome, fungono da "ponte" tra questi due mondi, operando una vera e propria *conversione di energia*:
- Da energia elettrica a energia meccanica (è il caso dei *motori elettrici*)

- Da energia meccanica a energia elettrica (è il caso dei *generatori elettrici*, come la dinamo)

Per esigenze di sintesi, in questo corso ci concentreremo esclusivamente sui motori elettrici e, in particolare sul classico *Motore in Corrente Continua (DC-motor)*

= I Principi Fisici di Base
Il funzionamento di qualsiasi macchina elettromeccanica si fonda su due leggi invuolabili dell'elettromagnetismo:

== L'Azione Motrice: La Forza e la Coppia di Lorentz
Cosa fa muovere il motore? La risposta risiede nella Forza di Lorentz. Se prendiamo un conduttore elettrico di lunghezza $l$, lo facciamo attraversare da una corrente $i(t)$ e lo immergiamo in un campo magnetico $B(t)$, questo subirà una forza meccanica:
$ F(t) eq l dot i(t) and B(t) $

Nel nostro motore non abbiamo un filo dritto, ma una _spira_ rotante di area $A$. La forza di Lorentz applicata ai lati opposti della spira genera una *coppia meccanica* (un momento torcente) che la fa ruotare:
$ T(t) eq i(t) dot A dot B dot sin(theta(t)) $

Ne deduco che se fornisco corrente ($i$) in presenza di un magnete ($B$), ottengo una coppia meccanica $(T)$

== La Reazione: La Legge di Faraday-Neumann-Lenz
La legge dell'induzione elettromagnetica ci dice che se un circuito chiuso concatena un flusso magnetico $Phi(T)$ variabile nel tempo, al suo interno nascerà una tensione, definita *Forza Elettromotrice (f.e.m) indotta*:
$ e (t) eq - (d Phi (t))/(d t) $

Mentre il motore gira immerso nel suo stesso campo magnetico, i suoi fili "tagliano" le linee di flusso. Questo movimento genera una tensione $e(t)$ che si _oppone_ alla corrente che lo sta alimentando. Questa tensione si chiama forza contro-elettromotrice

= Anatomia di un DC-Motor
Per trasformare questi concetti astratti in un modello matematico, dobbiamo prima capire come è fatto fisicamente un DC-motor. Possiamo dividerlo in quattro componenti fondamentali:

+ *Lo Statore*: È la carcassa esterna, la parte fissa e non rotante. Il suo compito esclusivo è "creare il campo magnetico". Questo può essere fatto tramite dei semplici *magnetici permanenti* oppure tramite delle bobine avvolte (il *circuito di eccitazione*) alimentate da un'ulteriore corrente continua

+ *Il Rotore (o Indotto)*: È la parte interna e mobile, formata da un cilindro di materiale ferromagnetico. Su di esso sono avvolti i fili di rame che costituiscono il *circuito di armatura*. Quando diamo corrente a questo circuito, esso genera un campo magnetico che interagisce con quello dello statore, provocando rotazione

+ *Il Collettore a Spazzole*: È un interruttore rotante (meccanico). Permette al circuito di armatura di entrare in contatto elettrico con due *spazzole*, attraverso le quali il motore riceve energia elettrica sotto forma di corrente di armatura

+ *Albero Motore e Cuscinetti*: È l'elemento meccanico solidale al rotore, dotato di una propria massa e inerzia, che trasmette la coppia meccanica utile verso l'esterno. Poggia su dei cuscinetti a sfera che introducono inevitabilmente dell'attrito viscoso

= Modello di un DC-Motor
Il modello del DC-motor viene definito *ibrido* perchè unisce equazioni di natura elettrica (del rotore e dello statore) ad equazioni di natura meccanica (del rotore e dell'eventuale carico applicato)

== Modello Elettrico
Dobbiamo scrivere l'equazione alla maglia (Legge di Kirchoff delle Tensioni, o KVL) per i due circuiti elettrici presenti nel motore

=== Il Circuito di Armatura (Rotore)
Questo è il circuito che subisce la trasformazione di energia. L'equazione che governa la tensione di armatura $v_a (t)$ e la corrente di armatura $i_a (t)$ è:
$ v_a (t) eq R_a i_a (t) + L (d i_a (t))/(d t) + e(t) $

Dove:
- $R_a$ e $L_a$: Sono rispettivamente la resistenza e l'induttanza equivalenti degli avvolgimenti del rotore

- $e(t)$: È la forza contro-elettromotrice indotta dalla rotazione

=== Il Circuito di Eccitazione (Statore)
Attenzione: questa equazione esiste solo se lo statore è realizzato con degli avvolgimenti alimentati esternamente. Se lo statore usa magneti permanenti, questo circuito non c'è
$ v_e (t) eq R_e i_e(t) + L_e (d i_e (t))/(d t) $

Dove:
- $v_e (t)$ e $i_e (t)$: Tensione e corrente di eccitazione

- $R_e$ e $L_e$: Resistenza e induttanza degli avvolgimenti statorici

== Il Modello Meccanico
Adesso passiamo all'albero motore. Applichiamo l'equazione di Newton per i sistemi in rotazione che abbiamo studiato nella lezione precedente:
$ J dot(omega)(t) eq J dot.double(theta)(t) eq T_m (t) - T_r (t) - beta omega (t) $

Dove:
- $J$: Inerzia del rotore e dell'albero

- $omega (t)$: Velocità angolare

- $T_m (t)$: Coppia motrice generata elettricamente

- $T_r (t)$: Coppia resistente, ovvero il "carico" meccanico che stiamo cercando di muovere (es. un nastro trasportatore o un braccio robotico)

- $beta omega (t)$: Coppia di attrito viscoso dovuta ai cuscinetti

== Il Ponte Elettromeccanico (La Conversione)
Come comunicano le equazioni elettriche con quelle meccaniche? Attraverso due relazioni fondamentali che legano la forza contro-elettromotrice $e(t)$ e la coppia motrice $T_m (t)$:

+ *Legge di Faraday (Lato Elettrico)*: La rotazione genera tensione $ e(t) eq K dot Phi(t) dot omega(t) $

+ *Legge di Lorentz (Lato Meccanico)*: La corrente genera coppia $ T_m (t) eq K dot Phi(t) dot i_a (t) $

Analizziamo i termini:
- $K$: È una costante costruttiva del motore (dipende da come è avvolto il filo, dalla geometria del rotore, ecc)

- $Phi(t)$: È il flusso del campo magnetico generato dallo statore

*Un dettglio cruciale sul flusso $Phi(t)$*:
- Se lo statore è a *magneti permanenti*, il flusso p costante: $ Phi(t) eq dash(Phi) $

- Se lo statore ha un *circuito di eccitazione*, il flusso dipende (in modo non lineare) dalla corrente di eccitazine: $ Phi(t) eq Phi(i_e (t)) $

= Modalità di Funzionamento di un DC-motor
== DC-motor con Comando di Armatura
=== L'Ipotesi Fondamentale: Il Flusso Costante
Affinchè il comando di armatura funzioni correttamente, dobbiamo "congelare" il lato dello statore. Il flusso magnetico deve essere tenuto rigorosamente costante:
$ Phi(t) eq dash(Phi) quad forall t $

Come si ottiene questo fisicamente? In due modi:
+ Usando dei magnati permanenti nello statore (soluzione tipica nei piccoli motori, come i servomotori o i motorini dei droni)

+ Se lo statore ha degli avvolgimenti, alimentandoli con una corrente continua costante $dash(i)_e$. In questo caso l'equazione elettrica di eccitazione diventa puramente statica ($v_e eq R_e dash(i)_e$) e smette di essere di nostro interesse per la dinamica

=== Le Equazioni Dinamiche Semplificate
Grazie all'ipotesi del flusso costante ($dash(Phi)$), il nostro modello ibrido (visto precedentemente) si semplifica drasticamente, eliminando ogni traccia di non-linearità:
- *Circuito di Armatura*: 
$ v_a eq R_a i_a (t) + K Phi omega(t) $

- *Albero Meccanico*: 
$ J dot(omega)(t) eq K Phi i_a (t) - T_r - beta omega(t) $

Ossera bene: $K Phi$ p diventata a tutti gli effetti una semplice costante numerica (che spesso viene accorpata in un unico parametro chiamato $K_m$ o costante coppia/velocità). Le equazioni sono ora una pura combinazione lineare di correnti e velocità

=== Costruzione dello Spazio di Stato
Procediamo con il nostro protocollo metodologico per costruire le matrici

+ *Variabili di Stato e Ingressi*: Individuiamo gli elementi "con memoria": l'induttore $L_a$ immagazzina energia elettrica, l'inerzia $J$ immagazzina energia meccanica in traslazione. Avremo 3 variabili di stato ($n eq 3$):
  - $x_1 (t) eq i_a (t)$ (Corrente di armatura)
  - $x_2 (t) eq theta (t)$ (Posizione angolare dell'albero)
  - $x_3 (t) eq omega (t)$ (Velocità angolare dell'albero)
  
  Gli ingressi ($p eq 2$) sono la tensione di alimentazione e la coppia resistente imposta dal carico esterno:

  - $u_1 (t) eq v_a (t)$
  - $u_2 (t) eq T_r (t)$

  Fissiamo come uscita di interesse la posizionem dell'albero ($q eq 1$)

+ *Manipolazione Algebrica*: Isoliamo le derivate prime delle tre variabili di stato:
  - Dall'equazione elettrica isoliamo la derivata della corrente $(d i_a)/(d t)$: 
  $ dot(x)_1 eq -R_a/L_a i_a - (K Phi)/L_a omega + 1/L_a v_a arrow.long.double dot(x)_1 eq - R_a/L_a x_1 - (K Phi)/(L_a)x_3 + 1/L_a u_1 $

  - Dalla cinematica rotazionale, la derivata della posizione è banalmente la velocità: 
  $ dot(x)_2 eq x_3 $

  - Dall'equazione meccanica isoliamo l'accelerazione $dot(omega)$:
  $ dot(x)_3 eq (K dash(Phi))/J i_a - beta/J omega - 1/J T_r arrow.long.double dot(x)_3 eq (K dash(Phi))/J x_1 - beta/J x_3 - 1/J u_2 $

=== Il Modello Matriciale LTI
Poichè il sistema è LTI, possiamo impacchettare queste tre equazioni in un forma compatta:
$ dot(x) eq A x + B u \ y eq C x + D u $
Le matrici ottenute sono, quindi, le seguenti:
$ A eq mat(
  -R_a/L_a, 0, -(K Phi)/L_a;
  0, 0, 1;
  (K Phi)/J, 0, -beta/J;
) wide wide B eq mat(
  1/L_a, 0;
  0, 0;
  0, -1/J;
) $

$ C = mat(0, 1, 0;) wide wide D eq mat(0, 0;) $

I due termini fuori diagonale nella matrice $A$: $-(K Phi)/L_a$ e $(K Phi)/J$ rappresentano proprio il "ponte" elettromeccanico. Il primo indica come la velocità ($x_3$) freni la derivata della corrente ($x_1$), mentre il secondo indica come la corrente ($x_1$) spinga l'accelerazione ($x_3$)

== DC-motor con Comando di Eccitazione
In questa configurazione (oggi meno usata), ribaltiamo la logica vista prima:
- Teniamo rigorosamente *costante la corrente di armatura* del rotore: $i_a (t) eq dash(i)_a, forall t$

- Usiamo come ingresso la tensione applicata allo statore: $u_1 (t) eq v_e (t)$

=== Equazioni Dinamiche
Utilizzando un generatore ideale di corrente $dash(i)_a$, l'equazione del circuito di armatura è di tipo statico: 
$ v_a (t) eq R_a dash(i)_a + K Phi(t) omega(t), forall t $

In quanto la componente legata all'induttanza si azzera (derivata di una costante)

Le equazioni dinamiche si riducono quindi a:
$ v_e (t) eq R_e i_e (t) + L_e (d i_e (t))/(d t) \ J dot.double(theta)(t) eq J dot(omega)(t) eq K Phi(t) dash(i)_a - T_r (t) - beta omega(t) $

=== Il Problema della Non-Linearità 
La corrente di eccitazione dello statore $i_e (t)$ varia nell'intorno del punto di funzionamento $dash(i)_e$. Ne segue che il flusso magnetico dello statore varia a sua volta nell'intorno del valore $Phi(i_e (t)) eq Phi(dash(i)_e) eq dash(Phi) eq K dash(i)_e$. Si può, quindi, approssimare la caratteristica non lineare di $Phi$ con la legge lineare:
$ Phi(t) tilde.equiv K_e i_e (t) $

Grazie all'approssimazione lineare $Phi(t) tilde.equiv K_e i_e (t)$, l'equazione dinamica della parte meccanica diventa:
$ J dot.double(theta)(t) eq J dot(omega)(t) eq K Phi(t) dash(i)_a - T_r (t) - beta omega(t) \ wide wide wide wide wide wide wide quad thick thick  tilde.equiv K K_e i_e (t) dash(i)_a - T_r (t) - beta omega(t), wide K^* eq K K_e dash(i)_a \ wide wide wide eq K^* i_e (t) - T_r (t) - beta omega(t) $

Questa si può ritenere in prima approssimazione lineare:
$ J dot.double(theta)(t) eq J dot(omega)(t) tilde.equiv K^* i_e (t) - T_r (t) - beta omega(t) $

\
\
\
\

== Equazioni di Stato
Poichè le equazioni dinamiche sono:
$ v_e (t) eq R_e i_e (t) + L_e (d i_e (t))/(d t) \ J dot.double(theta)(t) eq J dot(omega)(t) tilde.equiv K^* i_e (t) - T_r (t) - beta omega(t) $

Le variabili di stato sono, in generale:
$ x(t) eq mat(i_e (t); theta(t); omega(t);) eq mat(x_1(t); x_2(t); x_3(t);) $

Mentre le variabili di ingresso sono:
$ u(t) eq mat(v_e (t); T_r (t);) eq mat(u_1 (t); u_2 (t)) $

Scriviamo, quindi, le matrici del sistema LTI:
$ A eq mat(
  -R_e/L_e, 0, 0;
   0, 0, 1;
    K^(*)/J, 0, -beta/J;
) wide wide B eq mat(
  1/L_e, 0;
  0, 0;
  0, -1/J;
) $

$ C eq mat(0, 1, 0;) wide wide D eq mat(0, 0;) $