---
title: Blog
author: Jaan Toots
---

# Blog

Random journeys and deep dives. Updated approximately once a decade.

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="/blog{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
