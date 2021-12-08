<%@ include file="upper.jsp" %>
<%@taglib uri="https://org.com" prefix="report"%>
<c:if test="${sessionScope.userType.equals('admin')}">
  <div class="container">
    <div class="row justify-content-center">
      <div><br/>
        <div class="card">
          <div class="card-header"><h2>Reports</h2></div>
          <div class="card-body">
            <div hidden>
              <report:select table="site_visits" displayFormat="table"/>
              <c:set var="visits" scope="page" value="${requestScope.data.get(0).get('number')}"/>
              <report:select table="count(*) as number from patient" displayFormat="table"/>
              <c:set var="patients" scope="page" value="${requestScope.data.get(0).get('number')}"/>
              <report:select table="count(*) as number from health_centre" displayFormat="table"/>
              <c:set var="centres" scope="page" value="${requestScope.data.get(0).get('number')}"/>
            </div>
            <div class="row">
              <!-- ./col -->
              <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-info">
                  <div class="inner">
                    <h3>${pageScope.visits}</h3>

                    <p>Site Visits</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-bag"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-success">
                  <div class="inner">
                    <h3>${pageScope.centres}</h3>

                    <p>Centres</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-warning">
                  <div class="inner">
                    <h3>${pageScope.patients}</h3>

                    <p>Registered Patients</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-person-add"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-5 col-6">
                <!-- small box -->
                <div class="small-box bg-danger">
                  <div class="inner">
                    <h3>${sessionScope.population}</h3>

                    <p>Adult Population</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
            </div>
          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- column -->
    </div><!-- raw -->
  </div><!-- container -->
</c:if>
<%@ include file="lower.jsp" %>
