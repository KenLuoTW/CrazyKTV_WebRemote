﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="gui_find.ascx.cs" Inherits="web.gui_find" %>
<%@ Register Assembly="SharpPieces.Web.Controls" Namespace="SharpPieces.Web.Controls" TagPrefix="piece" %>

<link href="Content/bootstrap.min.css" rel="stylesheet" /> 
<link href="css/gui_layout.css" rel="stylesheet" />
<link href="css/gui_button.css" rel="stylesheet" />
<link href="https://raw.githubusercontent.com/chinchang/hint.css/master/hint.css" rel="stylesheet" />

<script src="Scripts/bootstrap.min.js"></script>

<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />

<asp:Panel ID="Panel3" runat="server" Visible="False" meta:resourcekey="Panel3Resource1" cssclass="alignCenter">

    <asp:ListView ID="GridView2" runat="server" DataKeyNames="User_Id,User_Name" OnItemCommand="GridView2_ItemCommand">
              <ItemTemplate>
                   <asp:Button CssClass="button1columns" ID="Bfavorite"   runat="server" Text='<%# Eval("User_Name").ToString() %>' Visible="true" />
        </ItemTemplate>
    </asp:ListView>

</asp:Panel>

<asp:Panel ID="MainMenuPanel" runat="server" Visible="true" meta:resourcekey="MainMenuPanelResource1" cssclass="alignCenter">
    <div class="container-fluid">
        <div class="row">
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_FindSingerButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_FindSingerButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_findsinger.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="歌星點歌" meta:resourcekey="MainMenu_FindSingerButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_FindLangButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_FindLangButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_findlang.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="語系點歌" meta:resourcekey="MainMenu_FindLangButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_QuerySongButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_QuerySongButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_querysong.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="搜尋歌曲" meta:resourcekey="MainMenu_QuerySongButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_WordCountButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_WordCountButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_wordcount.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="字數點歌" meta:resourcekey="MainMenu_WordCountButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_ChorusSongButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_ChorusSongButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_chorussong.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="合唱歌曲" meta:resourcekey="MainMenu_ChorusSongButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_NewSongButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_NewSongButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_newsong.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="新進歌曲" meta:resourcekey="MainMenu_NewSongButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_TopSongButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_TopSongButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_topsong.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="排行歌曲" meta:resourcekey="MainMenu_TopSongButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_FavoriteSongButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_FavoriteSongButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_favoritesong.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="我的最愛" meta:resourcekey="MainMenu_FavoriteSongButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="MainMenu_SongNumberButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="MainMenu_SongNumberButton_Click">
                    <asp:Image ImageUrl="images/mainmenu_songnumber.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="編號點歌" meta:resourcekey="MainMenu_SongNumberButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Panel>


<asp:Panel ID="SingerTypePanel" runat="server" Visible="false" meta:resourcekey="SingerPanelResource1" cssclass="alignCenter">
    <div class="container-fluid">
        <div class="row">
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="SingerTypeMaleButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_male.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="男星" meta:resourcekey="SingerTypeMaleButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="SingerTypeFemaleButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_female.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="女星" meta:resourcekey="SingerTypeFemaleButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 5px 5px;">
                <asp:LinkButton ID="SingerTypeGroupButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_group.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="團體" meta:resourcekey="SingerTypeGroupButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <!-- Desktop / Tablet -->
            <div class="SingerTypeListDiv hidden-xs hidden-sm">
                <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding: 0px;">
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeMaleDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None" aria-haspopup="true" aria-expanded="false">
                            <asp:Image ImageUrl="images/singertype_male.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="男星" meta:resourcekey="SingerTypeMaleButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeFemaleDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None">
                            <asp:Image ImageUrl="images/singertype_female.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="女星" meta:resourcekey="SingerTypeFemaleButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeGroupDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None">
                            <asp:Image ImageUrl="images/singertype_group.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="團體" meta:resourcekey="SingerTypeGroupButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding: 0px;">
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeForeignMaleDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None">
                            <asp:Image ImageUrl="images/singertype_foreignmale.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="外男" meta:resourcekey="SingerTypeForeignMaleDesktopButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeForeignFemaleDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None">
                            <asp:Image ImageUrl="images/singertype_foreignfemale.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="外女" meta:resourcekey="SingerTypeForeignFemaleDesktopButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeForeignGroupDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None">
                            <asp:Image ImageUrl="images/singertype_foreigngroup.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="外團" meta:resourcekey="SingerTypeForeignGroupDesktopButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding: 0px;">
                    <div class ="hidden-xs hidden-sm col-md-4 col-lg-4" style="padding-left: 5px; padding-right: 5px;">
                        <asp:LinkButton ID="SingerTypeOtherDesktopButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click" BorderStyle="None">
                            <asp:Image ImageUrl="images/singertype_other.png" runat="server" CssClass="MainMenuImage"/>
                            <asp:Label runat="server" Text="其它" meta:resourcekey="SingerTypeOtherButton_RES" CssClass="MainMenuLabel"/>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 5px;">
                <asp:LinkButton ID="SingerTypeForeignMaleButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_foreignmale.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="外國男星" meta:resourcekey="SingerTypeForeignMaleButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 5px;">
                <asp:LinkButton ID="SingerTypeForeignFemaleButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_foreignfemale.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="外國女星" meta:resourcekey="SingerTypeForeignFemaleButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 5px;">
                <asp:LinkButton ID="SingerTypeForeignGroupButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_foreigngroup.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="外國團體" meta:resourcekey="SingerTypeForeignGroupButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 5px;">
                <asp:LinkButton ID="SingerTypeOtherButton" runat="server" CssClass="MainMenuButton btn btn-success btn-lg" OnClick="SingerTypeButton_Click">
                    <asp:Image ImageUrl="images/singertype_other.png" runat="server" CssClass="MainMenuImage"/>
                    <asp:Label runat="server" Text="其它" meta:resourcekey="SingerTypeOtherButton_RES" CssClass="MainMenuLabel"/>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Panel>


