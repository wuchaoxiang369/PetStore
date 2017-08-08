<#assign path=request.contextPath />
<#include "commons/top.ftl" encoding="utf-8" parse="true" />
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
	<table align="center" bgcolor="#008800" border="0" cellspacing="2" cellpadding="3">
		<tr bgcolor="#CCCCCC">
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
				宠物价格
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
	<#list itemList as item>
		<tr bgcolor="#FFFF88">
			<td>
				<b> 
					<a href="${path}/item/queryItem/itemid/${item.itemid}">${item.itemid}</a>
				</b>
			</td>
			<td>
				${item.product.productid}
			</td>
			<td>
				${item.attr1}
			</td>
			<td>
				${item.listprice}
			</td>
			<td>
				<a href="${path}/cart/add/itemid/${item.itemid}/quantity/1"><img border="0"
						src="${path}/static/images/button_add_to_cart.gif" />
				</a>
			</td>
		</tr>
	</#list>
	</table>
