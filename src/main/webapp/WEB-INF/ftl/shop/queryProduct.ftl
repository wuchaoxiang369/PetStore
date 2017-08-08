<#assign path=request.contextPath />
<#include "commons/top.ftl" encoding="utf-8" parse="true" />
<head>
<table align="left" bgcolor="#008800" border="0" cellspacing="2"
	cellpadding="2">
</table>
<p>

<script type="text/javascript">
	function back(){
		window.history.go(-1);
	}
</script>		
<table align="left" bgcolor="#008800" border="0" cellspacing="2"
	cellpadding="2">
	<tr>
		<td bgcolor="#FFFF88">
			<a href="javascript:back()"><b><font color="BLACK" size="2">&lt;&lt; 返回</font>
				</b></a>
		</td>
	</tr>
</table>

<p>
	<center>
		<h2>
			
		</h2>
	</center>
	<table align="center" bgcolor="#008800" border="0" cellspacing="2"
		cellpadding="3">
		<tr bgcolor="#CCCCCC">
			<td>
				产品编号
			</td>
			<td>
				宠物名称
			</td>
		</tr>
		
		<#list productList as product>
		<tr bgcolor="#FFFF88">
			<td>
				<b>
					<a href="${path}/item/queryItems/productid/${product.productid}">${product.productid}</a>
				</b>
			</td>
			<td>
				<b>${product.name}</b>	
			</td>
		</tr>
		</#list>
		
		
	</table>
</head>