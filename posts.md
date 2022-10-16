---
title: Posts
author: Jaan Toots
---

# Posts

Random journeys and deep dives. Updated approximately once a decade.

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
