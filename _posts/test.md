---
layout: post
title: Linguaggio e Large Language Models
category: ai
selected: true
---

I **Large Language Models (LLM)** sono modelli linguistici con un’ampia gamma di applicazioni: generazione di codice, sintesi di documenti, traduzione automatica e molto altro.  
La loro versatilità deriva dalla loro caratteristica fondamentale: la capacità di **elaborare e generare linguaggio naturale**.

Proprio la complessità del linguaggio rappresenta allo stesso tempo il **punto di forza** e la **principale sfida** nella progettazione di questi modelli. Il linguaggio umano è infatti estremamente ricco ed espressivo, e questa ricchezza si manifesta principalmente su due livelli:

- **sintattico**, cioè la struttura delle frasi  
- **semantico**, cioè il significato delle parole e delle frasi

Alla luce di questa complessità, è naturale porsi alcune domande: esistono alternative al linguaggio naturale per rappresentare l’informazione? Perché il linguaggio è così flessibile? E cosa rende così difficile generarlo automaticamente?

## Sintassi

Dal punto di vista sintattico esistono diverse alternative **più semplici e strutturate** rispetto al linguaggio naturale.

Ad esempio, se dobbiamo organizzare l’inventario di un negozio non useremo una descrizione in linguaggio naturale. Utilizzeremo invece una struttura come una **tabella**:

| Prodotto | Quantità | Colore |
|----------|----------|--------|
| T-Shirt | 34 | rosso |
| Jeans | 28 | blu |
| Calzini | 40 | nero |

La tabella fornisce un’**organizzazione strutturata dei dati**, molto semplice da interpretare. Tuttavia diventa poco flessibile quando dobbiamo rappresentare informazioni più complesse.

Immaginiamo ad esempio che ogni prodotto possa avere **proprietà diverse**: marca, materiale, stato di usura, ecc. In una tabella dovremmo creare molte colonne, e la maggior parte resterebbe vuota.

In questi casi diventa più pratico utilizzare una struttura **semi-strutturata**, come il formato JSON:

```json
[
  {
    "prodotto": "T-Shirt",
    "quantità": 34,
    "proprietà": {
      "colore": "rosso"
    }
  },
  {
    "prodotto": "Jeans",
    "quantità": 28,
    "proprietà": {
      "marca": "X",
      "usato": false
    }
  },
  {
    "prodotto": "Calzini",
    "quantità": 40,
    "proprietà": {}
  }
]