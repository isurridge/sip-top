<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<head>
<meta charset="UTF-8">
<title>Ext JS Kitchen Sink</title>


<!-- Ext -->

<link rel="stylesheet" type="text/css"
	href="http://extjs-public.googlecode.com/svn/tags/extjs-4.1.1a/release/resources/css/ext-all.css" />
<script type="text/javascript"
	src="http://extjs-public.googlecode.com/svn/tags/extjs-4.1.1a/release/ext-all.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<decorator:head />
</head>
<body>
	<!-- use class="x-hide-display" to prevent a brief flicker of the content -->
	<div id="west" class="x-hide-display"></div>
	<div id="center" class="x-hide-display">
		<decorator:body />
	</div>
</body>
</html>