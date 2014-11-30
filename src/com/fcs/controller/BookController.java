package com.fcs.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fcs.entity.Book;
import com.fcs.entity.Publish;
import com.fcs.mapper.BookMapper;
import com.fcs.mapper.PublishMapper;
/**
 * @author fcs
 * spring mvc+mybatis+mysql  demo
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/book")
public class BookController {
	private BookMapper bookMapper = null;
	private PublishMapper pubMapper = null;
	@Autowired
	public void setBookMapper(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}
	@Autowired
	public void setPubMapper(PublishMapper pubMapper) {
		this.pubMapper = pubMapper;
	}

	@RequestMapping(method=RequestMethod.GET)
	public String findAll(ModelMap model){
		List<Book> books = bookMapper.findAll();
		model.addAttribute("books",books);
		return "list";
	}
	
	@RequestMapping(value="/preAdd")
	public String preAdd(ModelMap model){
		List<Publish> pubs= pubMapper.findAll();
		model.addAttribute("pubs",pubs);
		return "add";
	}
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response){
		//重定向的一种
		ModelAndView mav = new ModelAndView("redirect:/book");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String pubId = request.getParameter("pubId");
		int pub_Id = Integer.parseInt(pubId);
		Book book = new Book();
		Publish pub = new Publish();
		pub.setPubId(pub_Id);
		book.setName(name);
		book.setAuthor(author);
		book.setPublish(pub);
		bookMapper.add(book);
		/**
		 * TODO:有没有更好的方法    
		 * 1.页面到Conreoller的数据获取略显臃肿
		 */
		return mav;
	}
	@RequestMapping(value="/delete")
	public String delete(HttpServletRequest request,HttpServletResponse response){
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			int id = Integer.parseInt(ids[i]);
			bookMapper.delete(id);
		}
		return "redirect:/book";
	}
	
	@RequestMapping(value="/preEdit")
	public String preEdit(ModelMap model,HttpServletRequest request){
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		Book book = bookMapper.findById(id);
		List<Publish> pubs = pubMapper.findAll();
		model.addAttribute("book", book);
		model.addAttribute("pubs", pubs);
		return "edit";
	}
	
	@RequestMapping(value="/edit")
	public ModelAndView update(HttpServletRequest request,HttpServletResponse response){
		//重定向的一种
		ModelAndView mav = new ModelAndView("redirect:/book");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String sid = request.getParameter("id");
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String pubId = request.getParameter("pubId");
		int pub_Id = Integer.parseInt(pubId);
		Book book = new Book();
		Publish pub = new Publish();
		pub.setPubId(pub_Id);
		book.setId(Integer.parseInt(sid));
		book.setName(name);
		book.setAuthor(author);
		book.setPublish(pub);
		bookMapper.update(book);
		/**
		 * TODO:有没有更好的方法    
		 * 1.页面到Conreoller的数据获取略显臃肿
		 */
		return mav;
	}
	
}
