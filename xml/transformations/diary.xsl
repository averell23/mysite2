<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : diary.xsl
    Created on : 8. Juli 2003, 20:30
    Author     : daniel
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="html"/>

    <xsl:template match="/">
        <div id="mainbody">
            <xsl:apply-templates select="diary/entry" />
        </div>
    </xsl:template>

    
    <!-- Template to create a single diary entry -->
    <xsl:template match="entry">
        <div class="entry-header">
            <xsl:value-of select="@date" />
        </div>
        <xsl:if test="@image">
            <div class="sideitem">
                <xsl:element name="img">
                    <xsl:attribute name="alt"><xsl:value-of select="@alt" /></xsl:attribute>
                    <xsl:attribute name="src">pictures/<xsl:value-of select="@image" />.png</xsl:attribute>
                    <xsl:attribute name="style">width: 100%</xsl:attribute>
                </xsl:element>
            </div>
        </xsl:if>
        <div class="entry">
            <xsl:apply-templates />
        </div>
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
    
    <!-- Matches text fields (for the inline elements -->
    <xsl:template match="text()">
        <xsl:value-of select="." />
    </xsl:template>
    
</xsl:stylesheet> 
