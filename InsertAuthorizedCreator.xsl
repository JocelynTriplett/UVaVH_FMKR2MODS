<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:param name="FileMakerFileName">VHD-sample.xml</xsl:param>
    <xsl:param name="AuthorizedNames">
        <xsl:value-of select="false()"/>
    </xsl:param>
    
    <xsl:template match="/">
        <xsl:for-each select="/FMPXMLRESULT/RESULTSET/ROW/COL[10]/DATA[1]">
            <xsl:variable name="printsNumber" select="./text()"/>
            <xsl:variable name="filename" select="concat(./text(),'.mods','.xml')"/>
            <xsl:value-of select="$filename"/>
            <!-- Creating  -->
            <xsl:result-document href="{$filename}" format="xml">
                <mods xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-3.xsd"
                    xmlns:mods="http://www.loc.gov/mods/v3" xmlns="http://www.loc.gov/mods/v3">
                    
                    <!-- hand off processing of row to another template -->
                    <xsl:apply-templates select="./ancestor::ROW"/>
                </mods>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ROW">
        <!-- here is where all the construction of the mods record takes place -->
        <xsl:call-template name="name"/>
    </xsl:template>


 <xsl:template name="name">
         <xsl:variable name="name">
            <xsl:value-of select="COL[16]/DATA[1]"/>
        </xsl:variable>
        <xsl:variable name="printsNumber">
            <xsl:value-of select="COL[10]/DATA[1]"/>
        </xsl:variable>
        <xsl:element name="name" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">personal</xsl:attribute>
            <xsl:element name="namePart" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:choose>
                    <xsl:when
                        test="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row/ss:Cell[1]/ss:Data/text(),$printsNumber">
                        <xsl:variable name="authority">
                            <xsl:value-of select="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row[ss:Cell[1]/ss:Data/text()=$printsNumber]/ss:Cell[4]/ss:Data/text()"/>
                        </xsl:variable>
                        <xsl:attribute name="authority">
                            <xsl:value-of select="$authority"/>
                        </xsl:attribute>
                        <xsl:value-of select="document($AuthorizedNames)/ss:Workbook/ss:Worksheet/ss:Table/ss:Row[ss:Cell[1]/ss:Data/text()=$printsNumber]/ss:Cell[3]/ss:Data/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
