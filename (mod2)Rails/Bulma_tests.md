

* BULMA SYNTEX


** Bulma Helpers

is-clearfix			Fixes an element's floating children
is-pulled-left		Moves an element to the left
is-pulled-right		Moves an element to the right
is-overlay			Completely covers the first positioned parent
is-clipped			Adds overflow hidden
is-radiusless		Removes any radius
is-shadowless		Removes any shadow
is-unselectable		Prevents the text from being selectable
is-clickable		Applies cursor: pointer !important to the element.
is-relative			Applies position: relative to the element.

<!-- Header -->
``` ruby
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
  	<a class="navbar-item"><img src="https://versions.bulma.io/0.7.0/images/bulma-logo.png" alt="Bulma: a modern CSS framework based on Flexbox" width="112" height="28"></a>
  </div>

  <div class="navbar-menu">
	    <div class="navbar-start">
		      <a href="/students" class="navbar-item"> Students </a>
		      <a href="/cohorts" class="navbar-item"> Cohorts </a>
		      <a href="/blogs" class="navbar-item"> Blogs </a>
		      <a href="/videos" class="navbar-item"> Videos </a>
	    </div>
	    <div class="navbar-end">
		      <div class="navbar-item">
			        <div class="buttons">
			          <a class="button is-primary"> Sign up </a>
			          <a class="button is-light"> Log Out </a>
			        </div>
		      </div>
	    </div>
  </div>
</nav>
```



<!-- Body Hero-->
``` ruby
	<section class="hero">
	  <div class="hero-body">
	    <div class="container">
	      <h1 class="title">
	        Hero title
	      </h1>
	      <h2 class="subtitle">
	        Hero subtitle
	      </h2>
	    </div>
	  </div>
	</section>
```

** Section
- use sections as DIRECT children of body
``` ruby
<body>
  <section class="section">
    <div class="container">
      <h1 class="title">Section</h1>
      <h2 class="subtitle">
        A simple container to divide your page into <strong>sections</strong>, like the one you are currently reading
      </h2>
    </div>
  </section>
</body>
```

** Tiles
``` ruby
	<div class="tile is-ancestor">
	  <div class="tile is-vertical is-8">	<!-- 8 column container-->
		    <div class="tile">
			      <div class="tile is-parent is-vertical">
			        <article class="tile is-child notification is-primary"> 	<!-- VERTICAL Lt GREEN-->
			          <p class="title">Vertical...</p>
			          <p class="subtitle">Top tile</p>
			        </article>

			        <article class="tile is-child notification is-warning">		<!-- TILES YELLOW-->
			          <p class="title">...tiles</p>
			          <p class="subtitle">Bottom tile</p>
			        </article>

			      </div>
			      <div class="tile is-parent">
			        <article class="tile is-child notification is-info">		<!-- MIDDLE-->
			          <p class="title">Middle tile</p>
			          <p class="subtitle">With an image</p>
			          <figure class="image is-4by3">
			            <img src="https://bulma.io/images/placeholders/640x480.png">
			          </figure>
			        </article>
			      </div>
		    </div>

		    <div class="tile is-parent">
			      <article class="tile is-child notification is-danger">		<!-- WIDE RED-->
			        <p class="title">Wide tile</p>
			        <p class="subtitle">Aligned with the right tile</p>
			        <div class="content">
			          <!-- Content -->
			        </div>
			      </article>
		    </div>
	  </div>
	  <div class="tile is-parent">
		    <article class="tile is-child notification is-success">			<!-- TALL GREEN-->
		      <div class="content">
		        <p class="title">Tall tile</p>
		        <p class="subtitle">With even more content</p>
		        <div class="content">
		          <!-- Content -->
		        </div>
		      </div>
		    </article>
	  </div>
	</div>
```

** Media Object
``` ruby

<article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="content">
      <p>
        <strong>John Smith</strong> <small>@johnsmith</small> <small>31m</small>
        <br>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
      </p>
    </div>
  </div>
  <div class="media-right">
    <button class="delete"></button>
  </div>
</article>
```
<!-- footer -->
<!-- -->