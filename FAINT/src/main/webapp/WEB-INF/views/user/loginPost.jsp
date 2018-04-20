<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<!-- <script type="text/javascript">
 //   var srcId = sessionStorage.getItem('srcId');
    var dest = '${dest}';
  //  sessionStorage.removeItem('srcId');
    if (srcId !== null) {
        if(dest.replace('/edit/editPage/', '') !== ''){
            self.location = '${dest}';
        }else{
            self.location = '${dest}' + '/' + srcId;
        }
    } else {
        var msg=Boolean("${msg}");
        if(msg){
            alert("${msg}");
        }
        self.location = '${dest}';
    }


</script> -->
	<script type="text/javascript">
		self.location = "/";
	</script>


</body>
</html>