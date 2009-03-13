<?php defined('SYSPATH') OR die('No direct access allowed.');

class Admin_Controller extends Page_Controller {

	public function __construct()
	{
		parent::__construct();

		$username = $this->input->server('PHP_AUTH_USER');
		$password = $this->input->server('PHP_AUTH_PW');

		if ($username != Kohana::config('blog.admin_username') || $password != Kohana::config('blog.admin_password'))
		{
			header('WWW-Authenticate: Basic realm="' . Kohana::config('config.site_domain') . '"');
			exit;
		}
		
		$this->model = new Blog_Model;
		
		$this->page->addTitle('Admin');
	}
	
	public function index()
	{
		$data = array
		(
			'posts' => $this->model->get_posts()
		);
	
		$this->page->display('admin/index', $data);
	}
	
	public function write()
	{
		$this->page->addTitle('Write Post');
		$this->page->display('admin/write');
	}
	
	public function edit($id)
	{
		$post = $this->model->get_post_by_id($id);
		
		if ($post === FALSE)
		{
			$this->page->addTitle('Post Not Found');
			$this->page->display('blog/post_not_found');
			return;
		}
	
		$this->page->addTitle('Edit Post');
		$this->page->display('admin/edit', compact('post'));
	}
	
	public function save()
	{
		$this->model->save_post($this->input->post());
		
		url::redirect('admin');
	}
}
