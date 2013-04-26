<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
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
		    		<docs><xsl:value-of select="$root"/>/api/</docs>
		    	</api>
				<section>
		    		<name>Locations</name>
		    		<total-entries><xsl:value-of select="api-all-locations/pagination/@total-entries"/></total-entries>
		    	</section>
		    </metadata>
		    <xsl:choose>
		    	<xsl:when test="url-id">
		    		<xsl:choose>
		    			<xsl:when test="api-current-location/entry">
		    				<xsl:apply-templates select="api-current-location/entry"/>
		    				<chapters>
		    					<total><xsl:value-of select="api-current-location-chapters/pagination/@total-entries"/></total>
		    					<xsl:apply-templates select="api-current-location-chapters/entry"/>
		    				</chapters>
		    			</xsl:when>
		    			<xsl:otherwise>
		    				<error>Something went wrong!</error>
		    			</xsl:otherwise>
		    		</xsl:choose>
		    	</xsl:when>
		    	<xsl:otherwise>
		    		<locations>
		    			<xsl:apply-templates select="api-all-locations/entry"/>
		    		</locations>
		    	</xsl:otherwise>
		    </xsl:choose>
		</response>
	</xsl:template>
	
	<xsl:template match="api-all-locations/entry">
		<location>
			<name><xsl:value-of select="name"/></name>
			<id><xsl:value-of select="@id"/></id>
		</location>
	</xsl:template>
	
	<xsl:template match="api-current-location/entry">
		<location>
			<name><xsl:value-of select="name"/></name>
			<id><xsl:value-of select="@id"/></id>
			<geo>
				<latitude><xsl:value-of select="location/@latitude"/></latitude>
				<longitude><xsl:value-of select="location/@longitude"/></longitude>				
			</geo>
		</location>
	</xsl:template>
	
	<xsl:template match="api-current-location-chapters/entry">
		<chapter>
			<order><xsl:value-of select="order"/></order>
			<url><xsl:value-of select="$root"/><xsl:text>/chapter/</xsl:text><xsl:value-of select="order"/></url>
			<title><xsl:value-of select="title"/></title>
			<from>
				<name><xsl:value-of select="from/item"/></name>
				<id><xsl:value-of select="@id"/></id>
			</from>
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
		</chapter>
	</xsl:template>
</xsl:stylesheet>