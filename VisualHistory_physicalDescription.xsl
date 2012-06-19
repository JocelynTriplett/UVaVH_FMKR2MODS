<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>

    <xsl:template name="genre">
        <xsl:element name="genre" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">aat</xsl:attribute>
            <xsl:for-each select="COL[7]/DATA[1]">
                <xsl:if test="./text()='albumen'">
                    <xsl:text>albumen prints</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='aquatint'">
                    <xsl:text>aquatints (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='artifact'">
                    <xsl:text>artifacts</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='b&amp;w negative'">
                    <xsl:text>black-and-white negatives</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='b&amp;w photo'">
                    <xsl:text>black-and-white photographs</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='b&amp;w transparency'">
                    <xsl:text>black-and-white transparencies</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='collotype'">
                    <xsl:text>collotypes (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='color negative'">
                    <xsl:text>color negatives</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='color photo'">
                    <xsl:text>color photographs</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='color transparency'">
                    <xsl:text>color transparencies</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='contact print'">
                    <xsl:text>contact prints</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='cyanotype'">
                    <xsl:text>cyanotypes</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='digitally born'">
                    <xsl:text>digital images</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='engraving'">
                    <xsl:text>engravings (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='etching'">
                    <xsl:text>relief etchings (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='fac-simile'">
                    <xsl:text>facsimiles (reproductions)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='gelatin printing-out paper'">
                    <xsl:text/>
                </xsl:if>
                <xsl:if test="./text()='gelatin silver print'">
                    <xsl:text>gelatin silver prints</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='glass plate b&amp;w negative'">
                    <xsl:text/>
                </xsl:if>
                <xsl:if test="./text()='half tone'">
                    <xsl:text>relief halftones (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='line drawing'">
                    <xsl:text>line drawings (drawings)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='lithograph'">
                    <xsl:text>lithographs</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='negative'">
                    <xsl:text>negatives (photographic)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='newspaper print'">
                    <xsl:text>news photographs</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='original painting'">
                    <xsl:text>paintings (visual works)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='pen &amp; ink'">
                    <xsl:text/>
                </xsl:if>
                <xsl:if test="./text()='photocopy'">
                    <xsl:text>photocopies</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='photogravure'">
                    <xsl:text>photogravures (prints) </xsl:text>
                </xsl:if>
                <xsl:if test="./text()='postcard'">
                    <xsl:text>postcards</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='salted paper print'">
                    <xsl:text>salted paper prints</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='sepia'">
                    <xsl:text>sepia prints</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='silhouette'">
                    <xsl:text>silhouettes</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='sketch'">
                    <xsl:text>sketches</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='stipple engraving'">
                    <xsl:text>stipple engravings (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='transparency'">
                    <xsl:text>transparencies</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='unknown'">
                    <xsl:text/>
                </xsl:if>
                <xsl:if test="./text()='watercolor'">
                    <xsl:text>watercolors (paintings)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='woodcut'">
                    <xsl:text>woodcuts (prints)</xsl:text>
                </xsl:if>
                <xsl:if test="./text()='Edit...'">
                    <xsl:text/>
                </xsl:if>
                <xsl:if test="./text()='mezzotint'">
                    <xsl:text>mezzotints (prints)</xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="physicalDescription">
        <xsl:element name="physicalDescription" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="form" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">aat</xsl:attribute>
                <xsl:for-each select="COL[7]/DATA[1]">
                    <xsl:if test="./text()='albumen'">
                        <xsl:text>albumen prints</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='aquatint'">
                        <xsl:text>aquatints (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='artifact'">
                        <xsl:text>artifacts</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='b&amp;w negative'">
                        <xsl:text>black-and-white negatives</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='b&amp;w photo'">
                        <xsl:text>black-and-white photographs</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='b&amp;w transparency'">
                        <xsl:text>black-and-white transparencies</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='collotype'">
                        <xsl:text>collotypes (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='color negative'">
                        <xsl:text>color negatives</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='color photo'">
                        <xsl:text>color photographs</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='color transparency'">
                        <xsl:text>color transparencies</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='contact print'">
                        <xsl:text>contact prints</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='cyanotype'">
                        <xsl:text>cyanotypes</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='digitally born'">
                        <xsl:text>digital images</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='engraving'">
                        <xsl:text>engravings (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='etching'">
                        <xsl:text>relief etchings (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='fac-simile'">
                        <xsl:text>facsimiles (reproductions)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='gelatin printing-out paper'">
                        <xsl:text/>
                    </xsl:if>
                    <xsl:if test="./text()='gelatin silver print'">
                        <xsl:text>gelatin silver prints</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='glass plate b&amp;w negative'">
                        <xsl:text/>
                    </xsl:if>
                    <xsl:if test="./text()='half tone'">
                        <xsl:text>relief halftones (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='line drawing'">
                        <xsl:text>line drawings (drawings)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='lithograph'">
                        <xsl:text>lithographs</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='negative'">
                        <xsl:text>negatives (photographic)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='newspaper print'">
                        <xsl:text>news photographs</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='original painting'">
                        <xsl:text>paintings (visual works)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='pen &amp; ink'">
                        <xsl:text/>
                    </xsl:if>
                    <xsl:if test="./text()='photocopy'">
                        <xsl:text>photocopies</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='photogravure'">
                        <xsl:text>photogravures (prints) </xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='postcard'">
                        <xsl:text>postcards</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='salted paper print'">
                        <xsl:text>salted paper prints</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='sepia'">
                        <xsl:text>sepia prints</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='silhouette'">
                        <xsl:text>silhouettes</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='sketch'">
                        <xsl:text>sketches</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='stipple engraving'">
                        <xsl:text>stipple engravings (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='transparency'">
                        <xsl:text>transparencies</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='unknown'">
                        <xsl:text/>
                    </xsl:if>
                    <xsl:if test="./text()='watercolor'">
                        <xsl:text>watercolors (paintings)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='woodcut'">
                        <xsl:text>woodcuts (prints)</xsl:text>
                    </xsl:if>
                    <xsl:if test="./text()='Edit...'">
                        <xsl:text/>
                    </xsl:if>
                    <xsl:if test="./text()='mezzotint'">
                        <xsl:text>mezzotints (prints)</xsl:text>
                    </xsl:if>
                </xsl:for-each>

                <!-- digitalOrigin -->

            </xsl:element>
            <xsl:element name="digitalOrigin" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:text>reformatted digital</xsl:text>
            </xsl:element>

            <!-- internetMediaType -->

            <xsl:element name="internetMediaType" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:text>image/tiff</xsl:text>
            </xsl:element>

            <!-- Staff Note -->

            <xsl:for-each select="COL[15]/DATA[1]">
                <xsl:if test="'yes'">
                    <xsl:element name="note" inherit-namespaces="no"
                        xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="displayLabel">Staff Note</xsl:attribute>
                        <xsl:text>Original Negative Present</xsl:text>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>

            <!-- Copy Negative Present? -->

            <xsl:element name="note" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="displayLabel">Copy Negative</xsl:attribute>
                <xsl:value-of select="COL[4]/DATA[1]"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>