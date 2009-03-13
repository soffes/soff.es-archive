<?php defined('SYSPATH') OR die('No direct access allowed.');

class About_Controller extends Page_Controller {

	public function index()
	{
		$this->page->addTitle('about');
		$this->page->display('about/index');
	}
}
