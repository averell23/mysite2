<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : downloadlist.xsl
    Created on : 12. Oktober 2003, 13:12
    Author     : daniel
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
        
    <xsl:template match="/">
        <div id="mainbody">
            <h4><xsl:value-of select="downloadlist/title"/></h4>
            <xsl:apply-templates select="downloadlist/introduction" />
            <xsl:apply-templates select="downloadlist/item" />
        </div>
    </xsl:template>
    
    <!-- Matches the individual items -->
    <xsl:template match="item">
        <div class="entry-header">
            <xsl:value-of select="title" />
        </div>
        <div class="entry">
            <xsl:apply-templates select="description" />
        </div>
        <div class="entry-footer">
            <xsl:apply-templates select="link" />
        </div>
     </xsl:template>
     
     <!-- Matches the description -->
     <xsl:template match="description">
        <xsl:apply-templates />
     </xsl:template>
     
     
    <!-- Matches the links -->
    <xsl:template match="link">
        [<xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>]
    </xsl:template>
    
    <!-- Matches the <b> tags -->
    <xsl:template match="b">
        <b><xsl:apply-templates /></b>
    </xsl:template>
    
    <!-- Matches the <i> tags -->
    <xsl:template match="i">
        <i><xsl:apply-templates /></i>
    </xsl:template>
    
    <!-- Matches the <p> tags -->
    <xsl:template match="p">
        <div class="entry-part">
        <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <!-- Matches the a tags -->
    <xsl:template match="a">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@href" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <!-- Matches text fields (for the inline elements -->
    <xsl:template match="text()">
        <xsl:value-of select="." />
    </xsl:template>

</xsl:stylesheet> 