<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="date-time.xsl"/>
<xsl:import href="page-title.xsl"/>
<xsl:import href="typography.xsl"/>
<xsl:import href="search.xsl"/>

<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
	
<xsl:template match="/">
	<xsl:comment><![CDATA[[if IE 6]><html lang="en" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6 wf-inactive"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]><html lang="en" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6 wf-inactive"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]><html lang="en" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6 wf-inactive"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 9]><html lang="en" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6 wf-inactive"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if !(lte IE 9)]><!]]></xsl:comment><html lang="en" class="no-js wf-inactive"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
		<head>
	<meta charset="utf-8"/>
	
	<xsl:text disable-output-escaping="yes">
&lt;!--
	
    (o_                        _o)
    //\      Hello there!      /\\
    V_/_                      _\_V
    ==============================

    My fellow readers. If you like
    it under here, you may also
    like the Github repo ♥
     
--&gt;
	</xsl:text>
	
	<title><xsl:call-template name="page-title"/></title>

	<!-- Use the .htaccess and remove these lines to avoid edge case issues.
 			More info: h5bp.com/i/378 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="description" content=""/>

	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width"/>

	<!-- Styles are generated using Compass and the html5-boilerplate gem in workspace/scss -->
	<link rel="stylesheet" href="{$workspace}/css/style.css"/>
	
	<!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

	<script src="{$workspace}/js/modernizr-2.5.2.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/d3/3.0.8/d3.min.js"></script>
	<script src="{$workspace}/js/typography.js"></script>
	<link type="text/plain" rel="author">
		<xsl:attribute name="href">
			<xsl:value-of select="$workspace"/>
			<xsl:text>/humans.txt</xsl:text>
		</xsl:attribute>
	</link>
	
	<xsl:text disable-output-escaping="yes">
	&lt;script&gt;window.jQuery || document.write('&lt;script src="js/libs/jquery-1.7.1.min.js"&gt;&lt;\/script&gt;')&lt;/script&gt;
	</xsl:text>

	<script type="text/javascript">
      WebFontConfig = {
        google: { families: [ 'Vollkorn', 'Old Standard TT' ] }
      };
      (function() {
        var wf = document.createElement('script');
        wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
            '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
      })();
    </script>
