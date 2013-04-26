<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
	
	<xsl:template match="/data">
		<response>
		    <metadata>
		    	<title>The Expedition of Humphry Clinker</title>
		    	<author>Tobias Smollett</author>
		    	<ayr-published>2013-04-22</ayr-published>
		    	<url><xsl:value-of select="$root"/></url>
		    	<text-path><xsl:value-of select="$root"/>/chapter</text-path>
		    	<api>
		    		<version>1</version>
		    		<root><xsl:value-of select="$root"/>/api/v1</root>
		    		<docs><xsl:value-of select="$root"/>/api/</docs>
		    	</api>
		    	<section>
		    		<name>Search</name>
		    		<total-entries>84</total-entries>
		    	</section>
		    </metadata>
		    <xsl:choose>
		    	<xsl:when test="//elasticsearch/keywords/raw">
		    		<search-results>
		    			<search-criteria>
		    				<xsl:value-of select="//elasticsearch/keywords/raw"/>
		    				<total-results><xsl:value-of select="elasticsearch/pagination/@total-entries"/></total-results>
		    			</search-criteria>
		    			<xsl:choose>
		    				<xsl:when test="elasticsearch/pagination/@total-entries = 0">
		    					<result>No results.</result>
		    				</xsl:when>
		    				<xsl:otherwise>
		    					<chapters>
		    						<xsl:apply-templates select="elasticsearch/entries/entry"/>
		    					</chapters>
		    				</xsl:otherwise>
		    			</xsl:choose>
		    		</search-results>
		    	</xsl:when>
		    	<xsl:otherwise>
		    		<error>Need keyword.</error>
				</xsl:otherwise>
		    </xsl:choose>
		</response>
	</xsl:template>
	
	<xsl:template match="elasticsearch/entries/entry">
		<chapter>
			<order><xsl:value-of select="//entry[@id=current()/@id]/order"/></order>
			<url><xsl:value-of select="$root"/><xsl:text>/chapter/</xsl:text><xsl:value-of select="//entry[@id=current()/@id]/order"/></url>
			<title><xsl:value-of select="//entry[@id=current()/@id]/title"/></title>
			<from>
				<name><xsl:value-of select="//entry[@id=current()/@id]/from/item"/></name>
				<id><xsl:value-of select="//entry[@id=current()/@id]/@id"/></id>
			</from>
			<date>
			<xsl:choose>
				    <xsl:when test="//entry[@id=current()/@id]/date">
				    	<xsl:value-of select="substring-after(//entry[@id=current()/@id]/date,'1770-')"/>
				    </xsl:when>
				    <xsl:otherwise>
				    	<xsl:text>Date Unknown</xsl:text>
				    </xsl:otherwise>
				</xsl:choose>
			</date>
		</chapter>
	</xsl:template>
</xsl:stylesheet>