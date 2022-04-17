<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/view/common/header.jsp" />
<jsp:include page="/WEB-INF/view/bookingroom/common.jsp" />

<style>
.center_div{
    margin: 0 auto;
    width:80% /* value of your choice which suits your alignment */
}
</style>

<div class="text-center mt-4"><h4>Booking Details</h4></div>
<table id="bookTable" class="table table-striped table-bordered" style="width:100%">
         <thead>
            <tr>
            	<th>Room Number</th>
                <th>Availability</th>
                <th>CheckIn</th>
                <th>CheckOut</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${data.rb}" var="c">
                <tr>
                	<td>${c.roomCode}</td>
                    <td>${c.roomStatus}</td>
                    <td>${c.checkInDate}</td>
                    <td>${c.checkOutDate}</td>
                    <td class="text-center">
                    <c:choose>
                    	<c:when test="${c.paymentStatus == 1}">
                    	<button class="btn btn-success" disabled="disabled">
                    		 PAID
                    	</button>
                    	</c:when>
                    	<c:otherwise>
                    		 <button class="btn btn-primary">
                    		 <a href="/bookingroom/update/${c.roomCode}">Pay Now</a> 
                    	</button >
                    	</c:otherwise>
                    </c:choose>
                                          
                                          
                        <a class="btn btn-danger" role="button" href="/bookingroom/delete/${c.roomCode}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
</table>


<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script>
    $('#bookTable').DataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true
    });

</script>