# tbx2solrschema
A XSLT file to convert from IATE TBX format to Solr XML schema. Currently only extracts spanish and english terms, but can be easily extended to include other languages.

The schema of the output file is:

```xml
<?xml version="1.0" encoding="UTF-8"?>
  <add>
    <doc>
      <field name="id">IATE-id</field>
      <field name="subject">[list of IATE domains IDs separated by commas]</field>
      <field name="term_es">[Spanish term - MULTIVALUED]</field>
      <field name="term_en">[English term - MULTIVALUED]</field>
    </doc>
 </add>
```

## Usage
* Create de XML file:
```
java -jar xalan.jar  -IN [TBX-FILE] -XSL glossary.xsl -OUT [NEW FILE].xml
```
* Add the new indexes to Solr:
```
bin/post -c [CORE_NAME] [NEW FILE].xml
```

## Supporting new languages
To add new languages to the output file, you have to add a new selector that matches your desired language. For example, to extract french terms:

```xslt
<xsl:for-each select="langSet[@xml:lang='fr']">
  <xsl:for-each select="tig">
    <field name='term_fr'><xsl:value-of select="term"/></field>
   </xsl:for-each>
</xsl:for-each>
```

## More info and downloads
* IATE glossary download: http://iate.europa.eu/tbxPageDownload.do
* Solr XML schema: https://wiki.apache.org/solr/UpdateXmlMessages#XML_Messages_for_Updating_a_Solr_Index
* Xalan: https://xml.apache.org/xalan-j/
