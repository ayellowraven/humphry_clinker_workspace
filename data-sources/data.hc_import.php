<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcehc_import extends DynamicXMLDatasource{

		public $dsParamROOTELEMENT = 'hc-import';
		public $dsParamURL = 'http://projects.enguin.com/hc.xml';
		public $dsParamXPATH = '//letter';
		public $dsParamCACHE = '1';
		public $dsParamTIMEOUT = '6';
		

		

		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'hc import',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/humphrey_clinker',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-05T22:30:15+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
