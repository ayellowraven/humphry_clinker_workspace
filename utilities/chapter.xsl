<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Render entry -->
<xsl:template name="chapter-entry">
	<article>
		<xsl:attribute name="id">
			<xsl:text>chapter_</xsl:text>
			<xsl:value-of select="order"/>
		</xsl:attribute>
		<h1 class="headline_1"><xsl:value-of select="title"/></h1>
		<xsl:copy-of select="letter/*"/>
	</article>
</xsl:template>

</xsl:stylesheet>