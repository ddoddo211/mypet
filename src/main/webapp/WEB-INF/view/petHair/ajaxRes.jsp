<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<div class="resPickBlock">
			<div class="resPick">
				<span>08~10시</span>
				
				<div class="chkB">
					<c:choose>
						<c:when test="${fn:length(resList1)!=0 }">
							<c:choose>
								<c:when test="${fn:length(resList1)==1 }">
									<img src="/hairimg/unchecked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:when>
								<c:otherwise>
									<img src="/hairimg/checked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:otherwise>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<img src="/hairimg/unchecked-checkbox.png"/>
							<img src="/hairimg/unchecked-checkbox.png"/>
						
						</c:otherwise>
					</c:choose>
				
				</div> 
				<c:choose>
					<c:when test="${fn:length(resList1)==2 }">
						<input type="radio" name="selRes" class="selRes" disabled="true" value="1"/>
					
					</c:when>
					<c:otherwise>
						<input type="radio" name="selRes" class="selRes" value="1"/>
					
					</c:otherwise>
				</c:choose>
			</div>
			<div class="resPick">
			    <span>10~12시</span>
				
				<div class="chkB">
					<c:choose>
						<c:when test="${fn:length(resList2)!=0 }">
							<c:choose>
								<c:when test="${fn:length(resList2)==1 }">
									<img src="/hairimg/unchecked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:when>
								<c:otherwise>
									<img src="/hairimg/checked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:otherwise>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<img src="/hairimg/unchecked-checkbox.png"/>
							<img src="/hairimg/unchecked-checkbox.png"/>
						
						</c:otherwise>
					</c:choose>
				
				</div> 
				<c:choose>
					<c:when test="${fn:length(resList2)==2 }">
						<input type="radio" name="selRes" class="selRes" disabled="true" value="2"/>
					
					</c:when>
					<c:otherwise>
						<input type="radio" name="selRes" class="selRes" value="2"/>
					
					</c:otherwise>
				</c:choose>
			</div>
			<div class="resPick">
			    <span>12~14시</span>
				<div class="chkB">
					<c:choose>
						<c:when test="${fn:length(resList3)!=0 }">
							<c:choose>
								<c:when test="${fn:length(resList3)==1 }">
									<img src="/hairimg/unchecked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:when>
								<c:otherwise>
									<img src="/hairimg/checked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:otherwise>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<img src="/hairimg/unchecked-checkbox.png"/>
							<img src="/hairimg/unchecked-checkbox.png"/>
						
						</c:otherwise>
					</c:choose>
				
				</div> 
				<c:choose>
					<c:when test="${fn:length(resList3)==2 }">
						<input type="radio" name="selRes" class="selRes" disabled="true" value="3"/>
					
					</c:when>
					<c:otherwise>
						<input type="radio" name="selRes" class="selRes" value="3"/>
					
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="resPickBlockR">
			<div class="resPick">
				<span>14~16시</span>			
				<div class="chkB">
					<c:choose>
						<c:when test="${fn:length(resList4)!=0 }">
							<c:choose>
								<c:when test="${fn:length(resList4)==1 }">
									<img src="/hairimg/unchecked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:when>
								<c:otherwise>
									<img src="/hairimg/checked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:otherwise>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<img src="/hairimg/unchecked-checkbox.png"/>
							<img src="/hairimg/unchecked-checkbox.png"/>
						
						</c:otherwise>
					</c:choose>
				
				</div> 
				<c:choose>
					<c:when test="${fn:length(resList4)==2 }">
						<input type="radio" name="selRes" class="selRes" disabled="true" value="4"/>
					
					</c:when>
					<c:otherwise>
						<input type="radio" name="selRes" class="selRes" value="4"/>
					
					</c:otherwise>
				</c:choose>
			</div>
			<div class="resPick">
				<span>16~18시</span>
				<div class="chkB">
					<c:choose>
						<c:when test="${fn:length(resList5)!=0  }">
							<c:choose>
								<c:when test="${fn:length(resList5)==1 }">
									<img src="/hairimg/unchecked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:when>
								<c:otherwise>
									<img src="/hairimg/checked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:otherwise>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<img src="/hairimg/unchecked-checkbox.png"/>
							<img src="/hairimg/unchecked-checkbox.png"/>
						
						</c:otherwise>
					</c:choose>
				
				</div> 
				<c:choose>
					<c:when test="${fn:length(resList5)==2 }">
						<input type="radio" name="selRes" class="selRes" disabled="true" value="5"/>
					
					</c:when>
					<c:otherwise>
						<input type="radio" name="selRes" class="selRes" value="5"/>
					
					</c:otherwise>
				</c:choose>
			</div>
			<div class="resPick">
				<span>18~20시</span>
				<div class="chkB">
					<c:choose>
						<c:when test="${fn:length(resList6)!=0  }">
							<c:choose>
								<c:when test="${fn:length(resList6)==1 }">
									<img src="/hairimg/unchecked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:when>
								<c:otherwise>
									<img src="/hairimg/checked-checkbox.png"/>
									<img src="/hairimg/checked-checkbox.png"/>
								
								</c:otherwise>
							</c:choose>
						
						</c:when>
						<c:otherwise>
							<img src="/hairimg/unchecked-checkbox.png"/>
							<img src="/hairimg/unchecked-checkbox.png"/>
						
						</c:otherwise>
					</c:choose>
				
				</div> 
				<c:choose>
					<c:when test="${fn:length(resList6)==2 }">
						<input type="radio" name="selRes" class="selRes" disabled="true" value="6"/>
					
					</c:when>
					<c:otherwise>
						<input type="radio" name="selRes" class="selRes" value="6"/>
					
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>