</head>
<body>
	<xsl:attribute name="id">
		<xsl:choose>
			<xsl:when test="//params/ds-current-chapter/item">
				<xsl:text>book_chapter</xsl:text>
			</xsl:when>
			<xsl:when test="$root-page = 'docs'">
				<xsl:text>docs</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$current-page"/>			
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>_page</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="class">
		<xsl:choose>
			<xsl:when test="$eohc-reading-mode = 'explore'">
				<xsl:text>explore</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>quiet</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$night = 'yes'">
			<xsl:text> night</xsl:text>
		</xsl:if>
	</xsl:attribute>
	

	<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
 			chromium.org/developers/how-tos/chrome-frame-getting-started -->
	<xsl:comment>
		<!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->	
	</xsl:comment>


	<header role="banner">
		<h1><a href="{$root}">The Expedition of Humphry Clinker</a></h1>
		<xsl:if test="$current-page = 'home'">
			<h2>by Tobias Smollett (version 1.9beta)</h2>
		</xsl:if>
		
	</header>
	<div id="utilities" role="controlset">
		<ul>
			<li class="info"><a href="#info" title="Help Info (i)" class="entypo-info-circled"><span>Help information (i key)</span></a></li>
			<li><button title="Day/Night (d)" id="day-night" type="button">
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$night = 'yes'">
							<xsl:text>entypo-light-down</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>entypo-light-up</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<span>Day/Night (d key)</span>
			</button></li>
			
			<li class="quiet-mode">
				<button id="quiet" title="Quiet Mode (q)">
					<xsl:attribute name="class">
						<xsl:text>entypo-book-open</xsl:text>
						<xsl:if test="$eohc-reading-mode = 'quiet'">
							<xsl:text> active</xsl:text>
						</xsl:if>
					</xsl:attribute>
					<span>Quiet Mode (q key)</span>
				</button>
			</li>
			<li class="explore-mode">
				<button id="explore" title="Explore Mode (e)">
					<xsl:attribute name="class">
						<xsl:text>entypo-map</xsl:text>
						<xsl:if test="$eohc-reading-mode = 'explore'">
							<xsl:text> active</xsl:text>
						</xsl:if>
					</xsl:attribute>
					<span>Explore Mode (e key)</span>
				</button>
			</li>				
		</ul>
	</div>
	<nav>
		<div id="local">
			<ul>
				<xsl:if test="//params/ds-current-chapter/item">
					<li class="set-bookmark">
						<button id="set-bookmark" class="entypo-tag" type="button">
							<xsl:if test="$eohc-bookmark = //params/ds-current-chapter/item">
								<xsl:attribute name="disabled">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="title">
								<xsl:choose>
									<xsl:when test="$eohc-bookmark = //params/ds-current-chapter/item">
										<xsl:text>Already Set!</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Bookmark this chapter (s)</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<span>Bookmark this chapter (s)</span>
						</button>
					</li>
				</xsl:if>
				<xsl:if test="$eohc-bookmark &gt; 0">
					<li class="goto-bookmark">
						<xsl:choose>
							<xsl:when test="$eohc-bookmark = //params/ds-current-chapter/item">
								<mark>
									<a class="entypo-bookmark">
										<xsl:attribute name="href">
											<xsl:value-of select="$root"/>
											<xsl:text>/chapter/</xsl:text>
											<xsl:value-of select="$eohc-bookmark"/>
										</xsl:attribute>
										<xsl:attribute name="title">
											<xsl:text>You’re here!</xsl:text>
										</xsl:attribute>
										<span>You’re here!</span>
									</a>
								</mark>
							</xsl:when>
							<xsl:otherwise>
								<a class="entypo-bookmark">
									<xsl:attribute name="href">
										<xsl:value-of select="$root"/>
										<xsl:text>/chapter/</xsl:text>
										<xsl:value-of select="$eohc-bookmark"/>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:text>Go to chapter </xsl:text>
										<xsl:value-of select="//params/bookmark"/>
										<xsl:text> (g)</xsl:text>
									</xsl:attribute>
									<span>Go to chapter <xsl:value-of select="$eohc-bookmark"/> (g)</span>
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</li>
				</xsl:if>
				<xsl:if test="//params/ds-current-chapter/item">
					<li class="show-permalilnks">
						<button id="show-permalinks" class="entypo-link" type="button" title="Toggle Permalinks (p)">
							<span>Toggle permanent links to paragraphs (p)</span>
						</button>
					</li>
				</xsl:if>
				<xsl:if test="//params/ds-current-chapter/item">
					<li class="back">
						<a>
							<xsl:attribute name="href">
								<xsl:text>../</xsl:text>
								<xsl:if test="$ds-current-chapter &gt; 1">
									<xsl:value-of select="$ds-current-chapter - 1"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:attribute name="class">
								<xsl:text>entypo-</xsl:text>
								<xsl:choose>
									<xsl:when test="$ds-current-chapter &gt; 1">
										<xsl:text>left</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>up</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:choose>
									<xsl:when test="$ds-current-chapter &gt; 1">
										<xsl:text>Back</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Table of Contents</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> (b)</xsl:text>
							</xsl:attribute>
							<span>
								<xsl:choose>
									<xsl:when test="$ds-current-chapter &gt; 1">
										<xsl:text>Back</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Table of Contents</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> (b key)</xsl:text>
							</span>
						</a>
					</li>
		
					<li class="next">
						<a>
							<xsl:attribute name="href">
								<xsl:text>../</xsl:text>
								<xsl:if test="$ds-current-chapter &lt; 84">
									<xsl:value-of select="$ds-current-chapter + 1"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:attribute name="class">
								<xsl:text>entypo-</xsl:text>
								<xsl:choose>
									<xsl:when test="$ds-current-chapter &lt; 84">
										<xsl:text>right</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>up</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:choose>
									<xsl:when test="$ds-current-chapter &lt; 84">
										<xsl:text>Next</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Table of Contents</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> (n)</xsl:text>
							</xsl:attribute>
							<span>
								<xsl:choose>
									<xsl:when test="$ds-current-chapter &lt; 84">
										<xsl:text>Next</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Table of Contents</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> (n key)</xsl:text>
							</span>
						</a>
					</li>
				</xsl:if>
			</ul>
		</div>
		<div id="global">
			<ul>
				<li>
					<xsl:choose>
						<xsl:when test="$root-page = 'chapter'">
							<mark><a href="{$root}/chapter" class="entypo-book" title="Table of Contents (t)"><span>Table of Contents (t)</span></a></mark>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$root}/chapter" class="entypo-book" title="Table of Contents (t)"><span>Table of Contents (t)</span></a>
						</xsl:otherwise>				
					</xsl:choose>
				</li>
<!--
				<li>
					<xsl:choose>
						<xsl:when test="$current-page = 'character'">
							<mark><a href="{$root}/character" class="entypo-users" title="Characters"><span>Characters</span></a></mark>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$root}/character" class="entypo-users" title="Characters"><span>Characters</span></a>
						</xsl:otherwise>				
					</xsl:choose>
				</li>
				<li>
					<xsl:choose>
						<xsl:when test="$current-page = 'location'">
							<mark><a href="{$root}/location" class="entypo-location" title="Locations"><span>Locations</span></a></mark>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$root}/location" class="entypo-location" title="Locations"><span>Locations</span></a>
						</xsl:otherwise>				
					</xsl:choose>
				</li>
