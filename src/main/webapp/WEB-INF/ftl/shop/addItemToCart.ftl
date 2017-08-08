<#assign path=request.contextPath />
<#include "commons/top.ftl" encoding="utf-8" parse="true" />
<br>
<head>
<table align="left" bgcolor="#008800" border="0" cellspacing="2"
	cellpadding="2">
</table>
<p>
<script type="text/javascript">
	function check(){
		alert('请先登录');
		window.location.href="${path}/user/loginMain";
	}
</script>
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

<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top" align="center">
			<h2 align="center">
				<center><font color="red"><b>${error}</b></font></center>
			</h2>
			<form name="form1" method="post" action="${path}/cart/update">
				<table align="center" bgcolor="#008800" border="0" cellspacing="2"
					cellpadding="5" >
					<tr bgcolor="#cccccc">
						<td>
							宠物编号
						</td>
						<td>
							产品编号
						</td>
						<td>
							宠物描述
						</td>
						<td>
							<b>是否有宠物</b>
						</td>
						<td>
							宠物单价
						</td>
						<td>
							宠物数量
						</td>
						<td>
							合计
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				<#assign sum=0/>
				<#assign total=0/>
				<#assign orderid=0/>
				<#list cartList as cart>
					<#assign orderid="${cart.orderid}"/>
					<input type="hidden" name="orderid" value="${cart.orderid}" />
					<#list cart.itemList as item>
					<tr bgcolor="#FFFF88">
						<td>
							<b> 
								<a href="${path}/item/queryItem/itemid/${item.itemid}">${item.itemid}</a>
								<input type="hidden" name="itemid" value="${item.itemid}" />					
							</b>
						</td>
						<td>
							${item.product.productid}
						
						</td>
						<td>
							${item.attr1}
							
						</td>
						<td align="center">
							有
							
						</td>
						<td>
							${item.listprice}
														
						</td>
						<td align="right">
							<input type="number" name="quantity" value="${cart.quantity}"/>
							<br>
						</td>
						<td align="right">
							<#assign sum="${cart.quantity*item.listprice}"/>
							${sum}
							<#assign total=total?number+sum?number/>
							
							
						</td>
						<td>
							<a href="${path}/cart/del/itemid/${item.itemid}/orderid/${cart.orderid}">
								<img border="0" src="${path}/static/images/button_remove.gif" />
							</a>
						</td>
					</tr>
					</#list>
				</#list>
					<tr bgcolor="#FFFF88">
						<td colspan="7" align="right">
							<b>
								总计：${total}
						</td>
						<td>
							<input type="image" src="${path}/static/images/button_update_cart.gif" />
						</td>
					</tr>
				</table>
			</form>
			<br>
			<center>
				<#assign username="${account.username}" />
				<#if username!=null>
					<a href="${path}/cart/updateOrder/orderid/${orderid}/total/${total}">
						<img border="0" src="${path}/static/images/button_checkout.gif" />
					</a>
				<#else>
					<a href="javascript:check()">
						<img border="0" src="${path}/static/images/button_checkout.gif" />
					</a>
				</#if>
			</center>
		</td>
		<td valign="top" width="20%" align="right">
		</td>
	</tr>
</table>
</head>