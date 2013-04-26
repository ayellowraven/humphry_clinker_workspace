<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceapi_search_chapters extends SectionDatasource {

		public $dsParamROOTELEMENT = 'api-search-chapters';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'id' => '{$ds-elasticsearch}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'order',
				'date',
				'title',
				'from',
				'from-location'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-elasticsearch');
		}

		public function about() {
			return array(
				'name' => 'API: Search: Chapters',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/humphrey_clinker',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-04-14T22:07:16+00:00'
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
