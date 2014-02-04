<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cite="http://chs.harvard.edu/xmlns/citeimg" exclude-result-prefixes="cite" version="1.0">
    <xsl:param name="ict-url"/>
    <xsl:param name="image-w">800</xsl:param>
<!--    <xsl:output method="html" omit-xml-declaration="yes"/>
-->    
    
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="(//cite:caption = 'null') and (//cite:rights = 'null')">
                <xsl:element name="span">
                    <xsl:attribute name="class">citekit-error</xsl:attribute>
                    Failed to load <xsl:value-of select="//cite:urn"/> from URL <code><xsl:value-of select="substring-before($ict-url,'ict')"/>.</code>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
        <div class="citeimagediv">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="//cite:zoomableUrl"/></xsl:attribute>
        <xsl:element name="img">
            <xsl:attribute name="class">cite-image</xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="//cite:binaryUrl"/>&amp;w=<xsl:value-of select="$image-w"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="//cite:urn"/></xsl:attribute>
        </xsl:element>
        </xsl:element>
            <div class="citeimagecaption">
            <p class="citekit-urncitation">(<xsl:apply-templates select="//cite:urn"/>)</p>
            <p><xsl:value-of select="//cite:caption"/></p>
            <p><xsl:value-of select="//cite:rights"/></p>
			<p>
					<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="$ict-url"/><xsl:value-of select="//cite:urn"/></xsl:attribute>
							<xsl:attribute name="target">_blank</xsl:attribute>
							Cite &amp; Quote Image
					</xsl:element>
			</p>
            </div>
        </div>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>
