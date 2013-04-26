<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:template match="/data">
	<section role="main">
		<h1><xsl:value-of select="$page-title"/></h1>
		<p>The API lets your applications programmatically interact with main text from the book, as well as extra metadata. It requires no authentication and is not rate-limited in any way. But please be kind on my server. If you need to use it a lot, perhaps you should <a href="">download your own copy of this book from Github</a>. Find me on <a href="http://twitter.com/thebestsophist">Twitter</a>, and I’ll help you set it up.</p>

		<h3>Methods</h3>
		<p>All methods are GET requests, default responses are XML, but you can also request JSON and JSONP</p>
		<h3>URL Parameters</h3>
		<ul>
			<li><code>format</code>: specify output format (<code>json|jsonp|xml</code>)</li>
			<li><code>callback</code>: specify a callback name for jsonp requests (format: <code>json</code>)</li>
		</ul>
		<h2><xsl:value-of select="$root"/>/api/v1</h2>
		<p>Returns the last time chapter, character, and location data were updated.</p>		

		<h2><xsl:value-of select="$root"/>/api/v1/chapter</h2>
		<p>Returns a chapter and corresponding metadata. A request without any arguments returns list of all chapters.</p>
		<h3>URL Parameters</h3>
		<ul>
			<li><code>chapter</code>: specify chapter (<code>1</code> to <code>84</code>).</li>
			<li><code>id</code>: specify whether headlines and titles include anchor IDs, defaults to no (format: <code>yes|no</code> )</li>
		</ul>
		<h2><xsl:value-of select="$root"/>/api/v1/character</h2>
		<p>Returns a character and a list of associated chapters. A request without any arguments returns list of all characters, organized by type.</p>
		<h3>URL Parameters</h3>
		<ul>
			<li><code>id</code>: specify character id</li>
		</ul>

		<h2><xsl:value-of select="$root"/>/api/v1/location</h2>
		<p>Returns a location and related chapters. A request without any arguments returns list of all locations. (Note: not all chapters have location data.)</p>
		<h3>URL Parameters</h3>
		<ul>
			<li><code>id</code>: specify location id number</li>
		</ul>

		<h2><xsl:value-of select="$root"/>/api/v1/search</h2>
		<p>Runs full-text keyword search of chapters.</p>
		<h3>URL Parameters</h3>
		<ul>
			<li>(Required) <code>keywords</code>: specify search terms, separate words with <code>+</code> (eg. <code>hot+wells</code>)</li>
		</ul>

		<h2>Error Handling</h2>
		<p>If something goes wrong, you’ll get an enigmatic:</p>
		<p><code>&lt;result&gt;Something went wrong!&lt;/result&gt;</code></p>
	</section>
</xsl:template>

</xsl:stylesheet>