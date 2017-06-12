# tbx2solrschema
A XSLT file to convert from IATE TBX format to Solr XML schema.

IATE glossary donwload: http://iate.europa.eu/tbxPageDownload.do
Solr XML schema: https://wiki.apache.org/solr/UpdateXmlMessages#XML_Messages_for_Updating_a_Solr_Index

Usage:
Create de xml file:
java -jar xalan.jar  -IN [TBX-FILE] -XSL glossary.xsl -OUT [NEW FILE].xml

Add the new indexes to Solr:
bin/post -c [CORE_NAME] [NEW FILE].xml