<asp:Panel ID="SingerListPanel" runat="server" Visible="False" meta:resourcekey="SingerListPanelResource1">
    <div class="container-fluid">
        <div class="row">
            <asp:ListView ID="SingerListView" runat="server" DataKeyNames="Singer_Name,Singer_Type" OnPagePropertiesChanged="SingerListView_PagePropertiesChanged">
                <ItemTemplate>
                    <div class ="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding: 0px 5px 10px 5px;">
                        <asp:LinkButton ID="SingerListButton" runat="server" CssClass="SingerListButton btn btn-success btn-lg" OnClick="SingerListButton_Click" data-toggle="tooltip" data-placement="top" title='<%# Eval("Singer_Name").ToString() %>' CommandArgument='<%# Eval("Singer_Name").ToString() %>'>
                            <asp:Label runat="server" Text='<%# Eval("Singer_Name").ToString() %>' CssClass="SingerListLabel" Font-Size='<%# Eval("Singer_Name").ToString().Length > 5 ? FontUnit.Empty : FontUnit.Medium %>' />
                            <div class="SingerListBox">
                                <asp:Image ImageUrl='<%# Eval("ImgFileUrl").ToString() %>' runat="server" CssClass="SingerListImage" />
                            </div>
                        </asp:LinkButton>
                    </div>
                    <!-- Desktop / Tablet -->
                    <div class ="hidden-xs hidden-sm col-md-2 col-lg-2" style="padding: 5px 5px 5px 5px;">
                        <asp:LinkButton ID="SingerListDesktopButton" runat="server" CssClass="SingerListButton btn btn-success btn-lg" OnClick="SingerListButton_Click" data-toggle="tooltip" data-placement="top" title='<%# Eval("Singer_Name").ToString() %>' CommandArgument='<%# Eval("Singer_Name").ToString() %>'>
                            <asp:Label runat="server" Text='<%# Eval("Singer_Name").ToString() %>' CssClass="SingerListLabel" Font-Size='<%# Eval("Singer_Name").ToString().Length > 5 ? FontUnit.Empty : FontUnit.Medium %>' />
                            <div class="SingerListBox">
                                <asp:Image ImageUrl='<%# Eval("ImgFileUrl").ToString() %>' runat="server" CssClass="SingerListImage" />
                            </div>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="SingerListDataPager" runat="server" PagedControlID="SingerListView">
                <Fields>
                    <asp:TemplatePagerField OnPagerCommand="SingerListDataPager_OnPagerCommand">
                        <PagerTemplate>
                            <div class="SingerListPagerDiv">
                            <asp:LinkButton ID="FirstPageButton" runat="server" CssClass='<%# Container.StartRowIndex > 0 ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="First">
                                <span class="glyphicon glyphicon-step-backward"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="PreviewPageButton" runat="server" CssClass='<%# Container.StartRowIndex > 0 ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Previous">
                                <span class="glyphicon glyphicon-backward"></span>
                            </asp:LinkButton>

                            第<asp:Label ID="lblcurPage" runat="server" Text='<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>' />頁 /
                            共<asp:Label ID="lblPageCount" runat="server" Text='<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>' />頁

                            <asp:LinkButton ID="NextPageButton" runat="server" CssClass='<%# (Container.StartRowIndex + Container.PageSize) < Container.TotalRowCount ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Next">
                                <span class="glyphicon glyphicon-forward"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LastPageButton" runat="server" CssClass='<%# (Container.StartRowIndex + Container.PageSize) < Container.TotalRowCount ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Last" CommandArgument="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>">
                                <span class="glyphicon glyphicon-fast-forward"></span>
                            </asp:LinkButton>
                        </div>        
                        </PagerTemplate>
                    </asp:TemplatePagerField>
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Panel>


