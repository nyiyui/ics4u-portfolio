---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

{% include base_path %}
Featured Projects
---
{% for post in site.projects reversed %}
{% if post.featured %}
  {% include archive-single.html post=post %}
{% endif %}
{% endfor %}

Other Projects
---
{% for post in site.projects reversed %}
{% unless post.featured %}
{% include archive-single.html post=post %}
{% endunless %}
{% endfor %}
