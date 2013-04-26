<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page-title">
	<xsl:choose>
		<xsl:when test="$current-page = 'Home'">
			<xsl:text>Tobias Smollett’s</xsl:text>
		</xsl:when>
		<xsl:when test="$root-page = 'chapter'">
			<xsl:text>Table of Contents —</xsl:text>
		</xsl:when>
		<xsl:when test="$root-page = 'back'">
			<xsl:choose>
			<!-- Chapter -->
				<xsl:when test="$current-page = 'chapter'">
					<xsl:text>Chapter </xsl:text>
					<xsl:value-of select="$current-chapter"/>
				</xsl:when>
			<!-- Character -->
				<xsl:when test="$current-page = 'character'">
					<xsl:value-of select="$current-character"/>
				</xsl:when>
			</xsl:choose>
		</xsl:when>
	</xsl:choose>
	<xsl:text> The Expedition of Humphry Clinker (v 1.9beta)</xsl:text>
</xsl:template>

</xsl:stylesheet>