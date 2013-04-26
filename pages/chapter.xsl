<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="/data">
	<h1><xsl:value-of select="$page-title"/></h1>

		<div id="toc-visualized">
		</div>
	
	<section role="main">
		<div id="chapter-order">
			<h2>Chapter Order</h2>
			<ol>
				<xsl:apply-templates select="toc-all-chapters/entry"/>
			</ol>
		</div>
		<div id="chronological-order">
			<h2>Chronological Order</h2>
			<ol>
				<xsl:apply-templates select="toc-chronological/entry"/>
			</ol>
		</div>
	</section>
</xsl:template>

<xsl:template match="toc-all-chapters/entry">
	<li>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="order"/>
			</xsl:attribute>
    		<xsl:attribute name="class">
    			<xsl:value-of select="from/item/@handle"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
			<xsl:text> </xsl:text>
			<span class="from">
			    <xsl:text> (From </xsl:text>
			    <xsl:value-of select="from/item"/>
			    <xsl:text>.)</xsl:text>
			</span>

		</a>
	</li>
</xsl:template>

<xsl:template match="toc-chronological/entry">
	<li>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="order"/>
			</xsl:attribute>
    		<xsl:attribute name="class">
    			<xsl:value-of select="from/item/@handle"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="date">
		        	<xsl:call-template name="format-date">
		        		<xsl:with-param name="date" select="date"/>
		    			<xsl:with-param name="format" select="'[M d] '"/>
		        	</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>[Date Unknown] </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="title"/>
			<xsl:text> </xsl:text>
			<span class="from">
			    <xsl:text> (From </xsl:text>
			    <xsl:value-of select="from/item"/>
			    <xsl:text>.)</xsl:text>
			</span>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>