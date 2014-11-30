package com.fcs.mapper;

import java.util.List;

import com.fcs.entity.Book;

public interface BookMapper {
	
	public List<Book> findAll();
	
	public void add(Book book);
	
	public void update(Book book);
	
	public Book findById(int id);
	
	public void delete(int id);
}
