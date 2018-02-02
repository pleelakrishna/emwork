<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>



<form:form modelAttribute="userForm"  class="form-horizontal" method="Post" >
								<div class="form-group">
									<label class="col-md-3 control-label no-padding-right">Username</label>
									<div class="col-md-6">
										<form:input path="name" class="form-control validate" enctype="multipart/form-data" placeholder="Enter Username"/>
									</div>
								</div>
									
									<div class="row">
                    		<div class="col-md-6">
                    		<div class="form-group">
                    		<label class="ace-file-input ace-file-multiple col-sm-3 control-label no-padding-right" >Attach File(s)</label>
									<div class="col-md-5">
										<input type="file" name="file[]" id="file" class="col-sm-9" multiple="multiple">
									</div>
                    		</div>
                    		</div>
                    		</div>
                    		<div class="col-md-offset-3 col-md-6">
										<input type="button" onclick="leela()" id="submit1"  class="btn btn-success" value="Create"/>
										<input class="btn-danger btn cancel"  type="reset"  value="Reset" />
									</div>
                    		
								</form:form>
</body>

<script type="text/javascript">

/* function leela()
{

	alert("hi");
var fd = new FormData();

fd.append("fileToUpload[]", document.getElementById('file').files[0]);

$.ajax({
    type: 'POST',
    url: 'atest',
    cache: false,
    contentType: false,
    processData: false,
    data : fd,
    success: function(result){
        console.log(result);
    },
    error: function(err){
        console.log(err);
    }
});

} */



var data = new FormData();
jQuery.each(jQuery('#file')[0].files, function(i, file) {
    data.append('file-'+i, file);
});

//Full Ajax request
jQuery.ajax({
    url: 'atest',
    data: data,
    cache: false,
    contentType: false,
    processData: false,
    type: 'POST',
    success: function(data){
        alert(data);
    }
});







</script>
</html>