<asp:Panel ID="SongListPanel" runat="server" Visible="False" meta:resourcekey="SongListPanelResource1">
    <asp:GridView ID="SongListGridView" runat="server" DataKeyNames="Song_Id,Song_Singer" AutoGenerateColumns="False" BackColor="White" BorderColor="#006600" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" CssClass="gridview" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="10" OnPageIndexChanging="SongListGridView_PageIndexChanging" OnPreRender="SongListGridView_PreRender"  EnableSortingAndPagingCallbacks="True" ShowHeaderWhenEmpty="True" meta:resourcekey="GridView1Resource1">
        <AlternatingRowStyle BackColor="#d9ffd9" />
        <Columns>
            <asp:TemplateField ShowHeader="False" ItemStyle-Width="44px">
                <ItemTemplate>
                    <asp:LinkButton ID="SongListAddSong" runat="server" CssClass='<%# Eval("Song_SongName").ToString()!="" ? "GridViewButton btn btn-success btn-lg" : "GridViewButton btn btn-success btn-lg disabled" %>' OnClick="SongListAddSong_Click">
                        <span class="glyphicon glyphicon-plus"></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False" ItemStyle-Width="32px">
                <ItemTemplate>
                    <asp:Label ID="lSong_Lang" runat="server" Text='<%# Eval("Song_Lang").ToString().Substring(0,1) %>' ForeColor="#0026ff" /></p>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle CssClass="dgLang" HorizontalAlign="Center"/>
            </asp:TemplateField>

            <asp:BoundField HeaderText="Song_Id" DataField="Song_Id" Visible="False" meta:resourcekey="BoundFieldResource2" />
                            
            <asp:TemplateField HeaderText="Song" InsertVisible="False" meta:resourcekey="BoundFieldResource3">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Song_SongName").ToString() %>' CssClass="dgSong" />
                    <p><asp:LinkButton ID="SongListQuerySinger" runat="server" Text='<%# Eval("Song_Singer").ToString() %>' CssClass="dgSinger dgSingerbutton" OnClick="SongListQuerySinger_Click" /></p>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" CssClass="dgSong" />
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False" ItemStyle-Width="44px">
                <ItemTemplate>
                    <asp:LinkButton ID="SongListInsSong" runat="server" CssClass='<%# Eval("Song_SongName").ToString()!="" ? "GridViewButton btn btn-success btn-lg" : "GridViewButton btn btn-success btn-lg disabled" %>' OnClick="SongListInsSong_Click">
                        <span class="glyphicon glyphicon-arrow-up"></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>


                        <PagerTemplate>
                            <asp:LinkButton ID="SongListFirstPageButton" runat="server" CssClass='<%# ((GridView)Container.Parent.Parent).PageIndex!=0 ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Page" CommandArgument="First">
                                <span class="glyphicon glyphicon-step-backward"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="SongListPreviewPageButton" runat="server" CssClass='<%# ((GridView)Container.Parent.Parent).PageIndex!=0 ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Page" CommandArgument="Prev">
                                <span class="glyphicon glyphicon-backward"></span>
                            </asp:LinkButton>
                            
                            第<asp:Label ID="SongListlblcurPage" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1 %>' />頁 /
                            共<asp:Label ID="SongListlblPageCount" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageCount %>' />頁
    
                            <asp:LinkButton ID="SongListNextPageButton" runat="server" CssClass='<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Page" CommandArgument="Next">
                                <span class="glyphicon glyphicon-forward"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="SongListLastPageButton" runat="server" CssClass='<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 ? "GridViewPageButton btn btn-success btn-lg" : "GridViewPageButton btn btn-success btn-lg disabled" %>' BorderStyle="None" CommandName="Page" CommandArgument="Last">
                                <span class="glyphicon glyphicon-fast-forward"></span>
                            </asp:LinkButton>
                            <div class="hidden-xs hidden-sm" style="display:inline-block">
                                到 <asp:DropDownList ID="SongListddlSelectPage" runat="server" CssClass="GridViewPageButton btn btn-primary dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="SongListddlSelectPage_SelectedIndexChanged" /> 頁
                            </div>
                        </PagerTemplate>
                
        <FooterStyle CssClass="gridviewPager" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="gridviewHeader" Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="gridviewPager" Font-Bold="True" ForeColor="White" />
        <RowStyle CssClass="gridviewRows" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:HiddenField ID="findCaller" runat="server" />
</asp:Panel>