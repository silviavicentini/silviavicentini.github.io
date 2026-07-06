---
layout: post
title: "Dentro le reti neurali"
subtitle: "Dalla rappresentazione vettoriale allo spazio latente"
category: ai
selected: false
---

Per chi si avvicina all'intelligenza artificiale, le reti neurali possono apparire inizialmente complesse, ma il loro funzionamento di base è piuttosto semplice: ricevono dati in input, li trasformano attraverso una serie di passaggi successivi, e producono un output. Durante l'addestramento, queste trasformazioni vengono **ottimizzate** per avvicinare il risultato ottenuto a quello atteso, in modo da poter prevedere l'output anche su esempi nuovi.

> Le reti neurali non “vedono” il mondo come noi: trasformano i dati in una sequenza di rappresentazioni intermedie, fino a produrre il risultato finale.

Dal punto di vista matematico, possiamo codificare questo processo tramite funzioni, matrici e vettori:

- i vettori sono liste di numeri reali, che tipicamente rappresentano input e output;
- le matrici rappresentano trasformazioni su questi vettori, che possono modificarne la dimensione e il contenuto;
- le funzioni tipicamente agiscono su ogni elemento del vettore trasformandone il valore.[^1]

[^1]: Vettori e matrici sono in realtà casi particolari di un oggetto più generale, il **tensore**: un vettore è un tensore a una dimensione, una matrice un tensore a due dimensioni, e così via per dimensioni superiori. I tensori sono più difficili da visualizzare, ma la logica delle trasformazioni che li coinvolgono resta la stessa.


Queste strutture mescolano, comprimono e modificano l'input, trasformandolo progressivamente nell'output. Tali operazioni vengono alternate in sequenza in cosiddetti **layer** successivi, ognuno dei quali produce degli output intermedi. Lo spazio a cui appartengono tali vettori è uno **spazio vettoriale** detto **spazio latente**: un luogo interno al calcolo in cui la rete organizza informazioni che non corrispondono direttamente all'input o all'output, ma che sono essenziali per il processo di elaborazione.

![Alternanza dei layer in una rete neurale]({{ "/assets/images/alternanza_layer_illustrativa_v2.svg" | relative_url }})
{: .centered-image}

## Le rappresentazioni vettoriali
Gli spazi vettoriali, ovvero gli spazi a cui appartengono i vettori, hanno proprietà particolarmente interessanti. Una di queste è la **località della rappresentazione**: vettori simili contengono informazioni simili, e questo rende possibile confrontare o interpolare esempi diversi. Consideriamo, per esempio, un vettore che rappresenta un'immagine con il numero 5 e un vettore che rappresenta un'immagine con il numero 3: se la rappresentazione è ben organizzata, interpolando tra due punti dello spazio latente possiamo osservare una trasformazione graduale, da un 5 a un 3.

![Interpolazione tra rappresentazioni di cifre MNIST]({{ "/assets/images/interpolazione_mnist_svg.svg" | relative_url }})
{: .centered-image}

### L'esempio degli embedding vettoriali
Questo è particolarmente evidente nel caso degli *embedding*, ovvero rappresentazioni vettoriali apprese di un insieme di oggetti. Consideriamo, ad esempio, un *word embedding*: un buon embedding colloca parole con significato simile in regioni vicine dello spazio vettoriale. In questo modo è possibile **descrivere relazioni semantiche** che hanno una controparte in questo spazio. Un esempio classico è il rapporto fra uomo, re, donna e regina: visto che "uomo sta a re, come donna sta a regina", i vettori che rappresentano queste entità avranno determinate proprietà, poiché rappresentano a coppie la stessa relazione. In particolare, ci aspettiamo che i vettori che li collegano, a coppie, siano paralleli.

> In questi spazi, la somiglianza semantica diventa una questione di vicinanza geometrica.

![Analogia tra embedding e spazio vettoriale]({{ "/assets/images/analogia_embedding_piano_cartesiano.svg" | relative_url }})
{: .centered-image}

Nulla garantisce però che una rete impari spontaneamente una rappresentazione di questo tipo. Più che altro, la proprietà della rappresentazione viene **verificata a posteriori** e conferma o smentisce la bontà di una rete. Queste proprietà vengono generalmente valutate sugli input o sugli output, che sono direttamente interpretabili. Gli spazi latenti, invece, non devono necessariamente possedere queste proprietà: nella maggior parte delle reti rappresentano semplicemente uno stato interno del calcolo e non vengono utilizzati direttamente per confrontare, interpolare o manipolare le informazioni.

