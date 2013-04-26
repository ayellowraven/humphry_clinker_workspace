<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterHcImport extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'HC import',
				'author'		=> array(
					'name'			=> 'Bernard Yu',
					'email'			=> 'bernard@enguin.com'
				),
				'description'	=> '',
				'file'			=> __FILE__,
				'created'		=> '2013-03-05T20:55:19+00:00',
				'updated'		=> '2013-03-05T23:43:30+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'yes',
				'fields'			=> array (
  0 => 
  array (
    'field' => '18',
    'xpath' => 'chapter/@id',
    'php' => '',
  ),
  1 => 
  array (
    'field' => '13',
    'xpath' => 'title/@title',
    'php' => '',
  ),
  2 => 
  array (
    'field' => '5',
    'xpath' => 'contents/text()',
    'php' => '',
  ),
),
				'included-elements'	=> '//letter',
				'namespaces'		=> array (
  0 => 
  array (
    'name' => 'xsl',
    'uri' => 'http://www.w3.org/1999/XSL/Transform',
  ),
),
				'source'			=> 'http://projects.enguin.com/humphrey_clinker/import/',
				'timeout'			=> '60',
				'section'			=> '1',
				'unique-field'		=> '18'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

