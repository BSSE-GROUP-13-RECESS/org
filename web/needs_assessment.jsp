<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="assessment"%>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div><br/>
        <div class="card">
          <div class="card-header"><h2>Monthly Needs Assessment</h2></div>
          <div class="card-body">
            <h4>Doses received per month per centre</h4>
            <assessment:select table="substring(d.arrival_date,0,8) as month, hc.name as centre, v.name as vaccine, sum(centre_dozes.quantity) as doses from centre_dozes inner join dozes d on d.id = centre_dozes.doze_id inner join vaccine v on v.id = d.vaccine_id inner join health_centre hc on hc.id = centre_dozes.centre_id group by month, centre, vaccine" displayFormat="table"/>
          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
