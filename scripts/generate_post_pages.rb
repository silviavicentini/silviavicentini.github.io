#!/usr/bin/env ruby
require 'yaml'
require 'fileutils'

ROOT = File.expand_path('..', __dir__)
config_path = File.join(ROOT, '_config.yml')
config = File.exist?(config_path) ? YAML.load_file(config_path) : {}
PER_PAGE = (config['paginate'] || 5).to_i

posts = Dir.glob(File.join(ROOT, '_posts', '*.{md,markdown}')).sort.reverse
total = posts.size
pages = (total.to_f / PER_PAGE).ceil

puts "Found #{total} posts, generating #{pages} page(s) (#{PER_PAGE} per page)."

OUT_DIR = File.join(ROOT, 'posts')
FileUtils.mkdir_p(OUT_DIR)

template_body = <<~LIQUID
<div class="post-list">

  {% assign per_page = page.per_page %}
  {% assign page_index = page.page | minus: 1 %}
  {% assign offset = per_page | times: page_index %}

  {% for post in site.posts offset:offset limit:per_page %}
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
LIQUID

(1..pages).each do |i|
  if i == 1
    filename = File.join(OUT_DIR, 'index.md')
    permalink = '/posts/'
  else
    filename = File.join(OUT_DIR, "page#{i}.md")
    permalink = "/posts/page#{i}/"
  end

  content = <<~FRONT
  ---
  layout: page
  title: "Posts"
  permalink: #{permalink}
  page: #{i}
  per_page: #{PER_PAGE}
  ---

  #{template_body}
  FRONT

  File.write(filename, content)
  puts "Wrote #{filename}"
end

puts "Done. Re-run this script when you add/remove posts to regenerate pages."
