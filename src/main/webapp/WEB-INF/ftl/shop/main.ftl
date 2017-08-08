<#assign path=request.contextPath />
	<#include "commons/top.ftl" encoding="utf-8" parse="true" />
		<center><font color="red"><b>${commitError}</b></font></center>
		<table border="0" cellspacing="2" cellpadding="0" width="100%">
			<tr>
				<td valign="top" width="100%">

					<table align="left" border="0" cellspacing="0" width="80%">
						<tbody>
							<tr>
								<td valign="top">

									<!-- SIDEBAR -->
									
									<table bgcolor="#5A8C29" border="0" cellspacing="2"
										cellpadding="0" width="100%">
										<tr>
											<td>
												<table bgcolor="#FFFF88" border="0" cellspacing="0"
													cellpadding="5" width="200">
													<tbody>
														<tr>
														
															<#-- 自己写的欢迎XXX -->
															<td>
																<#assign username="${account.username}" />
																<b><i><font size="2" color="RED">欢迎<#if (username==null)>游客<#else>${username}来到宠物商店</#if> </font></i></b>
																&nbsp;
															</td>
															
														</tr>
														<tr>
															<td>
																<a href="${path}/product/queryProduct/catid/FISH">
																	<img border="0" src="${path}/static/images/fish_icon.gif" />
																</a>
																<br>
																<font size="2"><i></i>
																</font>
															</td>
														</tr>
														<tr>
															<td>
																<a href="${path}/product/queryProduct/catid/DOGS">
																	<img border="0" src="${path}/static/images/dogs_icon.gif" />
																</a>
																<br>
																<font size="2"><i></i>
																</font>
															</td>
														</tr>
														<tr>
															<td>
																<a href="${path}/product/queryProduct/catid/CATS">
																	<img border="0" src="${path}/static/images/cats_icon.gif" />
																</a>
																<br>
																<font size="2"><i></i>
																</font>
															</td>
														</tr>
														<tr>
															<td>
																<a href="${path}/product/queryProduct/catid/REPTILES">
																	<img border="0" src="${path}/static/images/reptiles_icon.gif" />
																</a>
																<br>
																<font size="2"><i></i>
																</font>
															</td>
														</tr>
														<tr>
															<td>
																<a href="${path}/product/queryProduct/catid/BIRDS">
																	<img border="0" src="${path}/static/images/birds_icon.gif" />
																</a>
																<br>
																<font size="2"><i></i>
																</font>
															</td>
														</tr>

													</tbody>
												</table>
											</td>
										</tr>
									</table>

								</td>
								<td align="center" bgcolor="white" height="300" width="100%">

									<!-- MAIN IMAGE -->

									<map name="estoremap">
										<area alt="Birds" coords="72,2,280,250"
											href="${path}/product/queryProduct/catid/BIRDS" shape="RECT" />
										<area alt="Fish" coords="2,180,72,250"
											href="${path}/product/queryProduct/catid/FISH" shape="RECT" />
										<area alt="Dogs" coords="60,250,130,320"
											href="${path}/product/queryProduct/catid/DOGS" shape="RECT" />
										<area alt="Reptiles" coords="140,270,210,340"
											href="${path}/product/queryProduct/catid/REPTILES" shape="RECT" />
										<area alt="Cats" coords="225,240,295,310"
											href="${path}/product/queryProduct/catid/CATS" shape="RECT" />
										<area alt="Birds" coords="280,180,350,250"
											href="${path}/product/queryProduct/catid/BIRDS" shape="RECT" />
									</map>
									<img border="0" height="355" src="${path}/static/images/splash.gif"
										align="center" usemap="#estoremap" width="350" />
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

		</table>