-->
				<li>
					<xsl:choose>
						<xsl:when test="$current-page = 'search'">
							<mark><a href="{$root}/search" class="entypo-search" title="Search (f)"><span>Search (f)</span></a></mark>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$root}/search" class="entypo-search" title="Search (f)"><span>Search (f)</span></a>
						</xsl:otherwise>				
					</xsl:choose>
				</li>
			</ul>
		</div>
	</nav>

	<!-- Individual pages include role="main" and role="complimentary" -->
	<div id="content">
		<xsl:apply-templates />
	</div>
	<footer>


		<div id="info" title="Keyboard Shortcuts">
			<h2>Keyboard Shortcuts</h2>
			<div id="settings-navigation">
				<h3>Book navigation</h3>
				<dl>
					<dt>h</dt>
					<dd>Go to the introduction</dd>
					<dt>t</dt>
					<dd>Go to the table of contents</dd>
					<dt>
						<xsl:if test="not(//params/ds-current-chapter/item)">
							<xsl:attribute name="class">
								<xsl:text>disabled</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>b</xsl:text>
					</dt>
					<dt class="entypo-left"><span>Left arrow</span></dt>
					<dd>
						<xsl:if test="not(//params/ds-current-chapter/item)">
							<xsl:attribute name="class">
								<xsl:text>disabled</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Previous chapter</xsl:text>
					</dd>
					<dt>
						<xsl:if test="not(//params/ds-current-chapter/item)">
							<xsl:attribute name="class">
								<xsl:text>disabled</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>n</xsl:text>
					</dt>
					<dt class="entypo-right"><span>Right arrow</span></dt>
					<dd>
						<xsl:if test="not(//params/ds-current-chapter/item)">
							<xsl:attribute name="class">
								<xsl:text>disabled</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Next chapter</xsl:text>
					</dd>				
					<dt>g</dt>
					<dt class="entypo-bookmark"><span>Bookmark icon</span></dt>
					<dd>Go to bookmark</dd>
					<dt>
						<xsl:if test="not(//params/ds-current-chapter/item)">
							<xsl:attribute name="class">
								<xsl:text>disabled</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>s</xsl:text>
					</dt>
					<dt class="entypo-tag"><span>Tag icon</span></dt>
					<dd>
						<xsl:if test="not(//params/ds-current-chapter/item)">
							<xsl:attribute name="class">
								<xsl:text>disabled</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Set bookmark</xsl:text>
					</dd>
				</dl>
			</div>
			<div id="settings-utilities">
				<h3>Site Utilities</h3>
				<dl>				
					<dt>i</dt>
					<dt class="entypo-info-circled"><span>Info icon</span></dt>
					<dd>This help sheet</dd>
					<dt>d</dt>
					<dt class="entypo-light-up"><span>Sun icon</span></dt>
					<dd>Toggle Day/Night mode</dd>
					<dt>q</dt>
					<dt class="entypo-book-open"><span>Open Book icon</span></dt>
					<dd>Quiet mode</dd>
					<dt>e</dt>
					<dt class="entypo-map"><span>Map icon</span></dt>
					<dd>Explore mode</dd>
					<dt>f</dt>
					<dd>Search</dd>
					<dt>p</dt>
					<dt class="entypo-link"><span>Link icon</span></dt>
					<dd>Show/Hide permalinks</dd>
				</dl>
			</div>
		</div>
		
		<div id="docs">
			<ul>
				<li><a href="{$root}/api">API Docs</a></li>
				<li><a href="">Github</a></li>
				<li><a href="{$root}/license">Public Domain</a></li>
			</ul>
		</div>
		<div id="credits">
			<p>Built with love by <a href="http://ayellowraven">A Yellow Raven</a>.</p>
		</div>
	</footer>

	<!-- scripts concatenated and minified via build script -->
	<script src="{$workspace}/js/plugins.js"></script>
	<script src="{$workspace}/js/script.js?v15"></script>

<script><xsl:if test="//params/ds-current-chapter/item">
	$("button#set-bookmark").click(function(){
		$.cookie('eohc-bookmark', '<xsl:value-of select="$ds-current-chapter"/>', {path:'/'});
		$("a.entypo-bookmark").addClass('active').attr("href", window.location.pathname).attr("title","Chapter <xsl:value-of select="$ds-current-chapter"/>");
		$("button#set-bookmark").attr('disabled', true).attr('title','');
		$("#toc a.bookmark").removeClass('bookmark').attr("title",function(a,val){return val.replace("[Bookmarked] ","");});
		$("#toc a.bookmark span").replace("[Bookmarked] ","");
	});
	chaptersTimeline("#chapters-timeline","/humphrey_clinker/api/v1/chapter",360,2000);
</xsl:if>
<xsl:if test="//params/current-path = '/chapter'">
horizontalTimeline("#toc-visualized","/humphrey_clinker/api/v1/chapter",960,270);
</xsl:if>
</script>

	<!-- end scripts -->

	<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID.
 			mathiasbynens.be/notes/async-analytics-snippet -->
	<script>
		var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>


</body>
</html>
</xsl:template>

</xsl:stylesheet>
