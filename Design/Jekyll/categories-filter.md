http://stackoverflow.com/questions/26411366/jekyll-filter-categories-and-posts-by-tags

http://stackoverflow.com/questions/20872861/jekyll-display-posts-by-category


http://stackoverflow.com/questions/12008108/filtering-posts-using-categories-in-jekyll-bootstrap



https://paulbakaus.com/tutorials/html5/custom-pagination-with-jekyll/

https://talk.jekyllrb.com/t/full-story-pages-how-to-skip-posts-that-are-of-a-certain-category/702

{% for post in site.posts %}
    {% unless post.categories contains 'external' %}
        <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endif %}
{% endfor %}


http://stackoverflow.com/questions/32039416/filter-popular-posts-by-category-in-a-collection-in-jekyll-using-liquid


https://github.com/jekyll/jekyll/issues/2018


{% for post in paginator.posts %}
  {% unless post.categories contains 'resources' %}
  <div class="entry">
    <a class="entry-thumb" href="{{ post.source }}" title="Visit {{ post.title }}">
      {{ post.content }}
      <span class="icon icon-forward entry-icon"></span>
    </a>
    <div class="entry-content">
      <h2 class="entry-title">
        <a href="{{ post.url }}">{{ post.title }}</a>
      </h2>
      <p class="entry-date">{{ post.date | date: "%B %-d %Y" }}</p>
    </div>
  </div>
  {% endunless %}
{% endfor %}





