---
layout: page
title: "Posts"
---

<div class="post-list">
  {% for post in site.posts %}
  <article class="post-item">
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