<#-- request在spring-mvc.xml中设置过。contextPath = src/main/java下的东西 -->
<#-- 跟src/main/webapp是同级目录 -->
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

<form id="form1" name="form1" method="post" action="${path}/user/login">
	<table align="center" border="0">
		<tr>
			<td colspan="2">
				<font size="3" color="red">
					<b>${error}</b>
				</font>
				<br>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				用户名:<input type="text" name="username" id="username" />
			</td>
		</tr>
		<tr>
			<td>
				密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="text" name="password" id="password" /><br>
			</td>
		</tr>
		<tr>
			<td>
				<input type="image" border="0" src="${path}/static/images/button_submit.gif" />
				<a href="${path}/user/registerMain">
					<img border="0" src="${path}/static/images/button_register_now.gif" />
				</a>
			</td>
		</tr>
	</table>
</form>
