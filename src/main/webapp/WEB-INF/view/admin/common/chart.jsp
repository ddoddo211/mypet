<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".click").click(function(){
			var date = $(this).children().val();
			alert(date);
		});
	});
</script>
<style>
	.click{
		cursor : pointer;
	}

</style>
<div>
	<table width="1200px;">
		<caption style="text-align: right;">단위(원)</caption>
		<tr>
			<th>구분</th>
			<th class="click">1월<input type="hidden" id="m1" name="" value="1" /></th>
			<th class="click">2월<input type="hidden" id="m2" name="" value="2" /></th>
			<th class="click">3월<input type="hidden" id="m3" name="" value="3" /></th>
			<th class="click">4월<input type="hidden" id="m4" name="" value="4" /></th>
			<th class="click">5월<input type="hidden" id="m5" name="" value="5" /></th>
			<th class="click">6월<input type="hidden" id="m6" name="" value="6" /></th>
			<th class="click">7월<input type="hidden" id="m7" name="" value="7" /></th>
			<th class="click">8월<input type="hidden" id="m8" name="" value="8" /></th>
			<th class="click">9월<input type="hidden" id="m9" name="" value="9" /></th>
			<th class="click">10월<input type="hidden" id="m10" name="" value="10" /></th>
			<th class="click">11월<input type="hidden" id="m11" name="" value="11" /></th>
			<th class="click">12월<input type="hidden" id="m12" name="" value="12" /></th>
			<th class="click">합계<input type="hidden" id="total" name="" value="13" /></th>
		</tr>
		<tr>
			<td>펫시터</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>펫쇼핑몰</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>펫미용실</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
<canvas id="myChart" width="400" height="200"></canvas>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        datasets: [{
            label: '펫시터',
            data: [1,2,3,1,2,3,1,2,3,1,2,3],
            backgroundColor : "rgba(23,170,255,0.5)",
            borderWidth: 1
        },{
        	label: '펫쇼핑몰',
        	data: [1,2,3,1,2,3,1,2,3,1,2,3],
        	backgroundColor : "rgba(255,136,0,0.5)",
            borderWidth: 1
        },{
        	label: '펫미용실',
        	data: [1,2,3,1,2,3,1,2,3,1,2,3],
        	backgroundColor : "rgba(177,49,55,0.5)",
            borderWidth: 1
        },{
        	label: '펫보험',
        	data: [1,2,3,1,2,3,1,2,3,1,2,3],
        	backgroundColor : "rgba(124,110,233,0.5)",
            borderWidth: 1
        }]
    },
    options: {
        scales: {
        	xAxes: [{
        		gridLines: {
                    offsetGridLines: true,
                    stacked: true
                }
            }],
            yAxes: [{
                ticks: {
                    beginAtZero:true,
                    stacked: true
                }
            }]
        }
    }
});

</script>