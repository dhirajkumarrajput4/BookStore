package com.bookstore.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.UserDao;
import com.bookstore.model.Book;
import com.bookstore.model.SellBook;
import com.bookstore.model.User;
import com.bookstore.service.BookService;
import com.bookstore.service.SellBookService;
import com.bookstore.service.UserService;

@Controller
public class MyController {
	private static final String User = null;
	
	User sessionUser=new User();
	
	@Autowired
	UserService userService;

	@Autowired
	BookService bookService;

	@Autowired
	UserDao userDao;

	@Autowired
	BookDao bookDao;
	
	@Autowired
	SellBookService sellBookService;

	@RequestMapping("/login")
	public String login() {
		/*
		 * User user=null; model.addAttribute("user", user);
		 */
		return "login";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		return "register";
	}

	@ModelAttribute
	public User createUser() {
		return new User();
	}

	@RequestMapping(value = "/registerform", method = RequestMethod.POST)
	public String showRegister(@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpServletRequest request) throws IOException {
		if (result.hasErrors()) {
			return "register";
		} else {
			System.out.println(user.getFirstName());
			this.userService.save(user);

			return "redirect:/";
		}
	}

	@RequestMapping(value = "/loginform", method = RequestMethod.POST)
	public String checkLogin(@RequestParam("email") String Email, @RequestParam("password") String Password,
			Model model, HttpServletRequest request) {
		System.out.println(Email);
		System.out.println(Password);
		User checkUser = this.userDao.checkUser(Email, Password);
		if (checkUser == null) {
			request.getSession().setAttribute("msg", "Invailid Username or Password");
			request.getSession().setAttribute("clss", "alert-danger");
			return "redirect:/login";

		} else {
			if (checkUser.getUserType().trim().equals("admin")) {
				// retrieve book on home page
				List<Book> books = bookService.getBooks();
				this.sessionUser=checkUser;
				
				request.getSession().setAttribute("logedUser", checkUser);
				request.getSession().setAttribute("name", checkUser.getFirstName());
				request.getSession().setAttribute("usertype", checkUser.getUserType());
				request.getSession().setAttribute("id",checkUser.getId());
				request.getSession().removeAttribute("msg");
				request.getSession().removeAttribute("clss");
				return "redirect:/";
			}

			else {
				
				this.sessionUser=checkUser;
				// retrieve book on home page
				List<Book> books = bookService.getBooks();
				request.getSession().setAttribute("logedUser", checkUser);
				request.getSession().setAttribute("name", checkUser.getFirstName());
				request.getSession().setAttribute("id",checkUser.getId());
				request.getSession().removeAttribute("msg");
				request.getSession().removeAttribute("clss");
				return "redirect:/";
			}
		}
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session, HttpServletRequest request) {
		// return all books on home page
		/*
		 * List<Book> books = bookService.getBooks(); model.addAttribute("books",
		 * books);
		 */

		request.getSession().removeAttribute("logedUser");
		request.getSession().removeAttribute("name");
		request.getSession().removeAttribute("usertype");
		System.out.println(request.getServletPath());
		return "redirect:/";
	}

	/* book model attribute */
	@ModelAttribute
	public Book createBook() {
		return new Book();
	}

	@RequestMapping(value = "/registerbookform", method = RequestMethod.POST)
	public String showBooks(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpServletRequest request,
			Model m) throws IOException {
		boolean error = false;
		if (result.hasErrors()) {
			error = true;
			m.addAttribute("error", error);
//			retrieve all books on home page
			List<Book> books = bookService.getBooks();
			m.addAttribute("books", books);
			return "index";
			
		} else {
			System.out.println(book.getBooktitle());
			this.bookService.save(book);
			return "redirect:/";
		}
	}

	@RequestMapping("/")
	public String getAllBook(Model model, HttpSession session) {
		User user = null;
		model.addAttribute("user", user);
		List<Book> books = bookService.getBooks();
//		model.addAttribute("book1",new Book());
		model.addAttribute("books", books);

		session.removeAttribute("msg");
		session.removeAttribute("clss");

		return "index";
	}

	@RequestMapping("/deletebook/{id}")
	public ModelAndView deleteBook(@PathVariable("id") int id) {
		this.bookService.deleteBook(id);
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}

	@RequestMapping("/updatebook/{id}")
	public String updateBook(@PathVariable("id") int id, Model model) {
		System.out.println("this is update controller");

		// get all books on home page and /bookdelete/url
		
		List<Book> books = bookService.getBooks();
		model.addAttribute("books", books);

		Book bookById = this.bookDao.getById(id);

		model.addAttribute("book", bookById);

		return "index";
	}
	
	
//	buy the book
	@RequestMapping(value = "/buy/{id}")
	public String buyTheBook(@PathVariable(name="id") Integer id ,Model model) {
		Book bookbyid=this.bookDao.getById(id);

		SellBook slb=new SellBook();
		
		slb.setBookName(bookbyid.getBooktitle());
		slb.setUserName(this.sessionUser.getFirstName());
		slb.setPrice(bookbyid.getPrice());
		this.sellBookService.sellBookSave(slb);	
		return "redirect:/";
	}
	
	
//search book by name
	@RequestMapping("/search")
	public String searchBook(@RequestParam("searchValue") String searchValue, Model model) {
		try {
			List<Book> book = (List<Book>) this.bookDao.findBybooktitleLike(searchValue);
			System.out.println("Search book : " + book);
			model.addAttribute("books", book);
			return "SearchedBooks";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "SearchedBooks";

	}

//return all users	
	@RequestMapping("/users")
	public String getAllUsers(Model model) {
		List<User> Users = userService.getAllUsers();
		model.addAttribute("Users", Users);

		return "viewUser";
	}

//	get user details handler
	@RequestMapping(value = "/userdetails/{id}")
	public ModelAndView getUserById(@PathVariable(name = "id") Integer uid, Model model) {
		System.out.println("inside userdetails handler   " + uid);
//		int Id=Integer.parseInt(uid);
		User myuser = userDao.getById(uid);

		// System.out.println(myuser.getFirstName());


		ModelAndView mv = new ModelAndView("userDetails");
		mv.addObject("user", myuser);
		return mv;
	}

//delete user handler
	@RequestMapping(value = "/userdelete/{id}")
	public String deleteUser(@PathVariable(name = "id") Integer id) {
		userService.deleteuser(id);

		return "redirect:/users";
	}

//	update User handler
	@RequestMapping(value = "/userupdate/{id}")
	public String updateUser(@PathVariable(name = "id") Integer id, Model model) {
		User user = userDao.getById(id);
		model.addAttribute("user", user);
		return "register";
	}
	
//get all purchased books
	@RequestMapping("/sellBooks")
	public String getAllsellBooks(Model model) {
		List<SellBook> allSellBook = this.sellBookService.getAllSellBook();
		
		model.addAttribute("allSellBook", allSellBook);

		return "purchaseBooks";
	}
	

}
