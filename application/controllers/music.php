<?php defined('SYSPATH') OR die('No direct access allowed.');

class Music_Controller extends Page_Controller {

	public function index()
	{
		$this->page->addTitle('music');
		$this->page->display('music/index');
	}
}
