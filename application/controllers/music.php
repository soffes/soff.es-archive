<?php defined('SYSPATH') OR die('No direct access allowed.');

class Music_Controller extends Page_Controller {

	public function index()
	{
		$this->page->addTitle('music');
		$this->page->addJS('http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js');
		$this->page->addJS('music');
		$this->page->display('music/index');
	}
}
