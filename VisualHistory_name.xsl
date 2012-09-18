<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:date="java:java.util.Date">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>


    <!-- Set Authorized Names XML file as parameter -->
    <xsl:param name="AuthorizedNames">
        <xsl:value-of>AuthorizedNames.xml</xsl:value-of>
    </xsl:param>

    <!-- <xsl:template name="name">
        <xsl:element name="name" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">personal</xsl:attribute>
            <xsl:element name="namePart" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="COL[16]/DATA[1]"/>
            </xsl:element> -->

    <xsl:template name="name">
        <xsl:variable name="name">
            <xsl:value-of select="COL[16]/DATA[1]"/>
        </xsl:variable>
        <xsl:variable name="printsNumber">
            <xsl:value-of select="COL[10]/DATA[1]"/>
        </xsl:variable>
        <xsl:element name="name" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:choose>
            <xsl:when
                test="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row/ss:Cell[1]/ss:Data/text(),$printsNumber">
                <xsl:variable name="authority">
                    <xsl:value-of select="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row[ss:Cell[1]/ss:Data/text()=$printsNumber]/ss:Cell[4]/ss:Data/text()"/>
                </xsl:variable>
                <xsl:attribute name="authority">
                    <xsl:value-of select="$authority"/>
                </xsl:attribute>
                <xsl:variable name="type">
                    <xsl:value-of select="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row[ss:Cell[1]/ss:Data/text()=$printsNumber]/ss:Cell[5]/ss:Data/text()"></xsl:value-of>
                </xsl:variable>
                <xsl:attribute name="type">
                    <xsl:value-of select="$type"/>
                </xsl:attribute>
            </xsl:when>
            </xsl:choose>
            <xsl:element name="namePart" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:choose>
                    <xsl:when
                        test="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row/ss:Cell[1]/ss:Data/text(),$printsNumber">
                        <xsl:value-of select="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row[ss:Cell[1]/ss:Data/text()=$printsNumber]/ss:Cell[3]/ss:Data/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>

            <xsl:element name="role" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:element name="roleTerm" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">text</xsl:attribute>
                    <xsl:attribute name="authority">marcrelator</xsl:attribute>
                    <xsl:for-each select="COL[7]/DATA[1]">
                        <xsl:if test="./text()='albumen'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='aquatint'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='artifact'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='b&amp;w negative'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='b&amp;w photo'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='b&amp;w transparency'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='collotype'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='color negative'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='color photo'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='color transparency'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='contact print'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='cyanotype'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='digitally born'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='engraving'">
                            <xsl:text>engraver</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='etching'">
                            <xsl:text>etcher</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='fac-simile'">
                            <xsl:text>facsimilist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='gelatin printing-out paper'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='gelatin silver print'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='glass plate b&amp;w negative'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='half tone'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='line drawing'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='lithograph'">
                            <xsl:text>lithographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='negative'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='newspaper print'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='original painting'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='pen &amp; ink'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='photocopy'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='photogravure'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='postcard'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='salted paper print'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='sepia'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='silhouette'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='sketch'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='stipple engraving'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='transparency'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='unknown'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='watercolor'">
                            <xsl:text>artist</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='woodcut'">
                            <xsl:text>woodcutter</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='Edit...'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='mezzotint'">
                            <xsl:text>photographer</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
                <xsl:element name="roleTerm" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">code</xsl:attribute>
                    <xsl:attribute name="authority">marcrelator</xsl:attribute>
                    <xsl:for-each select="COL[7]/DATA[1]">
                        <xsl:if test="./text()='albumen'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='aquatint'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='artifact'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='b&amp;w negative'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='b&amp;w photo'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='b&amp;w transparency'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='collotype'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='color negative'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='color photo'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='color transparency'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='contact print'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='cyanotype'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='digitally born'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='engraving'">
                            <xsl:text>egr</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='etching'">
                            <xsl:text>etr</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='fac-simile'">
                            <xsl:text>fac</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='gelatin printing-out paper'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='gelatin silver print'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='glass plate b&amp;w negative'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='half tone'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='line drawing'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='lithograph'">
                            <xsl:text>ltg</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='negative'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='newspaper print'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='original painting'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='pen &amp; ink'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='photocopy'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='photogravure'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='postcard'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='salted paper print'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='sepia'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='silhouette'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='sketch'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='stipple engraving'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='transparency'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='unknown'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='watercolor'">
                            <xsl:text>art</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='woodcut'">
                            <xsl:text>wdc</xsl:text>
                        </xsl:if>
                        <xsl:if test="./text()='Edit...'">
                            <xsl:text/>
                        </xsl:if>
                        <xsl:if test="./text()='mezzotint'">
                            <xsl:text>pht</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
