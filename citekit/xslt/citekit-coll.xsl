<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cite="http://chs.harvard.edu/xmlns/cite"
    version="1.0">
    <xsl:param name="ImageServiceGIP"></xsl:param>
    <xsl:param name="ImageServiceThumb"></xsl:param>
    <xsl:param name="TextServiceGPP"></xsl:param>
    <xsl:param name="CollectionServiceGOP"></xsl:param>
    <xsl:param name="image-w"></xsl:param>
    <xsl:output method="html" omit-xml-declaration="yes"/>
    
    <!-- Alert!!!!!! Before doing more on this, update based on the stylesheet in citeservlet, of the same name -->
    
    <xsl:template match="/">
        <!--<ul>
            <li>ImageServiceGIP: <xsl:value-of select="$ImageServiceGIP"/></li>
            <li>ImageServiceThumb: <xsl:value-of select="$ImageServiceThumb"/></li>
            <li>TextServiceGPP: <xsl:value-of select="$TextServiceGPP"/></li>
            <li>CollectionServiceGOP: <xsl:value-of select="$CollectionServiceGOP"/></li>
        </ul>-->
        <xsl:element name="table">
            <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
            <xsl:element name="caption">
                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                <xsl:element name="a">
                    <xsl:attribute name="href"><xsl:value-of select="$CollectionServiceGOP"/><xsl:value-of select="//cite:citeObject/@urn"/></xsl:attribute>
                <xsl:value-of select="//cite:citeObject/@urn"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="tr">
                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                <xsl:element name="th">Property</xsl:element>
                <xsl:element name="th">Value</xsl:element>
            </xsl:element>
            <xsl:for-each select="//cite:citeProperty">
                <xsl:element name="tr">
                    <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                    <xsl:element name="td">
                        <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                        <xsl:value-of select="current()/@label"/>
                </xsl:element>
                    <xsl:element name="td">
                        
                        
                        <xsl:choose>
                            <xsl:when test="@type = 'string'">
                                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                                <xsl:value-of select="."/>
                            </xsl:when>
                            <xsl:when test="@type = 'markdown'">
                                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                                <span class="md"><xsl:value-of select="."/></span>
                            </xsl:when>
                            <xsl:when test="@type = 'number'">
                                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                                <span class="number"><xsl:value-of select="."/></span>
                            </xsl:when>
                            <xsl:when test="@type = 'geojson'">
                                <xsl:attribute name="class">citeCollectionTable geojson</xsl:attribute>
                                <xsl:attribute name="id"><xsl:value-of select="generate-id()"/></xsl:attribute>
                                <xsl:value-of select="."/>
                            </xsl:when>
                            <xsl:when test="(@type = 'ctsurn') or (@type= 'http://www.homermultitext.org/cite/rdf/CtsUrn')">
                                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                                <xsl:element name="a">
                                    <xsl:attribute name="href"><xsl:value-of select="$TextServiceGPP"/><xsl:value-of select="."/></xsl:attribute>
                                    <xsl:apply-templates/>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="@type= 'http://www.homermultitext.org/cite/rdf/CiteUrn'">
                                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                                <xsl:element name="a">
                                    <xsl:attribute name="href"><xsl:value-of select="$CollectionServiceGOP"/><xsl:value-of select="."/></xsl:attribute>
                                    <xsl:apply-templates/>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="@type= 'citeimg'">
                                <xsl:attribute name="class">citeCollectionTable</xsl:attribute>
                                <xsl:if test="string-length(.) &gt; 6">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href"><xsl:value-of select="$ImageServiceGIP"/><xsl:value-of select="."/></xsl:attribute>
                                        <xsl:element name="img">
                                            <xsl:attribute name="src"><xsl:value-of select="$ImageServiceThumb"/><xsl:value-of select="."/>&amp;w=<xsl:value-of select="$image-w"/></xsl:attribute>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test="@type= 'md'">
                                <xsl:attribute name="class">citeCollectionTable md</xsl:attribute>
                                <xsl:value-of select="."/> 
                            </xsl:when>
                            
                            
                        </xsl:choose>
                        
                </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
