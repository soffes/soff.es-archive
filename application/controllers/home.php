<?php defined('SYSPATH') OR die('No direct access allowed.');

class Home_Controller extends Page_Controller {

	public function index()
	{
		// Initialize the model
		$model = new Blog_Model;
		
		$data = array
		(
			'posts' => $model->get_posts()
		);
		
		// Display the page
		$this->page->display('posts', $data, 'markdown');
	}
}
