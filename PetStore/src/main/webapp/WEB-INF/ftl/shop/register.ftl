<#-- 要想用到SpringMVC的校验功能，必须引入Spring的核心Taglib -->
<#assign spring=JspTaglibs["http://www.springframework.org/tags"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"] />
<#-- 用到Framework的form控件作为form表单提交 并进行验证 -->


<#assign path=request.contextPath />
<#include "commons/top.ftl" encoding="utf-8" parse="true"/>
<br>

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

<#-- 这是引入spring时规定的。user跟messages.properties中的user对应 -->

<@form.form commandName="user" id="form1" name="form1" method="post" action="${path}/user/register">
	<TABLE cellpadding=10 cellspacing=0 align=center border=1 width="400"
		bgcolor=#dddddd>
		<TR>
			<TD>
				<FONT color=darkgreen>
					<H3>
						用户信息：
					</H3>
				</FONT>
				<TABLE border=0  bgcolor=#FFFF88  width="100%">
					<TR bgcolor=#FFFF88>						
						<TD>
						 用户名：<input type="text" id="username" name="username" />
						<font color="red"> <@form.errors path="username" /></font>
						</TD>
					</TR>
					<TR bgcolor=#FFFF88>
						
						<TD>
						密码：<input type="text" id="password" name="password" />	
						<font color="red"> <@form.errors path="password" /></font>						
						</TD>
					</TR>
					<TR bgcolor=#FFFF88>
						
						<TD>
						确认密码：<input type="text" id="repassword" name="repassword" />
						<font color="red"> <@form.errors path="repassword" />${repasswordError}</font>	
						</TD>
					</TR>
				</TABLE>
				<FONT color=darkgreen>
					<H3>
						账户信息：
					</H3>
				</FONT>

				<TABLE bgcolor="#FFFF88" border=0 
					bgcolor=#FFFF88 width="100%">
					<TR bgcolor=#FFFF88>
						
						<TD>
							真实姓名：<input type="text" id="xm" name="xm" />
							<font color="red"> <@form.errors path="xm" /></font>
						</TD>
					</TR>
					
					<TR bgcolor=#FFFF88>
						
						<TD>
							邮箱：<input type="text" id="email" name="email" /> 
							<font color="red"> <@form.errors path="email" /></font>
						</TD>
					</TR>
					
					<TR bgcolor=#FFFF88>
						
						<TD>
							 地址：<input type="text" id="address" name="address" />
							<font color="red"> <@form.errors path="address" /></font>
						</TD>
					</TR>
					
					
				</TABLE>
				<FONT color=darkgreen>
					<H3>
						喜爱设置：
					</H3>
				</FONT>

				<TABLE bgcolor="#FFFF88" border=0 cellpadding=3 cellspacing=1 width="100%">
					<TR bgcolor=#FFFF88>
						
						<TD>
						语言设置：
							<select id="languageSelect" name="profile.lang" >
								<option>English</option>
								<option>中文</option>
							</select>
						</TD>
					</TR>
					<TR bgcolor=#FFFF88>
						<TD>
						喜爱宠物：
							<#assign clist=categoryList />
							<select id="loveSelect" name="profile.category.catid"> 
								<#list clist as category>
									<option>${category.catid}</option>
								</#list>
							</select>
						</TD>
					</TR>
				</TABLE>
	</TABLE>

	<BR>
	<CENTER>
		${registerError}
		<input border=0 type="image" src="${path}/static/images/button_submit.gif" />
	</CENTER>
</@form.form>
