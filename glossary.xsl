<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<add> 
 
    <xsl:for-each select="martif/text/body/termEntry">
      <doc>
        <field name='id'><xsl:value-of select="@id" /></field>
        <field name='subject'><xsl:value-of select="descripGrp/descrip" /></field>
        <xsl:for-each select="langSet[@xml:lang='es']">
          <xsl:for-each select="tig">
            <field name='term_es'><xsl:value-of select="term"/></field>
          </xsl:for-each>
        </xsl:for-each>
      
        <xsl:for-each select="langSet[@xml:lang='en']">
          <xsl:for-each select="tig">
            <field name='term_en'><xsl:value-of select="term"/></field>
          </xsl:for-each>
        </xsl:for-each>
      
      </doc>
    </xsl:for-each>

</add>
</xsl:template>
</xsl:stylesheet>

