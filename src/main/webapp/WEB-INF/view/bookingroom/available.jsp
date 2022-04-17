<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/view/common/header.jsp" />
<jsp:include page="/WEB-INF/view/bookingroom/common.jsp" />

<style>
.center_div{
    margin: 0 auto;
    width:80% /* value of your choice which suits your alignment */
}
</style>

<div class="text-center mt-4"><h4>Available Rooms</h4></div>
<table id="availableTable" class="table table-striped table-bordered" style="width:100%">
         <thead>
            <tr>
            	<th>Room Number</th>
                <th>Availability</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${r}" var="c">
                <tr>
                	<td>${c.roomCode}</td>
                    
                    <td>
                    	<c:choose>
                    	<c:when test="${c.status == 1}">
	                    	Available
                    	</c:when>
                    	<c:otherwise>
                    		 Booked
                    	</c:otherwise>
                    </c:choose>
                    </td>
                    
                    <td class="text-center">                     
                        <a class="btn btn-danger" role="button" href="/bookingroom/delete/${c.roomCode}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
</table>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script>
    $('#availableTable').DataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true
    });

</script>