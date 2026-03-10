---
layout: page
title: "AI"
---

<h1>Posts</h1>

<div class="post-list">
  {% for post in site.posts %}
    {% if post.category == 'ai' %}
  <article class="post-item">
    <div>
      <p class="post-category">
        <span class="post-category-dot dot-ai"></span>
        AI
      </p>
      <h3 class="post-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h3>
      {% if post.excerpt %}
      <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 28 }}</p>
      {% endif %}
    </div>
    <span class="post-date">{{ post.date | date: "%b %-d, %Y" }}</span>
  </article>
    {% endif %}
  {% endfor %}
</div>