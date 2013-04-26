<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceapi_current_character_chapters extends SectionDatasource {

		public $dsParamROOTELEMENT = 'api-current-character-chapters';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'16' => '{$ds-api-current-character}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'order',
				'date',
				'title',
				'from-location'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-api-current-character');
		}

		public function about() {
			return array(
				'name' => 'API: Current Character: Chapters',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/humphrey_clinker',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-04-15T01:18:43+00:00'
			);
		}

		public function getSource() {
			return '1';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
