<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
    
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="mods"
        indent="yes"/>
    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:template match="/">
        <xsl:for-each select="/ss:Workbook/ss:Worksheet/ss:Table/ss:Row">
            <xsl:variable name="printsNumber" select="(ss:Cell[1]/ss:Data/text())"/>          
            <xsl:variable name="creator" select="(ss:Cell[3]/ss:Data/text())"/>
            <xsl:variable name="authority" select="(ss:Cell[4]/ss:Data/text())"/>
            <mods xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="filename">
                <xsl:value-of select="$printsNumber"/>
            </xsl:element>
            <xsl:element name="name">
                <xsl:attribute name="authority">
                    <xsl:value-of select="$authority"/>
                </xsl:attribute>
                <xsl:value-of select="$creator"/>
            
            </xsl:element>
            </mods>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
