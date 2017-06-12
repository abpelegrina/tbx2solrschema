# tbx2solrschema
A XSLT file to convert from IATE TBX format to Solr XML schema.

The schema of the output file is:

<?xml version="1.0" encoding="UTF-8"?>
  <add>
    <doc>
      <field name="id">IATE-id</field>
      <field name="subject">[list of IATE domains IDs separated by commas]</field>
      <field name="term_es">[Spanish term - MULTIVALUED]</field>
      <field name="term_eN">[English term - MULTIVALUED]</field>
    </doc>
 </add>

IATE glossary donwload: http://iate.europa.eu/tbxPageDownload.do
Solr XML schema: https://wiki.apache.org/solr/UpdateXmlMessages#XML_Messages_for_Updating_a_Solr_Index

Usage:
* Create de xml file:
java -jar xalan.jar  -IN [TBX-FILE] -XSL glossary.xsl -OUT [NEW FILE].xml

* Add the new indexes to Solr:
bin/post -c [CORE_NAME] [NEW FILE].xml
