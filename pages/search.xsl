<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="/data">
	<section role="main">
		<h1><xsl:value-of select="$page-title"/></h1>
		<form action="" class="search" method="get">
			<label for="search-text">Search</label>
		    <input id="search-text" type="text" placeholder="Nommy n-gram!" name="keywords">
		    	<xsl:attribute name="value">
		    		<xsl:value-of select="//elasticsearch/keywords/raw"/>
		    	</xsl:attribute>
		    </input>
		    <button type="submit" class="entypo-search"><span>Search!</span></button>
		</form>
		
		<div id="results">
			<xsl:choose>
				<xsl:when test="elasticsearch/entries/entry">
					<ol>
						<xsl:apply-templates select="elasticsearch/entries/entry"/>
					</ol>
				</xsl:when>
				<xsl:when test="//elasticsearch/keywords/raw">
					<p>Sorry, I didn’t find anything.</p>				
				</xsl:when>
				<xsl:otherwise>
					<p>Search the full text of <i>The Expedition of Humphry Clinker</i>.</p>
				</xsl:otherwise>				
			</xsl:choose>
		</div>

	</section>
</xsl:template>

<xsl:template match="elasticsearch/entries/entry">
	<li>
		<h2>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="$root"/>
					<xsl:text>/chapter/</xsl:text>
					<xsl:value-of select="//entry[@id=current()/@id]/order"/>
				</xsl:attribute>
	    		<xsl:attribute name="class">
	    			<xsl:value-of select="//entry[@id=current()/@id]/from/item/@handle"/>
				</xsl:attribute>
		    	<xsl:text>Chapter </xsl:text>
   				<xsl:value-of select="//entry[@id=current()/@id]/order"/>
   				<xsl:text>: </xsl:text>

				<xsl:value-of select="//entry[@id=current()/@id]/title"/>
			</a>
		</h2>
   		<div class="search-from">
	    	<xsl:text>From: </xsl:text>
    		<xsl:value-of select="//entry[@id=current()/@id]/from"/>
    	</div>
    	<div class="search-date">
	    	<xsl:choose>
		    	<xsl:when test="//entry[@id=current()/@id]/date">
		    	    <xsl:text>Date: </xsl:text>
		            <xsl:call-template name="format-date">
		            	<xsl:with-param name="date" select="//entry[@id=current()/@id]/date"/>
		            	<xsl:with-param name="format" select="'M d'"/>
		            </xsl:call-template>
		    	</xsl:when>
		    	<xsl:otherwise>
		    		<xsl:text>[Date Unknown]</xsl:text>
		    	</xsl:otherwise>
	    	</xsl:choose>
		</div>
	</li>
</xsl:template>

</xsl:stylesheet>