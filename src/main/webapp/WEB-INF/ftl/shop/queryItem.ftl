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
	<table align="center" bgcolor="#008800" cellspacing="2" cellpadding="3"
		border="0" width="60%">
		<tr bgcolor="#FFFF88">
			<td bgcolor="#FFFFFF">
				<image src="${path}/static/images/${item.product.pic}" />
			</td>
		</tr>
		<tr bgcolor="#FFFF88">
			<td width="100%" bgcolor="#cccccc">
				${item.itemid}
			</td>
		</tr>
		<tr bgcolor="#FFFF88">
			<td>
				<b>
					<font size="4"> 
						${item.attr1}
					</font>
				</b>
			</td>
		</tr>
		<tr bgcolor="#FFFF88">
			<td>
				<font size="3"><i>需要从DB中查看是否有库存</i></font>
			</td>
		</tr>
		<tr bgcolor="#FFFF88">
			<td>
				${item.listprice}
			</td>
		</tr>

		<tr bgcolor="#FFFF88">
			<td>
				<a href="${path}/cart/add/itemid/${item.itemid}/quantity/1"><img border="0"
						src="${path}/static/images/button_add_to_cart.gif" />
				</a>
			</td>
		</tr>
	</table>