> Non tutti gli spazi latenti sono “ben organizzati”: spesso sono semplicemente stati intermedi del processo computazionale.

## Lo spazio latente nei modelli generativi
Questa regola generale non si applica però al caso dei modelli generativi di immagini. In tal caso, infatti, gli spazi latenti sono fondamentali nel processo di generazione. Un esempio classico è quello degli autoencoder: tali modelli sono costituiti da due sotto-reti, chiamate encoder e decoder. Il compito dell'encoder è di trasformare l'input in un vettore dello spazio latente, estraendo le informazioni importanti. Il decoder, invece, utilizza il risultato dell'encoder per ottenere una ricostruzione dell'input originale. La rete viene quindi addestrata a ricostruire le immagini del dataset. Una volta addestrata, è possibile estrarre il decoder: scegliendo un vettore casuale nello spazio latente e applicandovi il decoder, possiamo generare nuove immagini.

![Passaggi di training e inferenza di un autoencoder]({{ "/assets/images/passaggi_autoencoder_training_inferenza.svg" | relative_url }})
{: .centered-image}


Nella pratica però questo produce raramente immagini convincenti, perché il modello non impone alcuna struttura particolare allo spazio latente. Vi sono principalmente due problemi:

- le immagini plausibili occupano una porzione molto piccola dello spazio di tutte le possibili immagini: ci sono molte più combinazioni casuali di pixel che immagini sensate;
- tale spazio può essere molto complesso e frammentato. Di conseguenza, non è detto che immagini plausibili siano modificabili con continuità una nell'altra: lo spazio latente conterrà quindi anche immagini insensate.

> Il problema non è solo generare immagini, ma generarle in modo che siano plausibili e continue.

Questo si traduce in una bassa qualità delle immagini generate e nella necessità di utilizzare altri approcci. Quello più comune è **l'approccio variazionale:** anziché rappresentare l'input come un singolo vettore nello spazio latente, l'addestramento impone che le rappresentazioni seguano una **distribuzione** semplice, come una gaussiana, dalla quale è poi possibile campionare nuovi punti.

Ottenendo campioni da questa distribuzione, abbiamo quindi che probabilità alte corrispondono a immagini plausibili e probabilità basse a immagini implausibili. In questo modo lo spazio latente viene organizzato in maniera continua e facilmente campionabile: le immagini sensate sono al centro dello spazio (dove la probabilità è alta), quelle formate da pixel casuali sono ai bordi (sulle code della gaussiana). Questo approccio ha però un lato negativo: comprimendo ed avvicinando le immagini plausibili tra loro (verso il centro della gaussiana), il modello tende a "sfocare" ciò che impara a generare, apprendendo un'"immagine media" tra quelle già viste. Per questo motivo i modelli allo stato dell'arte, ovvero i **modelli di diffusione**, adottano un approccio diverso: la rete non genera direttamente un'immagine da un punto dello spazio latente, ma apprende ad applicare un processo di denoising dell'immagine (proprio come il denoising applicato dai programmi di editing fotografico) in piccoli passaggi successivi, imparando a ricostruire una scena coerente a partire da rumore puro: in questo modo, non si forza una struttura dello spazio, ma si produce l'immagine attraverso correzioni progressive.

![Denoising da parte di un modello di diffusione]({{ "/assets/images/passaggi_diffusione_denoising_ddpm.svg" | relative_url }})
{: .centered-image}

## Conclusioni
Lo spazio latente è uno degli aspetti più affascinanti delle reti neurali. Sebbene nasca come una semplice rappresentazione intermedia necessaria ai calcoli della rete, spesso finisce per organizzare informazioni molto più ricche di quanto ci si potrebbe aspettare. In alcuni casi, come gli embedding linguistici, questa organizzazione riflette relazioni semantiche tra gli oggetti rappresentati; in altri, come nei modelli generativi, costituiscono un aspetto critico per la formazione di nuove immagini. Comprendere la struttura di questi spazi è uno dei modi più efficaci per interpretare il comportamento delle reti neurali e progettare modelli sempre più versatili, rappresentativi e potenti.