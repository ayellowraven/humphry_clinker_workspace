<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="complimentary-search">
	<div>
	    <form action="{$root}/search/" class="search" method="get">
	        <label for="search-text">Search</label>
	        <input id="search-text" type="text" placeholder="Nommy n-gram!" name="keywords">
	        	<xsl:attribute name="value">
	        		<xsl:value-of select="//elasticsearch/keywords/raw"/>
	    		</xsl:attribute>
	        </input>
	        <button type="submit" class="entypo-search"><span>Search!</span></button>
		</form>
	</div>
</xsl:template>

</xsl:stylesheet>