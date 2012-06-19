<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:template name="originInfo">
        <xsl:variable name="apostrophe">
            <xsl:value-of>&apos;</xsl:value-of>
        </xsl:variable>
        <xsl:element name="originInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="place">
                <xsl:element name="placeTerm">
                    <xsl:value-of>Charlottesville (Va.)</xsl:value-of>
                </xsl:element>
            </xsl:element>
            
            <xsl:for-each select="COL[6]/DATA[1]">
                <xsl:choose>

                    <!-- [?] -->
                    <xsl:when test="contains(./text(),'[?]')">
                        <xsl:choose>

                            <!-- date range YYYY - YYYY [?]-->
                            <xsl:when test="matches(.,&quot;\d{4}\s{1}.{1}\s{1}\d{4}&quot;)">
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(./text(),'-'))"/>
                                </xsl:element>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">end</xsl:attribute>
                                    <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after(./text(),'-'), '['))"
                                    />
                                </xsl:element>
                            </xsl:when>

                            <!-- date range YYYY-YYYY [?]-->
                            <xsl:when test="matches(.,&quot;\d{4}.{1}\d{4}&quot;)">
                               <!-- date range ca. YYYY-YYYY [?] -->
                                <xsl:choose>
                                    <xsl:when test="matches(./text(),'ca.')">
                                        <xsl:element name="dateCreated" inherit-namespaces="no">
                                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                            <xsl:attribute name="point">start</xsl:attribute>
                                            <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                            <xsl:attribute name="keyDate">yes</xsl:attribute>
                                            <xsl:value-of
                                                select="normalize-space(substring-after(substring-before(./text(),'-'),'ca.'))"/>
                                        </xsl:element>
                                        <xsl:element name="dateCreated" inherit-namespaces="no">
                                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                            <xsl:attribute name="point">end</xsl:attribute>
                                            <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                            <xsl:value-of
                                                select="normalize-space(substring-before(substring-after(./text(),'-'), '['))"/>
                                        </xsl:element>
                                    </xsl:when>

                                <xsl:otherwise>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(./text(),'-'))"/>
                                </xsl:element>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">end</xsl:attribute>
                                    <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after(./text(),'-'), '['))"/>
                                </xsl:element>
                                </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            
                            <!-- ca. YYYY [?] -->
                            <xsl:when test="matches(.,'ca.')">
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-after(substring-before(./text(),'['),'ca.'))"/>
                                </xsl:element>
                            </xsl:when>

                            <xsl:otherwise>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:attribute name="qualifier">inferred</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(./text(),'[?]'))"/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <!-- dates with ca. -->
                    <xsl:when test="contains(./text(),'ca.')">

                        <xsl:choose>
                            <!-- date range ca. YYYY - YYYY-->
                            <xsl:when test="matches(.,&quot;\d{4}\s*.{1}\s*\d{4}&quot;)">
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after(./text(),'ca.'), '-'))"
                                    />
                                </xsl:element>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">end</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-after(./text(),'-'))"/>
                                </xsl:element>
                            </xsl:when>
                            <!-- ca. YYYY-MM - YYYY-MM -->
                            <xsl:when
                                test="matches(.,&quot;\d{4}.{1}\d{2}\s{1}.{1}\s{1}\d{4}.{1}\d{2}&quot;)">
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after(./text(),'ca.'), ' - '))"
                                    />
                                </xsl:element>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">end</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-after(./text(),'- '))"/>
                                </xsl:element>
                            </xsl:when>
                            <!-- ca. YYYY-YYYY-->
                            <xsl:when test="matches(.,&quot;\d{4}.{1}\d{4}&quot;)">
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after(./text(),'ca.'), '-'))"
                                    />
                                </xsl:element>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">end</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-after(./text(),'-'))"/>
                                </xsl:element>
                            </xsl:when>

                            <!-- ca. YYYY - YYYY -->
                            <xsl:when test="matches(.,&quot;\d{4}\s{1}.{1}\s{1}\d{4}&quot;)">
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">start</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after(./text(),'ca.'), '-'))"
                                    />
                                </xsl:element>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="point">end</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-after(./text(),'-'))"/>
                                </xsl:element>
                            </xsl:when>

                            <!-- ca. YYYY -->
                            <xsl:otherwise>
                                <xsl:element name="dateCreated" inherit-namespaces="no">
                                    <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                                    <xsl:attribute name="keyDate">yes</xsl:attribute>
                                    <xsl:attribute name="qualifier">approximate</xsl:attribute>
                                    <xsl:value-of
                                        select="normalize-space(substring-after(./text(),'ca.'))"/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <!-- YYYY-MM-DD - YYYY-MM-DD -->
                    <xsl:when
                        test="matches(.,&quot;\d{4}.{1}\d{2}.{1}\d{2}\s{1}.{1}\s{1}\d{4}.{1}\d{2}.{1}\d{2}&quot;)">
                        <xsl:element name="dateCreated" inherit-namespaces="no">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:attribute name="point">start</xsl:attribute>
                            <xsl:attribute name="keyDate">yes</xsl:attribute>
                            <xsl:value-of
                                select="normalize-space(substring-before(./text(),' - '))"/>
                        </xsl:element>
                        <xsl:element name="dateCreated" inherit-namespaces="no">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:attribute name="point">end</xsl:attribute>
                            <xsl:value-of select="normalize-space(substring-after(./text(),' - '))"/>
                        </xsl:element>
                    </xsl:when>
                    
                    <!-- YYYY-YYYY -->
                    <xsl:when
                        test="matches(.,&quot;\d{4}.{1}\d{4}&quot;)">
                        <xsl:element name="dateCreated" inherit-namespaces="no">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:attribute name="point">start</xsl:attribute>
                            <xsl:attribute name="keyDate">yes</xsl:attribute>
                            <xsl:value-of
                                select="normalize-space(substring-before(./text(),'-'))"/>
                        </xsl:element>
                        <xsl:element name="dateCreated" inherit-namespaces="no">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:attribute name="point">end</xsl:attribute>
                            <xsl:value-of select="normalize-space(substring-after(./text(),'-'))"/>
                        </xsl:element>
                    </xsl:when>
                    

                    <!-- otherwise, use value in FileMaker field -->

                    <xsl:otherwise>
                        <xsl:element name="dateCreated" inherit-namespaces="no">
                            <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                            <xsl:attribute name="keyDate">yes</xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:element>

    </xsl:template>
</xsl:stylesheet>
