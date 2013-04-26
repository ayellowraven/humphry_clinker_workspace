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
			    	<name>Characters</name>
			    	<total-entries><xsl:value-of select="api-all-characters/pagination/@total-entries"/></total-entries>
			    </section>
			</metadata>
	
			<xsl:choose>
			    <xsl:when test="$url-id">
			    	<xsl:choose>
			    		<xsl:when test="api-current-character/entry">
			    			<xsl:apply-templates select="api-current-character/entry"/>
			    			
			    			<chapters>
			    				<total>
			    					<xsl:value-of select="api-current-character-chapters/pagination/@total-entries"/>
			    				</total>
			    				<xsl:apply-templates select="api-current-character-chapters/entry"/>
			    			</chapters>
			    		</xsl:when>
			    		<xsl:otherwise>
			    			<error>Something went wrong!</error>
			    		</xsl:otherwise>
			    	</xsl:choose>
			    </xsl:when>
			    <xsl:otherwise>
			    	<characters>
			    		<xsl:apply-templates select="api-all-characters/type"/>
			    	</characters>
			    </xsl:otherwise>
			</xsl:choose>
		</xsl:template>
		
		<xsl:template match="api-all-characters/type">
			<type>
				<xsl:for-each select="entry">
					<character>
						<name><xsl:value-of select="name"/></name>
						<url><xsl:value-of select="$root"/><xsl:text>/character/</xsl:text><xsl:value-of select="name/@handle"/></url>
						<id><xsl:value-of select="@id"/></id>
					</character>
				</xsl:for-each>
			</type>
		</response>
	</xsl:template>
	
	<xsl:template match="api-current-character/entry">
		<character>
		    <name><xsl:value-of select="name"/></name>
		    <id><xsl:value-of select="@id"/></id>
		    <type><xsl:value-of select="type/item"/></type>
		    <bio><xsl:copy-of select="bio/*"/></bio>
			<spoiler><xsl:copy-of select="spoiler/*"/></spoiler>
		</character>
	</xsl:template>
	
	<xsl:template match="api-current-character-chapters/entry">
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