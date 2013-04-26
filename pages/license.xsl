<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="/data">
	<section role="main">
		<h1><xsl:value-of select="$page-title"/></h1>
		<p><i>The Expedition of Humphry Clinker</i> is in the public domain. The text for this particular copy was from <a href="http://gutenberg.org/ebooks/2160">Project Gutenberg</a>. Further, all software required to run this sites is released via various open source licenses. All code created by <a href="http://ayellowraven.com">A Yellow Raven</a> and <a href="http://bernardyu.com">Bernard Yu</a> are released with the MIT License (provided below), and text is released with the <a href="http://creativecommons.org/about/cc0">Creative Commons Public Domain License</a>. Fonts are owned by their respective creators, and the yellow raven logo is a trademark of <a href="http://ayellowraven.com">A Yellow Raven</a>.</p>		
		<h2>MIT License</h2>
		<p>Copyright &#169; <a href="http://ayellowraven">A Yellow Raven</a> and <a href="http://bernardyu.com">Bernard Yu</a></p>
		<p>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:</p>
		<p>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.</p>
		<p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.</p>
	</section>
</xsl:template>

</xsl:stylesheet>