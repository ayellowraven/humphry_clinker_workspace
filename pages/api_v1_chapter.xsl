<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
	<xsl:param name="url-chapter"/>
	<xsl:param name="url-id"/>

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
	    			<docs><xsl:value-of select="$root"/>/api</docs>
	    		</api>
	    		<section>
	    			<name>Chapters</name>
					<total-entries><xsl:value-of select="api-all-chapters/pagination/@total-entries"/></total-entries>
	    		</section>
	    	</metadata>
	    	<xsl:choose>
	    		<xsl:when test="$url-chapter">
	    			<xsl:choose>
	    				<xsl:when test="api-current-chapter/entry">
	    					<xsl:apply-templates select="api-current-chapter/entry"/>
	    				</xsl:when>
	    				<xsl:when test="$url-chapter &gt; 84">
	    					<error>There are only 84 chapters.</error>
	    				</xsl:when>
	    				<xsl:otherwise>
	    					<error>Something went wrong!</error>
	    				</xsl:otherwise>
	    			</xsl:choose>
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<chapters>
	    				<xsl:apply-templates select="api-all-chapters/entry"/>
	    			</chapters>
	    		</xsl:otherwise>
	    	</xsl:choose>
	    </response>
	</xsl:template>
	
	<xsl:template match="api-all-chapters/entry">
		<chapter>
			<order><xsl:value-of select="order"/></order>
			<url><xsl:value-of select="$root"/><xsl:text>/chapter/</xsl:text><xsl:value-of select="order"/></url>
			<title><xsl:value-of select="title"/></title>
			<from>
				<name><xsl:value-of select="from/item"/></name>
				<slug><xsl:value-of select="from/item/@handle"/></slug>
				<id><xsl:value-of select="@id"/></id>
			</from>
			<date>
			<xsl:choose>
				    <xsl:when test="date">
				    	<xsl:value-of select="date"/>
				    </xsl:when>
				    <xsl:otherwise>
				    	<xsl:text>Date Unknown</xsl:text>
				    </xsl:otherwise>
				</xsl:choose>
			</date>
		</chapter>
	</xsl:template>
	
	<xsl:template match="api-current-chapter/entry">
		<order><xsl:value-of select="order"/></order>
		<date>
			<xsl:choose>
			    <xsl:when test="date">
			    	<xsl:value-of select="substring-after(date,'1770-')"/>
			    </xsl:when>
			    <xsl:otherwise>
			    	<xsl:text>Date Unknown</xsl:text>
			    </xsl:otherwise>
			</xsl:choose>
		</date>
		<title><xsl:value-of select="title"/></title>
		<from>
			<name><xsl:value-of select="from/item"/></name>
			<id><xsl:value-of select="@id"/></id>
		</from>
		<location>
			<name><xsl:value-of select="from-location/item"/></name>
			<id><xsl:value-of select="@id"/></id>
		</location>
		<text>
			<xsl:choose>
				<xsl:when test="$url-id='yes'">
					<xsl:apply-templates select="letter//*"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="letter/*"/>
				</xsl:otherwise>
			</xsl:choose>
		</text>
	</xsl:template>

<xsl:template match="letter//*">
	<xsl:element name="{name()}">
		<xsl:attribute name="id">
    		<xsl:value-of select="name(.)"/>
    		<xsl:text>_</xsl:text>
			<xsl:value-of select="count(preceding-sibling::*[name()=name(current())]) + 1"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>	
</xsl:template>

</xsl:stylesheet>