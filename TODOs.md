# TODO — Suggerimenti per paginazione e CI

Questa lista raccoglie i suggerimenti discussi sulla paginazione e il deploy.

1. Valutare `jekyll-paginate-v2` per sostituire lo script custom
   - Vantaggi: paginazione integrata, meno codice da mantenere, supporto per paginare pagine diverse dalla home.
   - Svantaggio: non incluso in GitHub Pages; richiede build + deploy in CI.

2. Aggiungere `jekyll-paginate-v2` al `Gemfile` e registrarlo in `_config.yml`
   - Esempio: `gem 'jekyll-paginate-v2'` e aggiungere `jekyll-paginate-v2` nella lista `plugins`.

3. Creare un workflow GitHub Actions per buildare e pubblicare `_site` su push
   - Azioni: `bundle install`, `bundle exec jekyll build`, deploy con `peaceiris/actions-gh-pages`.

4. Aggiornare `posts/index.md` per usare `pagination.enabled: true` e `paginator.posts`
   - Rimuovere il codice che genera pagine statiche via script.

5. Rimuovere `scripts/generate_post_pages.rb` e le pagine `/posts/pageN` generate automaticamente

6. (Opzionale) Aggiungere un piccolo script "Copia link" sulla pagina `/subscribe` per facilitare la sottoscrizione

Se vuoi, applico ora una di queste voci (es. aggiungere il workflow CI). Altrimenti posso solo tenere questa TODO nel repo.
