<?php defined('SYSPATH') OR die('No direct access allowed.');

class Admin_Controller extends Page_Controller {

	public function __construct()
	{
		parent::__construct();

		// TODO: Make sure they are logged in
		
		$this->page->addTitle('Admin');
	}
	
	public function index()
	{
		// Initialize the model
		$model = new Blog_Model;
		
		$data = array
		(
			'posts' => $model->get_posts()
		);
	
		$this->page->display('admin/index', $data, 'markdown');
	}
}