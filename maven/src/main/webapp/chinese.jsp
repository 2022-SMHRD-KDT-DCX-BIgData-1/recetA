<%@page import="com.recetA.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.recetA.domain.Basic"%>
<%@page import="com.recetA.domain.BasicDAO"%>
<%@page import="java.util.Random"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<link  href="css/style.css"  rel="stylesheet"  type="text/css">
<head>
    <meta charset="utf-8">
    <title>๐recetA-๋ ์ํผ_์ค์๐</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<%
	// ๋ก๊ทธ์ธ ์ธ์ ๋ถ๋ฌ์ค๊ธฐ
	Member loginMember = (Member)session.getAttribute("loginMember"); %>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="main.jsp" class="navbar-brand mx-4 mb-3 navbar bg-danger row rounded">
                    <h3 class="text-primary text-white"><i class="fa fa-hashtag me-2"></i> recetA</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <i class="bi bi-person-check"></i>
                        <!-- <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;"> -->
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <%-- JSTL ๋ฐฉ์ --%>
						<c:choose>
							<c:when test="${empty loginMember}">
								<h6 class="mb-0">ID</h6>
								<span>์ด๋ฆ</span>
							</c:when>
							<c:otherwise>
								<h6 class="mb-0">${loginMember.m_id}</h6>
								<%-- <span>์ด๋ฆ</span> --%>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="main.jsp" class="nav-item nav-link"><i class="bi bi-egg-fried"></i>HOME</a>
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="bi bi-cup"></i>๋ ์ํผ</a>
                        <div class="dropdown-menu bg-transparent border-0 collapse show">
                            <a href="PagingCon?b_ctype=korean&page=0" class="dropdown-item">ํ์</a>
                            <a href="PagingCon?b_ctype=chinese&page=0" class="dropdown-item active">์ค์</a>
                            <a href="PagingCon?b_ctype=japanese&page=0" class="dropdown-item">์ผ์</a>
                            <a href="PagingCon?b_ctype=western&page=0" class="dropdown-item">์์</a>
                            <a href="PagingCon?b_ctype=asia&page=0" class="dropdown-item">๋๋จ์์์</a>
                            <a href="PagingCon?b_ctype=fusion&page=0" class="dropdown-item">ํจ์ </a>
                        </div>
                    </div>
                    <a href="notice.jsp" class="nav-item nav-link"><i class="bi bi-cup-straw"></i>๊ณต์ง์ฌํญ</a>                    
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            	
	                <a href="main.jsp" class="navbar-brand d-flex d-lg-none me-4">
	                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
	                </a>
	                <a href="#" class="sidebar-toggler flex-shrink-0">
	                    <i class="fa fa-bars"></i>
	                </a>
	                <form class="d-none d-md-flex ms-4" action="SearchCon" method="post">
	                    <input class="form-control border-0" type="search" name="search" placeholder="๊ฒ์">
	                </form>
	                <div class="navbar-nav align-items-center ms-auto">
	                <c:choose> 
		                <c:when test="${empty loginMember}">
		                     <div class="nav-item dropdown">
		                        <a href="signup.jsp" class="nav-link" >
		                            <i class="bi bi-person-circle"></i>
		                            <span class="d-none d-lg-inline-flex">ํ์๊ฐ์</span>
		                        </a>
		                     </div>
		                     <div class="nav-item dropdown">
		                     <%-- ๋ก๊ทธ์ธ ํ ๋๋กญ๋ค์ด ๋๋ ์ฝ๋
		                     <a href="signin.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"> --%>
		                     <a href="signin.jsp" class="nav-link">
		                        <i class="bi bi-person-check"></i>
		                            <span class="d-none d-lg-inline-flex">๋ก๊ทธ์ธ</span>
		                     </a>
		                </c:when>
	                    <%-- ์ง์์ผํ  ๋ก๊ทธ์์ --%>
		                <c:otherwise>
		               		<div class="nav-item dropdown">
		                    <%-- <a href="LogoutCon" class="dropdown-item">๋ก๊ทธ์์</a> --%>
		                        
		                        <%-- ๋ก๊ทธ์ธ ํ ๋๋กญ๋ค์ด ๋๋ ์ฝ๋ --%>
		                        <%-- <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
		                            <a href="information.jsp" class="dropdown-item">๊ฐ์ธ์ ๋ณด์์ </a>
		                            <a href="refrigerator.jsp" class="dropdown-item">๋์ ๋์ฅ๊ณ </a>
		                            <a href="LogoutCon" class="dropdown-item">๋ก๊ทธ์์</a>
		                        </div> --%>
		                    <div class="nav-item dropdown">
                      		<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                      			<i class="bi bi-person-bounding-box"></i>  
                            		<span class="d-none d-lg-inline-flex">${loginMember.m_id} ๋ ํ์ํฉ๋๋ค~!</span>
                       		</a>
                       		<div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="information.jsp" class="dropdown-item">๊ฐ์ธ์ ๋ณด์์ </a>
                            <a href="refrigerator.jsp" class="dropdown-item">๋์ ๋์ฅ๊ณ </a>
                            <a href="Favorites_LoadCon" class="dropdown-item">์ฆ๊ฒจ์ฐพ๊ธฐ</a>
                             <c:if test="${loginMember.m_id eq 'admin'}">
	                            <!-- admin๋ง -->
	                             <a href="Manager.jsp" class="dropdown-item">ํ์๊ด๋ฆฌ</a>
	                             <!-- admin๋ง ๋ -->
	                             </c:if>
                            <a href="LogoutCon" class="dropdown-item">๋ก๊ทธ์์</a>
                            </div>
                   		    </div>
		                </c:otherwise>
	               </c:choose>
	                        <!-- ๋ก๊ทธ์ธ ํ ๋๋กญ๋ค์ด ๋๋ ์ฝ๋ ๋ -->
	                    </div>
	                </div>               		 
            </nav>
            <!-- Navbar End -->

            <!-- ์ค์ Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row vh-198 rounded align-items-center justify-content-center mx-0">
                    
                        <div class="bg-light rounded h-100 p-2 text-center" style="margin-bottom: 2%; ">
                            <span><h2>์ค์</h2></span>
                        </div>
                    <br>
                <!-- ์๋ถ๋ฅ -->    
                <form action="PagingsmallCon" method="post">   
                <table class="table table-bordered" id="table"> 
                    <tr>
                        <td rowspan="3" style="vertical-align:middle;">1๋ถ๋ฅ</td>
                        <td><input type="hidden" name="b_ctype" value="chinese">
                        <input type="hidden" name="page" value="0">
                        <input type="checkbox" name="b_ftype" value="์๋์ฅ"> <span> ์๋์ฅ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋ง๋/๋ฉด๋ฅ"> <span> ๋ง๋/๋ฉด๋ฅ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋นต/๊ณผ์"> <span> ๋นต/๊ณผ์</span></td>
                        <td><input type="checkbox" name="b_ftype" value="์ฐ"> <span> ์ฐ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๊ทธ๋ผํ/๋ฆฌ์กฐ๋"> <span> ๊ทธ๋ผํ/๋ฆฌ์กฐ๋</span></td>                             
                        <td><input type="checkbox" name="b_ftype" value="ํผ์"> <span> ํผ์</span></td>
                        <td><input type="checkbox" name="b_ftype" value="์ฐ๊ฐ/์ ๊ณจ/์คํ"> <span> ์ฐ๊ฐ/์ ๊ณจ/์คํ</span></td>
                    </tr>
                    <tr>   
                        <td><input type="checkbox" name="b_ftype" value="ํ๊น/์ปคํ๋ฆฟ"> <span> ํ๊น/์ปคํ๋ฆฟ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋ฐ๋ฐ์ฐฌ/๊น์น"> <span> ๋ฐ๋ฐ์ฐฌ/๊น์น</span></td>  
                        <td><input type="checkbox" name="b_ftype" value="์กฐ๋ฆผ"> <span> ์กฐ๋ฆผ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๊ตฌ์ด"> <span> ๊ตฌ์ด</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋ฐฅ"> <span> ๋ฐฅ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="์๋ฃ"> <span> ์๋ฃ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋๋ฌผ/์์ฑ/์๋ฌ๋"> <span> ๋๋ฌผ/์์ฑ/์๋ฌ๋</span></td>
                    </tr>
                    <tr> 
                        <td><input type="checkbox" name="b_ftype" value="์์"> <span> ์์</span></td>                                                   
                        <td><input type="checkbox" name="b_ftype" value="๋ถ์นจ"> <span> ๋ถ์นจ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋์๋ฝ/๊ฐ์"> <span> ๋์๋ฝ/๊ฐ์</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋ก/ํ๊ณผ"> <span> ๋ก/ํ๊ณผ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๊ตญ"> <span> ๊ตญ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="์๋์์น/ํ๋ฒ๊ฑฐ"> <span> ์๋์์น/ํ๋ฒ๊ฑฐ</span></td>
                        <td><input type="checkbox" name="b_ftype" value="๋ณถ์"> <span> ๋ณถ์</span></td>
                    </tr>
                    
                    <!-- 2๋ถ๋ฅ -->
                    <tr>
                        <td rowspan="3" style="vertical-align:middle;">2๋ถ๋ฅ</td>
                        <td><input type="checkbox" name="b_itype" value="๊ฒฌ๊ณผ๋ฅ"> <span> ๊ฒฌ๊ณผ๋ฅ</span></td>
                        <td><input type="checkbox" name="b_itype" value="๋ฒ์ฏ๋ฅ"> <span> ๋ฒ์ฏ๋ฅ</span></td>    
                        <td><input type="checkbox" name="b_itype" value="์ ๊ณ ๊ธฐ๋ฅ"> <span> ์ ๊ณ ๊ธฐ๋ฅ</span></td>    
                        <td><input type="checkbox" name="b_itype" value="๋ผ์ง๊ณ ๊ธฐ๋ฅ"> <span> ๋ผ์ง๊ณ ๊ธฐ๋ฅ</span></td>    
                        <td><input type="checkbox" name="b_itype" value="์ฝฉ๋ฅ"> <span> ์ฝฉ๋ฅ</span></td>
                        <td><input type="checkbox" name="b_itype" value="๊ธฐํ"> <span> ๊ธฐํ</span></td>  
                        <td><input type="checkbox" name="b_itype" value="๋ญ๊ณ ๊ธฐ๋ฅ"> <span> ๋ญ๊ณ ๊ธฐ๋ฅ</span></td>                        
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="b_itype" value="์๋ฅ"> <span> ์๋ฅ</span></td>
                        <td><input type="checkbox" name="b_itype" value="ํด์กฐ๋ฅ"> <span> ํด์กฐ๋ฅ</span></td>    
                        <td><input type="checkbox" name="b_itype" value="๊ณก๋ฅ"> <span> ๊ณก๋ฅ</span></td>
                        <td><input type="checkbox" name="b_itype" value="๊ณก๋ฅ"> <span> ์ฑ์๋ฅ</span></td>   
                        <td><input type="checkbox" name="b_itype" value="๋ฐ๊ฐ๋ฃจ"> <span> ๋ฐ๊ฐ๋ฃจ</span></td>    
                        <td><input type="checkbox" name="b_itype" value="๊ฐ๊ณก์ํ๋ฅ"> <span> ๊ฐ๊ณก์ํ๋ฅ</span></td> 
                        <td><input type="checkbox" name="b_itype" value="์ด๋ฅ/ํจ๋ฅ"> <span> ์ด๋ฅ/ํจ๋ฅ</span></td>
                    </tr>
                    <tr>             
                        <td><input type="checkbox" name="b_itype" value="๊ณผ์ผ๋ฅ"> <span> ๊ณผ์ผ๋ฅ</span></td>
                        <td></td><td></td><td></td><td></td><td></td><td></td>  
                    </tr>
                    <tr></tr>
                    <!-- ์ธ๋ถ -->
                    <tr>
                        <td style="vertical-align:middle;">3๋ถ๋ฅ</td>
                        <td><input type="checkbox" name="b_amount" value="1์ธ๋ถ"> <span> 1์ธ๋ถ</span></td>
                        <td><input type="checkbox" name="b_amount" value="2์ธ๋ถ"> <span> 2์ธ๋ถ</span></td>
                        <td><input type="checkbox" name="b_amount" value="3์ธ๋ถ"> <span> 3์ธ๋ถ</span></td>
                        <td><input type="checkbox" name="b_amount" value="4์ธ๋ถ"> <span> 4์ธ๋ถ</span></td>
                        <td></td><td></td><td></td>
                    </tr>
                    <tr>
                        <td style="vertical-align:middle;">4๋ถ๋ฅ</td>
                        <td><input type="checkbox" name="b_difficulte" value="์ด๋ณดํ์"> <span> ์ด๋ณดํ์</span></td>
                        <td><input type="checkbox" name="b_difficulte" value="๋ณดํต"> <span> ๋ณดํต</span></td>
                        <td><input type="checkbox" name="b_difficulte" value="์ด๋ ค์"> <span> ์ด๋ ค์</span></td>
                        <td></td><td></td><td></td><td></td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="vertical-align:middle;">5๋ถ๋ฅ</td>
                        <td><input type="checkbox" name="b_time" value="5๋ถ"> <span> 5๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="10๋ถ"> <span> 10๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="15๋ถ"> <span> 15๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="20๋ถ"> <span> 20๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="25๋ถ"> <span> 25๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="30๋ถ"> <span> 30๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="35๋ถ"> <span> 35๋ถ</span></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="b_time" value="40๋ถ"> <span> 40๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="50๋ถ"> <span> 50๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="60๋ถ"> <span> 60๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="70๋ถ"> <span> 70๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="80๋ถ"> <span> 80๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="90๋ถ"> <span> 90๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="120๋ถ"> <span> 120๋ถ</span></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="b_time" value="140๋ถ"> <span> 140๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="175๋ถ"> <span> 175๋ถ</span></td>
                        <td><input type="checkbox" name="b_time" value="180๋ถ"> <span> 180๋ถ</span></td>
                        <td></td><td></td><td></td><td></td>
                    </tr>
                </table>                 
                <div class=" d-flex justify-content-center">
                <button type="submit" class="btn btn-warning rounded-pill m-2" id="btn">์๋ถ๋ฅ ๊ฒ์</button>   
                </div> 
                </form>                      
            </div>
            <!-- ์๋ถ๋ฅ ๋ -->
			<!-- ์ฌ๊ธฐ๋ถํฐ ๋ณต์ฌ ๋ถ์ฌ๋ฃ๊ธฐ -->
            <!-- ๋ ์ํผ  -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                <!-- ์๋ถ๋ฅ ์ธ์ ์งํ -->
                <%
                // ์๋ถ๋ฅ ์ธ์ null ํ์ธํ๊ธฐ
               	// 1. selectbFtype ์ธ์ null ํ์ธํ๊ธฐ
               	if(session.getAttribute("b_ftypepage")!=null){
               		List<Basic> b_ftypepage = (List) session.getAttribute("b_ftypepage");
               		for(int i=0; i<b_ftypepage.size(); i++){ %>
               		<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <a href="RecipedetailpageCon?b_code=<%=b_ftypepage.get(i).getB_code()%>">
                            <img src="<%=b_ftypepage.get(i).getB_url() %>" alt="" width="311" height="289"><br>
                            <button type="button" class="btn btn-outline-link m-2"><h6><%= b_ftypepage.get(i).getB_name()%></h6></button>
                            </a>
                        </div>
                    </div>
                    <%}
               		}// selectbFtype ์ธ์ null ํ์ธ ๋
               	
               	// 2. selectbItype ์ธ์ null ํ์ธํ๊ธฐ
               	if(session.getAttribute("b_itypepage")!=null){
               		List<Basic> b_itypepage = (List) session.getAttribute("b_itypepage");
               		
               		for(int i=0; i<b_itypepage.size(); i++){ %>
               		<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <a href="RecipedetailpageCon?b_code=<%=b_itypepage.get(i).getB_code()%>">
                            <img src="<%=b_itypepage.get(i).getB_url() %>" alt="" width="311" height="289"><br>
                            <button type="button" class="btn btn-outline-link m-2"><h6><%= b_itypepage.get(i).getB_name()%></h6></button>
                            </a>
                        </div>
                    </div>
                    <%}
               		}// selectbItype ์ธ์ null ํ์ธ ๋
               	
               	// 3. selectbTime ์ธ์ null ํ์ธํ๊ธฐ
               	if(session.getAttribute("b_timepage")!=null){
               		List<Basic> b_timepage = (List) session.getAttribute("b_timepage");
               		
               		for(int i=0; i<b_timepage.size(); i++){ %>
               		<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <a href="RecipedetailpageCon?b_code=<%=b_timepage.get(i).getB_code()%>">
                            <img src="<%=b_timepage.get(i).getB_url() %>" alt="" width="311" height="289"><br>
                            <button type="button" class="btn btn-outline-link m-2"><h6><%= b_timepage.get(i).getB_name()%></h6></button>
                            </a>
                        </div>
                    </div>
                    <%}
               		}// selectbTime ์ธ์ null ํ์ธ ๋
               	
               	// 4. selectbAmount ์ธ์ null ํ์ธํ๊ธฐ
               	if(session.getAttribute("b_amountpage")!=null){
               		List<Basic> b_amountpage = (List) session.getAttribute("b_amountpage");
               		
               		for(int i=0; i<b_amountpage.size(); i++){ %>
               		<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <a href="RecipedetailpageCon?b_code=<%=b_amountpage.get(i).getB_code()%>">
                            <img src="<%=b_amountpage.get(i).getB_url() %>" alt="" width="311" height="289"><br>
                            <button type="button" class="btn btn-outline-link m-2"><h6><%= b_amountpage.get(i).getB_name()%></h6></button>
                            </a>
                        </div>
                    </div>
                    <%}
               		}// selectbAmount ์ธ์ null ํ์ธ ๋
               	
               	// 5. selectbDifficulte ์ธ์ null ํ์ธํ๊ธฐ
               	if(session.getAttribute("b_difficultepage")!=null){
               		List<Basic> b_difficultepage = (List) session.getAttribute("b_difficultepage");
               		
               		for(int i=0; i<b_difficultepage.size(); i++){ %>
               		<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <a href="RecipedetailpageCon?b_code=<%=b_difficultepage.get(i).getB_code()%>">
                            <img src="<%=b_difficultepage.get(i).getB_url() %>" alt="" width="311" height="289"><br>
                            <button type="button" class="btn btn-outline-link m-2"><h6><%= b_difficultepage.get(i).getB_name()%></h6></button>
                            </a>
                        </div>
                    </div>
                    <%}
               		}// selectbDifficulte ์ธ์ null ํ์ธ ๋
               	
                // ์๋ถ๋ฅ ๋จผ์  if๋ก null๊ฐ ํ์ธ ํ ๋๋ถ๋ฅ null ํ์ธ ์งํ
                // ์๋ถ๋ฅcon์์ ๋๋ถ๋ฅ ์ธ์์ ์ง์ฐ๊ณ  ์งํํ  ๊ฒ์
              	if (session.getAttribute("b_ftypepage") == null &&
	            		session.getAttribute("b_itypepage") == null &&
	            		session.getAttribute("b_timepage") == null &&
	            		session.getAttribute("b_amountpage") == null &&
	            		session.getAttribute("b_difficultepage") == null) {
              		List<Basic> bigpage = (List) session.getAttribute("bigpage");
              		for(int i=0; i<bigpage.size(); i++){ %>
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <a href="RecipedetailpageCon?b_code=<%=bigpage.get(i).getB_code()%>">
                            <img src="<%=bigpage.get(i).getB_url() %>" alt="" width="311" height="289"><br>
                            <button type="button" class="btn btn-outline-link m-2"><h6><%= bigpage.get(i).getB_name()%></h6></button>
                            </a>
                        </div>
                    </div>
                <%} }  %> 
                </div>
            </div>
            <!-- ๋ ์ํผ ๋ -->
            <!-- ์ฌ๊ธฐ๊น์ง ๋ณต์ฌ ๋ถ์ฌ๋ฃ๊ธฐ -->
            <!-- ํ์ด์ง ๋ฒํธ -->
            <nav aria-label="Page navigation" class="d-flex justify-content-center ">
                <ul class="pagination">
                <!-- ์ฌ๊ธฐ๋ถํฐ ๋ถ์ฌ๋ฃ๊ธฐ -->
	            <%
	            // ๊ฒ์๊ธ ์ ์ฒด ๊ฐฏ์ ๋ณ์ cnt ์ ์ธ
	            int cnt = 0;
	            // ์๋ถ๋ฅ ๊ฐ์ด ์์ผ๋ฉด ๋๋ถ๋ฅ ๊ฐ์ผ๋ก ์งํ
	            if(session.getAttribute("selectbFtype") == null &&
	            		session.getAttribute("selectbItype") == null &&
	            		session.getAttribute("selectbTime") == null &&
	            		session.getAttribute("selectbAmount") == null &&
	            		session.getAttribute("selectbDifficulte") == null
	            		){
		            // ๋๋ถ๋ฅ์ ๊ฒ์๊ธ ์๋ฅผ ์ธ์ size๋ก ํ๋จ
		            cnt = (int) session.getAttribute("bigbasic");
	            } else if(session.getAttribute("selectbFtype")!=null) {
	            		List<Basic> selectbFtype = (List) session.getAttribute("selectbFtype");
	            		cnt += selectbFtype.size();
	            	} else if(session.getAttribute("selectbItype")!=null) {
	            		List<Basic> selectbItype= (List)session.getAttribute("selectbItype");
	            		cnt += selectbItype.size();
	            	} else if(session.getAttribute("selectbTime")!=null) {
	            		List<Basic> selectbTime= (List)session.getAttribute("selectbTime");
	            		cnt += selectbTime.size();
	            	} else if(session.getAttribute("selectbAmount")!=null) {
	            		List<Basic> selectbAmount= (List)session.getAttribute("selectbAmount");
	            		cnt += selectbAmount.size();
	            	} else if(session.getAttribute("selectbDifficulte")!=null) {
	            		List<Basic> selectbDifficulte= (List)session.getAttribute("selectbDifficulte");
	            		cnt += selectbDifficulte.size();
	            	}
	            // ํ ํ์ด์ง์ ์ถ๋ ฅ๋  ๊ธ ์
	            int pageSize = 10;
	            
	            // ํ ํ์ด์ง ์ ๋ณด ์ค์  --> nowpage๊ฐ currentPage
	            // ์๋ถ๋ฅ์ชฝ์ ์ธ์๋ง๋ค ๋ณ๊ฒฝํด์ผ ํจ
	            int nowpage = (int)session.getAttribute("nowpage")+1;
	           
	            // ํ์ด์ง ๋ฒํธ ์ฒ๋ฆฌ
	            if(cnt != 0){
	            	// ์ ์ฒด ํ์ด์ง ๋ฒํธ ์ ๊ณ์ฐ
	            	int pageCount = (cnt / pageSize) + (cnt % pageSize == 0?0:1);
	            	if(pageCount<0){
	            		pageCount = 1;
	            	}
	            	
	            	// ํ ํ์ด์ง์ ๋ณด์ฌ์ค ํ์ด์ง ๋ฒํธ
	            	int pagenumber = 5;
	            	
	            	// ํ ํ์ด์ง์ ๋ณด์ฌ์ค ํ์ด์ง ๋ฒํธ ์์ ๋ฒํธ ๊ณ์ฐ
	            	int startNum = ((nowpage-1)/pagenumber)*pagenumber + 1;
	            	
	            	// ํ ํ์ด์ง์ ๋ณด์ฌ์ค ํ์ด์ง ๋ฒํธ ๋ ๋ฒํธ ๊ณ์ฐ
	            	int endNum = startNum + pagenumber -1;
	            	if(endNum > pageCount){
	            		endNum = pageCount-1;
	            	}%>
	            	
	            	<!-- ํ์ด์ง ๋ฒํผ ๋๋ถ๋ฅ ์๋ถ๋ฅ ๋ถ๋ฆฌํด์ ๋์ฐ๊ธฐ -->
	            	<!-- ์์ผ๋ก ๋ณด๋ด๊ธฐ ๋ฒํผ -->
	            	<li class="page-item page-link" aria-label="Previous">
	            	<%
	            	if(startNum>1){ %>
	            		<a href="PagingCon?b_ctype=chinese&page=<%=startNum-pagenumber-1%>">
	            	<%} %>
			            <span aria-hidden="true">&lt;</span>
			            	</a>
			            </li>
	            	<%
	            	// i๊ฐ์ 0๋ถํฐ ์์ํด์ผ ํจ
	            	int i=startNum-1;
	            	// ํ์ด์ง ๊ฐ์ด ๋ถ์กฑํด๋ ํ ๋ฒ์ ๋์๊ฐ์ผ ํ์ด์ง ๋ฒํธ 1๊ฐ์ด ์๊ธฐ๊ธฐ ๋๋ฌธ์ do while ์ฌ์ฉ
	            	do{
	            		// ๋ง์ฝ ํ์ฌ ํ์ด์ง ๋ฒํธ์ ์ธ์๊ณผ i๊ฐ์ด ๊ฐ๋ค๋ฉด active
	            		if(i == nowpage-1){
	            			// i๋ 0๋ถํฐ ์์ํ๋๊น ํ์ด์ง ๋ฒํธ์ i๊ฐ์ +1์ ํด์ ๋์๋์ผ ํ๋ค.
	            		%>
	            		<li class="page-item active"><a class="page-link active"
	            		href="PagingCon?b_ctype=chinese&page=<%=i%>"><%=i+1%></a></li>
	            	<%
	            		} else{%>
	            			<li class="page-item"><a class="page-link"
	            		href="PagingCon?b_ctype=chinese&page=<%=i%>"><%=i+1%></a></li>
	            		<%} i++;
	            	}while(i<=endNum);%>
	            	<li class="page-item page-link" aria-label="Next">
	            	<%
	            	if(endNum <pageCount){ %>
	            		<a href="PagingCon?b_ctype=chinese&page=<%=startNum+pagenumber-1%>">
					<%} %>
	            		<span aria-hidden="true">&gt;</span>
		                </a>
		               	</li>
	            	<% }  %>
	            </ul>
	        </nav>
            <!-- ํ์ด์ง ๋ฒํธ ๋ -->                     
            </div>
            <!-- ์ค์ End -->

            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="main.jsp">recetA</a><span>, ํ์ฅ:์ก์์ง ํ์:๊ฐํ์ค, ๊น๊ธฐ๋ฒ, ๊น๋์ฐ, ๊น๋ํ</span> 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer authorโs credit link/attribution link/backlink. If you'd like to use the template without the footer authorโs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            <!-- Designed By <a href="https://htmlcodex.com">HTML Codex</a> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>