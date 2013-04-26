<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
	
	<xsl:template match="/">
		<response>
		    <metadata>
		    	<title>The Expedition of Humphry Clinker</title>
		    	<author>Tobias Smollett</author>
		    	<original-published>W. Johnson and B. Collins</orginal-published>
		    	<original-publisher>1771-06-17</original-publisher>
		    	<ayr-published>2013-04-22</ayr-published>
		    	<url><xsl:value-of select="$root"/></url>
		    	<text-path><xsl:value-of select="$root"/>/chapter</text-path>
		    	<oclc>41152911</oclc>
		    	<isbn>
		    		<item>0-19-283594-7</item>
		    	</isbn>
		    	<sources>
		    		<item>http://gutenberg.org/ebooks/2160</item>
		    	</sources>
		    	<tags>
		    		<item>Great Britain</item>
		    		<item>Travel</item>
		    		<item>Novel</item>
		    		<item>Picaresque</item>
		    		<item>Epistolary</item>
		    	</tags>
		    	<langauges>
		    		<item>English</item>
		    	</languages>
		    	<description>
		    		A Picaresque novel set in 18th century Britain, the story is told through a series of letters. Originally published on June 17, 1771. This is Smollett’s last and many say it is his best and funniest work.
		    	</description>
		    	<api>
		    		<version>1</version>
		    		<root><xsl:value-of select="$root"/>/api/v1</root>
		    		<docs><xsl:value-of select="$root"/>/api/</docs>
		    	</api>
		    	<section>
		    		<name>API Root</name>
		    	</section>
		    </metadata>
	    	<chapter>
	    		<last-updated>
	    			<xsl:value-of select="$ds-api-updated-chapter.system-modification-date"/>
	    		</last-updated>
	    		<total>
	    			<xsl:value-of select="//api-updated-chapter/pagination/@total-entries"/>
	    		</total>
	    		<url><xsl:value-of select="$root"/>/api/v1/chapter</url>
	    	</chapter>
	    	<character>
	    		<last-updated>
	    			<xsl:value-of select="$ds-api-updated-character.system-modification-date"/>
	    		</last-updated>	
	    		<total>
	    			<xsl:value-of select="//api-updated-character/pagination/@total-entries"/>
	    		</total>
	    		<url><xsl:value-of select="$root"/>/api/v1/character</url>
	    	</character>
	    	<location>
	    		<last-updated>
	    			<xsl:value-of select="$ds-api-updated-location.system-modification-date"/>
	    		</last-updated>
	    		<total>
	    			<xsl:value-of select="//api-updated-location/pagination/@total-entries"/>
	    		</total>
	    		<url><xsl:value-of select="$root"/>/api/v1/location</url>
	    	</location>
	    </response>
	</xsl:template>
</xsl:stylesheet>