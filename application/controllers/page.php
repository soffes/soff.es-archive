<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Page Controller - simple controller subclass that loades the
 * pages library.
 *
 * @package	   Pages Module
 * @author     Sam Soffes
 */

abstract class Page_Controller extends Controller {

	public function __construct()
	{
		parent::__construct();

		// Load the page class
		$this->page = Pages::instance();
		
		// Defaults
		$this->page->addCSS('style');
	}
}
