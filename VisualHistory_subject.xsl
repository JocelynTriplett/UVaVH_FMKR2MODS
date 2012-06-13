<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>






    <xsl:template name="subject">
        <!-- Geographical Term added to all records -->
        <xsl:element name="subject" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">tgn</xsl:attribute>
            <xsl:element name="hierarchicalGeographic">
                <xsl:element name="country">United States</xsl:element>
                <xsl:element name="state">Virginia</xsl:element>
                <xsl:element name="city">Charlottesville</xsl:element>
            </xsl:element>
        </xsl:element>
        
        <!-- UVa added to all records -->
        <xsl:element name="subject" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">lcsh</xsl:attribute>
            <xsl:element name="name">
                <xsl:attribute name="type">corporate</xsl:attribute>
                <xsl:attribute name="authority">naf</xsl:attribute>
                <xsl:element name="namePart">
                    <xsl:text>University of Virginia</xsl:text>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
        
        <xsl:for-each select="COL[8]/DATA[1]">
            <!-- Creates Subjects from Genre Terms -->
            
            <!-- Genre Term = Rotunda -->

            <xsl:if test="contains(./text(),'Rotunda')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="topic">
                        <xsl:text>University of Virginia Rotunda (Charlottesville, Va.)</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = UVa Faculty/Student -->

            <xsl:if test="contains(./text(),'UVa Faculty/Student')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Faculty</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:if test="contains(./text(),'UVa Faculty/Student')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Students</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Uva Faculty/Student -->

            <xsl:if test="contains(./text(),'Uva Faculty/Student')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Faculty</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:if test="contains(./text(),'Uva Faculty/Student')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Students</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = holsinger -->

            <xsl:if test="contains(./text(),'holsinger')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>Holsinger's Studio (Charlottesville, Va.)</xsl:text>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">personal</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>Holsinger, Rufus W.</xsl:text>
                        </xsl:element>
                        <xsl:element name="namePart">
                            <xsl:attribute name="type">date</xsl:attribute>
                            <xsl:text>1866-1930</xsl:text>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Athletics -->

            <xsl:if test="contains(./text(),'Athletics')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Sports</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = athletics -->

            <xsl:if test="contains(./text(),'athletics')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Sports</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = portrait -->

            <xsl:if test="contains(./text(),'portrait')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="topic">
                        <xsl:text>Portraits</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Health Sciences -->

            <xsl:if test="contains(./text(),'Health Sciences')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">
                        <xsl:text>Health System</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = News -->

            <xsl:if test="contains(./text(),'News')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia. News Office</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="topic">Press coverage</xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Virginia -->

            <xsl:if test="contains(./text(),'Virginia')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="geographic">
                        <xsl:text>Virginia</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Nursing -->

            <xsl:if test="contains(./text(),'Nursing')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="name">
                        <xsl:attribute name="type">corporate</xsl:attribute>
                        <xsl:attribute name="authority">naf</xsl:attribute>
                        <xsl:element name="namePart">
                            <xsl:text>University of Virginia. School of Nursing</xsl:text>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Community/Outreach -->

            <xsl:if test="contains(./text(),'Community/Outreach')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="topic">
                        <xsl:text>Community and College</xsl:text>
                    </xsl:element>
                    <xsl:element name="geographic">
                        <xsl:text>Virginia</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

            <!-- Genre Term = Charlottesville -->

            <xsl:if test="contains(./text(),'Charlottesville')">
                <xsl:element name="subject" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="authority">lcsh</xsl:attribute>
                    <xsl:element name="geographic">
                        <xsl:text>Charlottesville (Va.)</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
