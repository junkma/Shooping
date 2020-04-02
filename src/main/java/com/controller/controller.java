package com.controller;

import com.alibaba.fastjson.JSON;
import com.pojo.*;
import com.service.*;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * @author junkma
 * @date 2019-11-26-11:10
 **/
@Controller
public class controller {
    @Autowired
    UserService userService;
    @Autowired
    CommentService commentService;
    @Autowired
    ProductService productService;
    @Autowired
    NewsService newsService;
    @Autowired
    ProductCategoryService productCategoryService;
    @Autowired
    CarService carService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    BrowseService browseService;

    //登录验证
    @RequestMapping("/LoginCheck")
    public String LoginCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session,String loginname,String password,String code) throws ServletException, IOException {
        User user=userService.selectLogin(loginname,password);
        session.setAttribute("user",user);
        String rand= (String) session.getAttribute("rand");
        if(!rand.equals(code)){
            request.setAttribute("msg","验证码输入有误！");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        if(user==null){
            request.setAttribute("msg","你输入的用户名或密码有误！");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        return  "index";
    }
    //注册
    @RequestMapping("/regist")
    public String Regist(HttpServletRequest request,HttpServletResponse response,HttpSession session,User user,String code) throws ServletException, IOException {
        String rand = (String) session.getAttribute("rand");
        if (!rand.equals(code)) {
            request.setAttribute("msg", "验证码输入有误！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            userService.insertSelective(user);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.println("<script> alert('注册成功！');</script>");
            out.flush();
        }
            return "login";
    }
    //注销登录
    @RequestMapping("/off")
    public String off(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        session.removeAttribute("user");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println("<script> alert('注销成功！');</script>");
        out.flush();
        return "login";
    }
    //用户查看留言
    @RequestMapping("/comment")
    public String comment(HttpServletRequest request,HttpSession session,Integer page){

        List<ProductCategory> productCategories = productCategoryService.selectParentCategorys();
        User user=(User)session.getAttribute("user");
        //查询最近浏览
        if(user!=null) {
            List<Browse> browses = browseService.selectByUserId(user.getId());
            request.setAttribute("browses", browses);
        }
        request.setAttribute("productCategories",productCategories);
        List<Comment> comments = commentService.selectComments();
        int pagenum=1;
        if(page!=null){
            pagenum=page;
        }
        if(pagenum<1){
            pagenum=1;
        }
        if(pagenum>=comments.size()/5+1){
            pagenum=comments.size()/5+1;
        }

        List<Comment> commentsPage = commentService.selectCommentPage(5 * (pagenum - 1));
        request.setAttribute("totalPage",comments.size()/5+1);
        request.setAttribute("sum",comments.size());
//当前页数
        request.setAttribute("pagenum",pagenum);
        request.setAttribute("commentsPage",commentsPage);
        return "front/comment";
    }
    //增加留言
    @RequestMapping("/insertComment")
    public String insertComment(HttpServletRequest request,HttpServletResponse response,HttpSession session,Comment comment) throws IOException {
        Date createTime=new Date();
        comment.setCreatetime(createTime);
        int i = commentService.insertSelective(comment);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println("<script> alert('留言成功！');</script>");
        out.flush();
        return comment(request,session,1);
    }
    //浏览首页
    @RequestMapping("/index")
    public String indexCheck(HttpServletRequest request,HttpSession session){
        User user=(User)session.getAttribute("user");

        //查询父分类
        List<ProductCategory> productCategories = productCategoryService.selectParentCategorys();
        List<News> news = newsService.selectNews();
        //查询最近浏览
        if(user!=null) {
            List<Browse> browses = browseService.selectByUserId(user.getId());
            request.setAttribute("browses", browses);
        }
        request.setAttribute("productCategories",productCategories);
        request.setAttribute("news",news);
        return "index";
    }

    //商品分类
    @RequestMapping("/productType")
    public String productType(HttpServletRequest request,int id,Integer page){
        List<Product> products = productService.selectbyChildId(id);

        int pagenum=1;
        if(page!=null){
            pagenum=page;
        }
        if(pagenum<1){
            pagenum=1;
        }
        if(pagenum>=products.size()/8+1){
            pagenum=products.size()/8+1;
        }

        List<Product> pageProducts = productService.selectByPage(id, 8* (pagenum - 1));
        request.setAttribute("id",id);
        request.setAttribute("totalPage",products.size()/8+1);
        request.setAttribute("pageProducts",pageProducts);
        request.setAttribute("sum",products.size());
//当前页数
        request.setAttribute("pagenum",pagenum);

        return "front/productType";
    }
    //查看全部商品
    @RequestMapping("/allProducts")
    public String allProducts(HttpServletRequest request,Integer page){
        List<Product> products = productService.selectAllProducts();
        int pagenum=1;
        if(page!=null){
            pagenum=page;
        }
        if(pagenum<1){
            pagenum=1;
        }
        if(pagenum>=products.size()/8+1){
            pagenum=products.size()/8+1;
        }

        List<Product> pageProducts = productService.selectAllByPage( 8* (pagenum - 1));

        request.setAttribute("totalPage",products.size()/8+1);
        request.setAttribute("pageProducts",pageProducts);
        request.setAttribute("sum",products.size());
//当前页数
        request.setAttribute("pagenum",pagenum);
        return "front/allProducts";
    }
    //查看新闻
    @RequestMapping("/newsDetail")
    public String newsDetail(HttpServletRequest request,int id){
        News news = newsService.selectByPrimaryKey(id);
        request.setAttribute("news",news);
        return "front/newsDetail";
    }
    //查看商品详情
    @RequestMapping("/productDetail")
    public String productDetail(HttpServletRequest request,HttpSession session,HttpServletResponse response,int id){
        Product product=productService.selectByPrimaryKey(id);
        //将浏览过的商品放入浏览表
        User user=(User)session.getAttribute("user");
        if(user!=null) {
            //判断是否已经浏览过
            Browse browse1 = browseService.selectByProductId(id);
            if (browse1 == null) {
                Browse browse = new Browse(user.getId(), product.getId(), new Date());
                int i = browseService.insertSelective(browse);
            }
        }
        request.setAttribute("product",product);
        return "front/productDetail";
    }


    //查看购物车
    @RequestMapping("/checkCar")
    public String checkCar(HttpServletRequest request,HttpSession session,Integer page){

        User user=(User)session.getAttribute("user");
        List<Car> cars = carService.selectCars(user.getId());
        //购物车中商品总价
        double sumPrice=0;
        for (Car car : cars) {
            sumPrice+=car.getProduct().getPrice()*car.getNumber();
        }
        int pagenum=1;
        if(page!=null){
            pagenum=page;
        }
        if(pagenum<1){
            pagenum=1;
        }
        if(pagenum>=cars.size()/4+1){
            pagenum=cars.size()/4+1;
        }

        List<Car> pageCars=carService.selectCarsByPage(user.getId(),4*(pagenum-1));
        request.setAttribute("cars",pageCars);
        request.setAttribute("totalPage",cars.size()/4+1);
//当前页数
        request.setAttribute("pagenum",pagenum);

        request.setAttribute("sumPrice",sumPrice);
        return "front/car";
    }
    //加入购物车
    @RequestMapping("/insertCar")
    public String insertCar(HttpServletRequest request,HttpSession session,int id){
        //获取添加商品的用户信息
        User user=(User)session.getAttribute("user");
//根据productid判断购物车中有无重复商品，若有重复商品，商品数量加一
        Car car = carService.selectByProductId(user.getId(), id);
        if(car!=null) {
            carService.updateNum(car.getId());
        }else {
            //往购物车添加商品
            Car car1 = new Car(id, user.getId(), new Date(), 1);
            carService.insertCar(car1);
        }
        return checkCar(request,session,1);
    }

    //删除购物车
    @RequestMapping("/deleteCar")
    public String deleteCar(HttpServletRequest request,HttpServletResponse response,HttpSession session,int id) throws IOException {
        int i = carService.deleteCar(id);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println("<script> alert('删除成功！');</script>");
        out.flush();

        return checkCar(request,session,1);
    }

    //使购物车中商品数量减一
    @RequestMapping("/minCar")
    public String minCar(HttpServletRequest request,HttpSession session,int id,int page){
        int i = carService.minCar(id);
        return checkCar(request,session,page);
    }

    //使购物车中商品数量加一
    @RequestMapping("/addCar")
    public String addCar(HttpServletRequest request,HttpSession session,int id,int page){
        int i = carService.updateNum(id);
        return checkCar(request,session,page);
    }

    //提交订单
    @RequestMapping("/submitOrder")
    public String submitOrder(HttpServletRequest request,HttpSession session,Float cost){
        User user=(User)session.getAttribute("user");
        String uuid = UUID.randomUUID().toString().replace("-", "");
        Order order=new Order(user.getId(),user.getLoginname(),user.getAddress(),new Date(),cost,uuid);
        //下订单
        int i = orderService.insertSelective(order);
        //订单明细
        List<Car> cars = carService.selectCars(user.getId());
        Order order1 = orderService.selectByTime();
        int orderId=order1.getId();
        for (Car car : cars) {
            OrderDetail orderDetail=new OrderDetail(orderId,car.getProductid(),car.getNumber(),car.getProduct().getPrice()*car.getNumber());
            int i1 = orderDetailService.insertSelective(orderDetail);
        }

        //删除购物车中商品信息
        int i2 = carService.deleteByUserId(user.getId());

        return "front/tips";
    }

    /*
    *
    * 后台管理
    * */

    @RequestMapping("commentManager")
//查询全部留言,进入留言管理界面
    public String selectAll(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpServletRequest request) {
        request.setAttribute("paper", commentService.findByPage(currentPage));//回显分页数据
        return "back/commentManager";


    }

    @RequestMapping("select")
    public String select(int id, HttpServletRequest request) {
        Comment comment = commentService.selectByPrimaryKey(id);
        request.setAttribute("comment", comment);
        return "back/reply";

    }

    //修改留言
    @RequestMapping("update")
    public String update(int id, HttpServletRequest request) {
        String reply = request.getParameter("reply");
        System.out.println(reply);
        System.out.println(id);
        Comment comment = commentService.selectByPrimaryKey(id);
        comment.setReply(reply);
        comment.setStage(1);
        commentService.updateByPrimaryKey(comment);
        return selectAll(1, request);

    }

    @RequestMapping("del")
    public String del(int id, HttpServletRequest request) {
        commentService.deleteByPrimaryKey(id);
        return selectAll(1, request);

    }

    @RequestMapping("userManager")
//查询全部用户,进入用户管理界面
    public String selectAlluser(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpServletRequest request) {
        System.out.println("进入user");
        request.setAttribute("users", userService.findByPage(currentPage));//回显分页数据
        return "back/usermanager";


    }
@RequestMapping("checkuser1")
public void checkuser1(String check,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
    List<User> users = userService.selectAll();
    String flag="";
    for (User user : users) {
        if(user.getLoginname()==check){
            flag="用户名重复";
        }

    }
  response.getWriter().println(flag);
}
    //通过id选中要修改的用户
    @RequestMapping("selectuser")
    public String selectuser(int id, HttpServletRequest request) {
        User user = userService.selectByPrimaryKey(id);
        request.setAttribute("user", user);
        return "back/updateuser";

    }


    //新增用户
    @RequestMapping("insertuser")
    public String insertuser(HttpServletRequest request) {
        String loginname = request.getParameter("loginname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String adress = request.getParameter("adress");
        User user = new User();
        user.setAddress(adress);
        user.setEmail(email);
        user.setIdentitycode(id);
        user.setLoginname(loginname);
        user.setMobile(phone);
        user.setPassword(password);
        user.setUsername(username);
        user.setSex(sex);
        userService.insertSelective(user);

        return selectAlluser(1, request);

    }


    //修改用户

    @RequestMapping("/updateuser")
    public String updateuser( HttpServletRequest request, User user) {
        System.out.println("进入修改用户");
        userService.updateByPrimaryKeySelective(user);
        return selectAlluser(1,request);
    }

    //删除用户
    @RequestMapping("deluser")
    public String deluser(int id, HttpServletRequest request) {
        userService.deleteByPrimaryKey(id);
        return selectAlluser(1, request);

    }

    //新闻管理 默认进入界面
    @RequestMapping("newsManager")
    public String selectAllnews(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpServletRequest request) {
        System.out.println("进入news");
        request.setAttribute("news", newsService.findByPage(currentPage));//回显分页数据
        return "back/newsmanager";


    }

    //新增新闻
    @RequestMapping("insertnews.do")
    public String insertnews(HttpServletRequest request) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        News news = new News();
        news.setContent(content);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        news.setCreatetime(sdf.format(new Date()));
        news.setTitle(title);
        newsService.insertSelective(news);
        return selectAllnews(1, request);

    }

    //根据id删除新闻
    @RequestMapping("delnews")
    public String delnews(int id, HttpServletRequest request) {
        newsService.deleteByPrimaryKey(id);
        return selectAllnews(1, request);

    }

    //根据id查找新闻
    @RequestMapping("selectnews")
    public String selectnews(int id, HttpServletRequest request) {
        News news = newsService.selectByPrimaryKey(id);
        request.setAttribute("news", news);
        return "back/updatenews";


    }

    //根据id修改新闻
    @RequestMapping("updatenews")
    public String updatenews(Integer id, HttpServletRequest request) {
        System.out.println("进入修改新闻");
        System.out.println(id);
        News news = newsService.selectByPrimaryKey(id);
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        news.setContent(content);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        news.setCreatetime(sdf.format(new Date()));
        news.setTitle(title);
        newsService.updateByPrimaryKeySelective(news);
        return selectAllnews(1, request);
    }

    //订单管理 默认进入界面
    @RequestMapping("orderManager")
    public String selectAllorder(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpServletRequest request) {
        System.out.println("进入order");
        request.setAttribute("order", orderService.findByPage(currentPage));//回显分页数据
        return "back/ordermanager";


    }

    //删除订单
    @RequestMapping("delorder")
    public String delorder(int id, HttpServletRequest request) {
        orderService.deleteByPrimaryKey(id);
        return selectAllorder(1, request);

    }

    //根据id查找订单
    @RequestMapping("selectorder")
    public String selectorder(int id, HttpServletRequest request) {
        Order order = orderService.selectByPrimaryKey(id);
        request.setAttribute("order", order);
        return "back/updateorder";


    }

    //修改订单
    @RequestMapping("updateorder")
    public String updateorder(Integer id, HttpServletRequest request) {
        System.out.println("进入修改订单");
        Order order = orderService.selectByPrimaryKey(id);
        int op = Integer.parseInt(request.getParameter("op"));
        order.setStatus(op);
        orderService.updateByPrimaryKeySelective(order);
        return selectAllorder(1, request);
    }

    @RequestMapping("selectby")
    public void selectby(String pid, String name,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");

        List<Order> list = orderService.selectby(pid, name);

        String json= JSON.toJSONString(list);
        response.getWriter().println(json);

    }

    @RequestMapping("productManager")

    public String selectAllproduct(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpServletRequest request) {
        Page<Product> byPage = productService.findByPage(currentPage);
        request.setAttribute("product",byPage);//回显分页数据
        return "back/productmanager";


    }

    //删除商品
    @RequestMapping("delproduct")
    public String delproduct(int id, HttpServletRequest request) {
        productService.deleteByPrimaryKey(id);
        return selectAllproduct(1, request);

    }

    //根据id查找商品
    @RequestMapping("selectproduct")
    public String selectproduct(int id, HttpServletRequest request) {
        Product product = productService.selectByPrimaryKey(id);
        System.out.println(product);
        request.setAttribute("product", product);
        return "back/updateproduct";
    }

    //修改商品信息
    @RequestMapping("updateproduct")
    public String updateproduct(Integer id, HttpServletRequest request, @RequestParam MultipartFile file, HttpSession session) {
        System.out.println("进入修改商品");
        System.out.println(id);
        //定义文件上传的目录
        String realpath = session.getServletContext().getRealPath("upload");
        //以时间为二级目录
        String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //upload/2019-11-16/1.jpg
        File fl = new File(realpath, time);
        //判断目录是否存在 不存在就创建目录
        if (!fl.exists()) {
            fl.mkdirs();

        }
        //获取文件本身名字

        String orginalFilename = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String fname = uuid + orginalFilename;
        //进行保存在服务器TomCat上
        try {
            file.transferTo(new File(fl, fname));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Product product = productService.selectByPrimaryKey(id);
        String name = request.getParameter("name");
        String des = request.getParameter("descript");
        int type = Integer.parseInt(request.getParameter("type"));
        Float price = Float.parseFloat(request.getParameter("price"));
        int count = Integer.parseInt(request.getParameter("count"));
        product.setDescription(des);
        product.setName(name);
        product.setCatechildid(type);
        product.setPrice(price);
        product.setFilename(fname);
        product.setStock(count);
        System.out.println(type);
        productService.updateByPrimaryKeySelective(product);

        return selectAllproduct(1, request);
    }

    //新增商品
    @RequestMapping("insertproduct")
    public String insertproduct(HttpServletRequest request, @RequestParam MultipartFile file, HttpSession session,Product product) {
        System.out.println("进入新增商品");
        //定义文件上传的目录
        String realpath = session.getServletContext().getRealPath("upload");
        //以时间为二级目录
        String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //upload/2019-11-16/1.jpg
        File fl = new File(realpath, time);
        //判断目录是否存在 不存在就创建目录
        if (!fl.exists()) {
            fl.mkdirs();

        }
        //获取文件本身名字
        String orginalFilename = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String fname = uuid + orginalFilename;
        //进行保存在服务器TomCat上
        try {
            file.transferTo(new File(fl, fname));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        ProductCategory  products= productCategoryService.selectByPrimaryKey(product.getCatechildid());
        product.setFilename(fname);

        product.setCateid(products.getParentid());
        productService.insertSelective(product);
        return selectAllproduct(1,request);
    }
    @RequestMapping("typeManager")
    public  String getAllType(HttpServletRequest request){
        List<ProductCategory> productCategoryServiceAll1 = productCategoryService.selectParentCategorys();
        request.setAttribute("type1",productCategoryServiceAll1);
        System.out.println("sss"+productCategoryServiceAll1);
        return "back/typemanager";

    }
    @RequestMapping("inserttypes")
    public  String getAllTypes(HttpServletRequest request){
        List<ProductCategory> productCategoryServiceAll1 = productCategoryService.selectParentCategorys();
        request.setAttribute("type",productCategoryServiceAll1);
        System.out.println("sss"+productCategoryServiceAll1);
        return "back/inserttype";

    }
    //添加分类
    @RequestMapping("inserttype")
    public String inserttype(HttpServletRequest request) {
        List<ProductCategory> productCategoryServiceAll1 = productCategoryService.selectParentCategorys();
        request.setAttribute("type",productCategoryServiceAll1);
        System.out.println("进入inserttype");
        String name = request.getParameter("name");
        System.out.println(name);
        int parentid = Integer.parseInt(request.getParameter("parentid"));
        System.out.println(parentid);
        ProductCategory product_category = new ProductCategory();
        product_category.setName(name);
        product_category.setParentid(parentid);
        productCategoryService.insertSelective(product_category);
        return getAllType(request);
    }
    //修改分类时首先通过id获取所修改的分类
    @RequestMapping("selecttype")
    public  String selecttype(int id,HttpServletRequest request){
        ProductCategory product_category = productCategoryService.selectByPrimaryKey(id);
        request.setAttribute("type",product_category);
        return "back/updatetype";


    }
    //修改分类内容
    @RequestMapping("updatetype")
    public String updatetype(HttpServletRequest request,int id){
        ProductCategory product_category = productCategoryService.selectByPrimaryKey(id);
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        product_category.setParentid(type);
        product_category.setName(name);
        productCategoryService.updateByPrimaryKeySelective(product_category);
        return getAllType(request);

    }
    //删除分类
    @RequestMapping("deltype")
    public String deltype(int id,HttpServletRequest request){

        productCategoryService.deleteByPrimaryKey(id);
        return getAllType(request);
    }
}
