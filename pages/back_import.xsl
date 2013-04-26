<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<data>
		<xsl:apply-templates select="//letter"/>
	</data>
</xsl:template>

<xsl:template match="//letter">
	<letter>
		<xsl:attribute name="chapter">
			<xsl:value-of select="@id"/>
		</xsl:attribute>
		<xsl:attribute name="title">
			<xsl:value-of select="title"/>
		</xsl:attribute>
		<chapter>
			<xsl:attribute name="id">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
			<xsl:value-of select="@id"/>
		</chapter>
		<title>
			<xsl:attribute name="title">
				<xsl:value-of select="title"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</title>
		<contents>
			<xsl:value-of select="contents/text()"/>
		</contents>
	</letter>

</xsl:template>
</xsl:stylesheet>
