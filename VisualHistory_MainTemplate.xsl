<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:include href="VisualHistory_name.xsl"/>
    <!-- creates "name" and all subelements -->
    <xsl:include href="VisualHistory_originInfo.xsl"/>
    <!-- creates "originInfo" and all subelements -->
    <xsl:include href="VisualHistory_physicalDescription.xsl"/>
    <!-- creates "physicalDescription" and all subelements -->
    <xsl:include href="VisualHistory_subject.xsl"/>
    <!-- creates "subject" and all subelements -->

    <xsl:template match="/">
        <xsl:for-each select="/FMPXMLRESULT/RESULTSET/ROW/COL[10]/DATA[1]">
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
        <xsl:call-template name="titleInfo"/>
        <xsl:call-template name="name"/>
        <xsl:call-template name="typeOfResource"/>
        <xsl:call-template name="genre"/>
        <xsl:call-template name="printsNumber"/>
        <xsl:call-template name="accessionNumber"/>
        <xsl:call-template name="originInfo"/>
        <xsl:call-template name="location"/>
        <xsl:call-template name="accessCondition"/>
        <xsl:call-template name="abstract"/>
        <xsl:call-template name="physicalDescription"/>
        <xsl:call-template name="note"/>
        <xsl:call-template name="legacyAccessionNumber"/>
        <xsl:call-template name="subject"/>
        <xsl:call-template name="relatedItem"/>
        <xsl:call-template name="publication"/>
        <xsl:call-template name="recordInfo"/>
    </xsl:template>

    <xsl:template name="titleInfo">
        <xsl:element name="titleInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="title" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="COL[21]/DATA[1]"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="printsNumber">
        <xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">legacy</xsl:attribute>
            <xsl:attribute name="displayLabel">Prints Number</xsl:attribute>
            <xsl:value-of select="COL[10]/DATA[1]"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="accessionNumber">
        <xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">accessionNumber</xsl:attribute>
            <xsl:value-of>RG-30/1/10.011</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <xsl:template name="legacyAccessionNumber">
        <xsl:for-each select="COL[1]/DATA[1]">
            <xsl:if test="./text()">
                <xsl:element name="identifier" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">LegacyAccessionNumber</xsl:attribute>
                    <xsl:attribute name="displayLabel">Originating Collection</xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


    <xsl:template name="location">
        <xsl:element name="location" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="physicalLocation" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:for-each select="COL[19]/DATA[1]">
                    <xsl:if test="./text()='Alumni Hall'">
                        <xsl:text>Alumni Association, University of Virginia, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='CNHI'">
                        <xsl:text>Center for Nursing Historical Inquiry, University of Virginia School of Nursing, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='Health Sciences'">
                        <xsl:text>Historical Collections &amp; Services, Claude Moore Health Sciences Library, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='Law Library Special Collections'">
                        <xsl:text>Special Collections, Arthur J. Morris Law Library, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='News Services'">
                        <xsl:text>Media Relations, University of Virginia Office of Public Affairs, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='Provost Office'">
                        <xsl:text>Office of the Executive Vice President and Provost, University of Virginia, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='Special Collections'">
                        <xsl:text>Special Collections, University of Virginia Library, Charlottesville, Va.</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="accessCondition">
        <xsl:for-each select="COL[18]/DATA[1]">
            <xsl:element name="accessCondition" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">restrictionOnAccess</xsl:attribute>
                <xsl:attribute name="displayLabel">Access to the Collection</xsl:attribute>
                <xsl:value-of>RESTRICTED</xsl:value-of>
            </xsl:element>
            <xsl:element name="accessCondition" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">useAndReproduction</xsl:attribute>
                <xsl:attribute name="displayLabel">Use and Reproduction</xsl:attribute>
                <xsl:choose>
                    <xsl:when test="(. = '')">
                        <xsl:value-of>This image may be reproduced without additional permission but
                            must be credited © Rector and Visitors of the University of
                            Virginia</xsl:value-of>
                    </xsl:when>
                    <xsl:when test="contains(./text(),'None')">
                        <xsl:value-of>This image may be reproduced without additional permission but
                            must be credited © Rector and Visitors of the University of
                            Virginia</xsl:value-of>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="abstract">
        <xsl:element name="abstract" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:value-of select="COL[3]/DATA[1]"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="note">
        <xsl:element name="note" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">admin</xsl:attribute>
            <xsl:value-of select="COL[2]/DATA[1]"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="relatedItem">
        <xsl:element name="relatedItem" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">series</xsl:attribute>
            <xsl:attribute name="displayLabel">Part of</xsl:attribute>
            <xsl:element name="titleInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:element name="nonSort" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">The</xsl:element>
                <xsl:element name="title" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3"
                    >University of Virginia Visual History Collection</xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="publication">
        <xsl:for-each select="COL[17]/DATA[1]">
            <xsl:choose>
                <xsl:when test="./text()">
                    <xsl:element name="relatedItem" inherit-namespaces="no"
                        xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">series</xsl:attribute>
                        <xsl:attribute name="displayLabel">Appears in</xsl:attribute>
                        <xsl:element name="titleInfo" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:element name="title" inherit-namespaces="no"
                                xmlns="http://www.loc.gov/mods/v3">
                                <xsl:value-of select="COL[17]/DATA[1]"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="part">
                            <xsl:element name="detail">
                                <xsl:attribute name="type">volume</xsl:attribute>
                                <xsl:element name="number">
                                    <xsl:value-of select="COL[22]/DATA[1]"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="detail">
                                <xsl:attribute name="type">issue</xsl:attribute>
                                <xsl:element name="number">
                                    <xsl:value-of select="COL[11]/DATA[1]"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="recordInfo">
        <xsl:variable name="timeStamp" select="date:new()"/>
        <xsl:element name="recordInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="recordContentSource" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">marcorg</xsl:attribute>
                <xsl:text>viu</xsl:text>
            </xsl:element>
            <xsl:element name="recordOrigin" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:text>Created programmatically by Digital Curation Services.</xsl:text>
            </xsl:element>
            <xsl:element name="languageOfCataloging" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:element name="languageTerm" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">code</xsl:attribute>
                    <xsl:attribute name="authority">rfc3066</xsl:attribute>
                    <xsl:text>en</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:element name="recordCreationDate" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                <xsl:value-of select="$timeStamp"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="typeOfResource">
        <xsl:element name="typeOfResource" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="collection">yes</xsl:attribute>
            <xsl:text>still image</xsl:text>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
