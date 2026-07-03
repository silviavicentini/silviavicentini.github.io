---
layout: page
title: "Posts"
permalink: /posts/
page: 1
per_page: 5
---

<div class="search-bar-container">
  <label for="post-search" class="search-label">Cerca nei post</label>
  <input type="search" id="post-search" class="post-search" placeholder="Cerca per parola o segmento..." aria-label="Cerca nei post" />
</div>

<div class="search-results" id="search-results" hidden>
  <p class="search-status" id="search-status"></p>
  <div id="search-results-list"></div>
</div>

<div class="post-list">

  {% assign per_page = page.per_page %}
  {% assign page_index = page.page | minus: 1 %}
  {% assign offset = per_page | times: page_index %}

  {% for post in site.posts offset:offset limit:per_page %}
  <article class="post-item" data-title="{{ post.title | escape }}" data-excerpt="{{ post.excerpt | strip_html | strip_newlines | escape }}" data-content="{{ post.content | strip_html | strip_newlines | escape }}">
    <div>
      <h2 class="post-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h2>
      {% if post.subtitle %}
        <p class="post-subtitle" style='font-size: 1.2rem'>{{ post.subtitle }}</p>
      {% endif %}
      {% if post.excerpt %}
      <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 48 }}</p>
      {% endif %}
    </div>
    <span class="post-date">{{ post.date | date: "%b %-d, %Y" }}</span>
  </article>
  {% endfor %}
</div>

<nav class="pagination">
  {% if page.page > 1 %}
    {% assign prev = page.page | minus: 1 %}
    {% if prev == 1 %}
      <a class="prev" href="{{ '/posts/' | relative_url }}">&larr; Previous</a>
    {% else %}
      <a class="prev" href="{{ '/posts/page' | append: prev | append: '/' | relative_url }}">&larr; Previous</a>
    {% endif %}
  {% endif %}

  {% assign total_posts = site.posts | size %}
  {% assign total_pages = total_posts | divided_by: page.per_page %}
  {% assign rem = total_posts | modulo: page.per_page %}
  {% if rem > 0 %}
    {% assign total_pages = total_pages | plus: 1 %}
  {% endif %}
  {% for i in (1..total_pages) %}
    {% if i == page.page %}
      <span class="page current">{{ i }}</span>
    {% else %}
      {% if i == 1 %}
        <a class="page" href="{{ '/posts/' | relative_url }}">{{ i }}</a>
      {% else %}
        <a class="page" href="{{ '/posts/page' | append: i | append: '/' | relative_url }}">{{ i }}</a>
      {% endif %}
    {% endif %}
  {% endfor %}

  {% if page.page < total_pages %}
    {% assign next = page.page | plus: 1 %}
    <a class="next" href="{{ '/posts/page' | append: next | append: '/' | relative_url }}">Next &rarr;</a>
  {% endif %}
</nav>

<script>
  const postsIndex = [
  {% for post in site.posts %}
    {
      title: {{ post.title | escape | jsonify }},
      url: {{ post.url | relative_url | jsonify }},
      excerpt: {{ post.excerpt | default: '' | strip_html | strip_newlines | escape | jsonify }},
      content: {{ post.content | default: '' | strip_html | strip_newlines | escape | jsonify }},
      subtitle: {{ post.subtitle | default: '' | escape | jsonify }},
      date: {{ post.date | date: "%b %-d, %Y" | jsonify }}
    }{% if forloop.last == false %},{% endif %}
  {% endfor %}
  ];

  const searchInput = document.getElementById('post-search');
  const resultsSection = document.getElementById('search-results');
  const resultsList = document.getElementById('search-results-list');
  const searchStatus = document.getElementById('search-status');
  const postList = document.querySelector('.post-list');
  const pagination = document.querySelector('.pagination');

  function normalize(text) {
    return text.toLowerCase();
  }

  function renderResult(post) {
    return `
      <article class="post-item">
        <div>
          <h2 class="post-title"><a href="${post.url}">${post.title}</a></h2>
          ${post.subtitle ? `<p class="post-subtitle" style='font-size: 1.2rem'>${post.subtitle}</p>` : ''}
          ${post.excerpt ? `<p class="post-excerpt">${post.excerpt}</p>` : ''}
        </div>
        <span class="post-date">${post.date}</span>
      </article>
    `;
  }

  function updateSearch() {
    const query = normalize(searchInput.value.trim());
    if (!query) {
      resultsSection.hidden = true;
      postList.style.display = '';
      pagination.style.display = '';
      return;
    }

    const matches = postsIndex.filter(post => {
      return normalize(post.title).includes(query)
        || normalize(post.excerpt).includes(query)
        || normalize(post.content).includes(query);
    });

    postList.style.display = 'none';
    pagination.style.display = 'none';
    resultsSection.hidden = false;

    if (matches.length === 0) {
      searchStatus.textContent = `Nessun post trovato per "${searchInput.value}".`;
      resultsList.innerHTML = '';
      return;
    }

    searchStatus.textContent = `${matches.length} post trovati per "${searchInput.value}".`;
    resultsList.innerHTML = matches.map(renderResult).join('');
  }

  searchInput.addEventListener('input', updateSearch);
</script>

