<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<table>
		<tr>
			<th>구분</th>
			<th>1월</th>
			<th>2월</th>
			<th>3월</th>
			<th>4월</th>
			<th>5월</th>
			<th>6월</th>
			<th>7월</th>
			<th>8월</th>
			<th>9월</th>
			<th>10월</th>
			<th>11월</th>
			<th>12월</th>
			<th>합격</th>
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
			<td></td>
		</tr>
		<tr>
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