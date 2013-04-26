<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/data">
{"chapters": [<xsl:apply-templates select="toc-all-chapters/entry"/>]
}
</xsl:template>

<xsl:template match="toc-all-chapters/entry">
	<xsl:text>{</xsl:text>
	<xsl:text>"chapter":</xsl:text><xsl:value-of select="order"/><xsl:text>,</xsl:text>
	<xsl:text>"date":"</xsl:text><xsl:value-of select="date"/><xsl:text>",</xsl:text>
	<xsl:text>"slug":"</xsl:text><xsl:value-of select="from/item/@handle"/><xsl:text>",</xsl:text>
	<xsl:text>"from":"</xsl:text><xsl:value-of select="from/item"/><xsl:text>",</xsl:text>
	<xsl:text>"title":"</xsl:text><xsl:value-of select="title"/><xsl:text>"</xsl:text>
	<xsl:text>}</xsl:text>
	<xsl:if test="not(position() = last())">
		<xsl:text>,
	</xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>