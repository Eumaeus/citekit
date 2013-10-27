<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cts="http://chs.harvard.edu/xmlns/cts"
    xmlns:dc="http://purl.org/dc/elements/1.1" xmlns:ti="http://chs.harvard.edu/xmlns/cts3/ti"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" method="html" encoding="UTF-8"/>
    <xsl:param name="serviceId">none_defined</xsl:param>
    <xsl:template match="/">
        <xsl:variable name="urnString">
            <xsl:value-of select="//cts:request/cts:urn"/>
        </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="/cts:CTSError">
                            <xsl:apply-templates select="cts:CTSError"/>
                        </xsl:when>
                        <xsl:otherwise>
								<h3>Valid References
									<xsl:if test="//cts:request/cts:level">
										(level <xsl:value-of select="//cts:request/cts:level"/>)
								</xsl:if>
								</h3>
                            <ul class="cts-content">
                                <xsl:apply-templates select="/cts:GetValidReff/cts:reply/cts:reff"/>
                            </ul>

                        </xsl:otherwise>
                    </xsl:choose>
    </xsl:template>
    <xsl:template match="cts:CTSError">
        <h1>CTS Error</h1>
        <p class="error">
            <xsl:apply-templates select="cts:message"/>
        </p>
        <p>Error code: <xsl:apply-templates select="cts:code"/></p>
        <p>CTS library version: <xsl:apply-templates select="cts:libraryVersion"/>
        </p>
        <p>CTS library date: <xsl:apply-templates select="cts:libraryDate"/>
        </p>
    </xsl:template>
    <xsl:template match="cts:reff">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="cts:urn">
        <li>
                <xsl:call-template name="urnPsg">
                <xsl:with-param name="urnStr">
                    <xsl:value-of select="."/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:text>:  </xsl:text>
            <!-- put together CITEKit include -->
                <code>
                <strong><xsl:value-of select="."/></strong> (Service ID: <xsl:value-of select="$serviceId"/>)
                </code>
                    <xsl:if test="//cts:request/cts:level">
                        <xsl:variable name="level">
                            <xsl:value-of select="//cts:request/cts:level"/>
                        </xsl:variable>
                        <xsl:variable name="minimumLeaf">
                            <xsl:value-of select="//cts:request/cts:minimumLeaf"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$level &lt; $minimumLeaf">
                                <xsl:variable name="newLevel">
                                    <xsl:value-of select="$level + 1"/>
                                </xsl:variable>
                                <!-- no inventory: using default -->
								<br/>
                                <xsl:element name="a">
                                    <!-- <xsl:attribute name="href"><xsl:value-of select="$url-string"/>request=GetValidReff&amp;level=1&amp;urn=<xsl:value-of select="$urn"/></xsl:attribute> -->
                                    <xsl:attribute name="href">javascript:void(0)</xsl:attribute>
                                    <xsl:attribute name="onclick">citekit_loadGVR('<xsl:value-of select="."/>','<xsl:value-of select="$serviceId"/>','<xsl:value-of select="$newLevel"/>')</xsl:attribute>
                                    <xsl:attribute name="target">_blank</xsl:attribute>
									Get valid references for <strong>
										<xsl:call-template name="urnPsg">
												<xsl:with-param name="urnStr">
														<xsl:value-of select="."/>
												</xsl:with-param>
										</xsl:call-template>
								</strong>...
                                </xsl:element>
                                
                            </xsl:when>
                            <xsl:otherwise><!-- no expansion --></xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                
        </li>
    </xsl:template>
    <xsl:template name="urnPsg">
        <xsl:param name="urnStr"/>
        
        <xsl:choose>
            <xsl:when test="contains($urnStr,':')">
                <xsl:call-template name="urnPsg">
                    <xsl:with-param name="urnStr">
                        <xsl:value-of select="substring-after($urnStr,':')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$urnStr"/>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="@*|node()" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
