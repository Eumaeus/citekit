<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cts="http://chs.harvard.edu/xmlns/cts"
    xmlns:dc="http://purl.org/dc/elements/1.1"
    xmlns:ti="http://chs.harvard.edu/xmlns/cts3/ti"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" method="html" encoding="UTF-8"/>
	<xsl:param name="serviceId">none_set</xsl:param>
    <xsl:template match="/">

                    <ul class="citekit_TI_list">
                        <xsl:apply-templates select="//ti:textgroup"/>
                    </ul>

    </xsl:template>
    <xsl:template name="ti:namespace">
        <li>
            <strong>
                <xsl:value-of select="./@abbreviation"/>
            </strong>: <xsl:value-of select="./@nsURI"/>
            <text> </text>
            <xsl:value-of select="ti:description"/>
        </li>
    </xsl:template>
    <xsl:template match="ti:textgroup">
		<xsl:if test=".//ti:online">
        <li>
            <h2>
                <xsl:value-of select="ti:groupname[1]"/>
            </h2>
            <ul>
                <xsl:for-each select="ti:work">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </ul>
        </li>
		</xsl:if>
    </xsl:template>
    <xsl:template match="ti:work">
		<xsl:if test=".//ti:online">
        <li>
            <strong>
                <xsl:value-of select="parent::ti:textgroup/ti:groupname[1]"/>
                <xsl:text>: </xsl:text>
                <em class="title">
                    <xsl:value-of select="ti:title[1]"/>
                </em>
            </strong>
            <ul>
                <xsl:apply-templates select="ti:edition[ti:online]"/>
                <xsl:apply-templates select="ti:translation[ti:online]"/>
            </ul>
        </li>
		</xsl:if>
    </xsl:template>
    <xsl:template match="ti:edition|ti:translation">
		<xsl:if test=".//ti:online">
        <li class="chs-catalogue-element">
            <p>
                <xsl:element name="span">
                    <xsl:attribute name="class">metadata</xsl:attribute>
                    <strong>
                        <xsl:text>urn:cts:</xsl:text>
                        <xsl:value-of select="substring-before(./@projid,':')"/>
                        <xsl:text>:</xsl:text>
                        <xsl:value-of
                            select="substring-after(ancestor::*/@projid,':')"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of
                            select="substring-after(parent::*/@projid,':')"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="substring-after(./@projid,':')"/>
                    </strong>
                </xsl:element>
            </p>
            <p>
                <xsl:choose>
                    <xsl:when test="local-name() = 'edition'"> Edition: </xsl:when>
                    <xsl:when test="local-name() = 'translation'"> Translation:
                            <span class="metadata">[<xsl:value-of
                                select="./@xml:lang"/>] </span>
                    </xsl:when>
                </xsl:choose>
                <strong>
                    <xsl:value-of select="ti:label"/>
                </strong>
                <xsl:value-of select="ti:description"/>
            </p>
            <xsl:if test="ti:online">
                <xsl:variable name="qualifiedWorkId">
                    <xsl:value-of select="ancestor::ti:work/@projid"/>
                </xsl:variable>
                <xsl:variable name="workId">
                    <xsl:value-of select="substring-after($qualifiedWorkId,':')"
                    />
                </xsl:variable>
				<xsl:variable name="edId">
					<xsl:value-of select="substring-after(./@projid,':')"/>
                </xsl:variable>

                <xsl:variable name="urn">urn:cts:<xsl:value-of
                        select="ancestor::ti:textgroup/@projid"/>.<xsl:value-of
                        select="$workId"/>.<xsl:value-of select="$edId"
                    /></xsl:variable>
                <p>
					<xsl:element name="span">
							<xsl:attribute name="class">gvr_container</xsl:attribute>
							<xsl:attribute name="id">gvr_<xsl:value-of select="$urn"/></xsl:attribute>
							<xsl:element name="a">
									<!-- <xsl:attribute name="href"><xsl:value-of select="$url-string"/>request=GetValidReff&amp;level=1&amp;urn=<xsl:value-of select="$urn"/></xsl:attribute> -->
									<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
									<xsl:attribute name="onclick">citekit_loadGVR('<xsl:value-of select="$urn"/>','<xsl:value-of select="$serviceId"/>',1)</xsl:attribute>
									<xsl:attribute name="target">_blank</xsl:attribute>
									Get Valid References
							</xsl:element>
					</xsl:element>
                </p>
            </xsl:if>
        </li>
		</xsl:if>
    </xsl:template>
    <xsl:template match="ti:citation">
        <xsl:param name="level"/>
        <option value="{$level}">
            <xsl:value-of select="./@label"/>
        </option>
        <xsl:variable name="nextLevel">
            <xsl:value-of select="$level + 1"/>
        </xsl:variable>
        <xsl:apply-templates select="ti:citation">
            <xsl:with-param name="level">
                <xsl:value-of select="$level + 1"/>
            </xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="ti:collection">
        <p>collection <xsl:value-of select="./@id"/></p>
    </xsl:template>
    <!-- Default: replicate unrecognized nodes and attributes -->
    <xsl:template match="@*|node()" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
