<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : linklist.xsl
    Created on : 12. Oktober 2003, 13:01
    Author     : daniel
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
        
    <xsl:template match="/">
        <div id="mainbody">
            <xsl:apply-templates select="linklist/group" />
        </div>
    </xsl:template>
    
    <!-- Matches the group entries -->
    <xsl:template match="group">
        <h1><xsl:value-of select="@name" /></h1>
        <xsl:apply-templates select="link" />
    </xsl:template>
    
    <!-- Matches the individual links -->
    <xsl:template match="link">
        <div class="entry-header">
            <xsl:value-of select="name" />
        </div>
        <div class="entry">
            <xsl:apply-templates select="description"/>
        </div>
        <div class="entry-footer">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="@target"/>
                </xsl:attribute>
                >> Show me
            </xsl:element>
        </div>
     </xsl:template>
     
     <!-- Matches the description -->
     <xsl:template match="description">
        <xsl:apply-templates />
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
