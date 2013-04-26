<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceapi_current_character extends SectionDatasource {

		public $dsParamROOTELEMENT = 'api-current-character';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'system:id'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'id' => '{$url-id}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'bio: formatted',
				'Spoiler: formatted',
				'type'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'API: Current Character',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/humphrey_clinker',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-04-15T01:29:04+00:00'
			);
		}

		public function getSource() {
			return '3';
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
