﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gui_default.aspx.cs" Inherits="web.gui_default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/gui_songNumber.ascx" TagPrefix="uc1" TagName="gui_songNumber" %>
<%@ Register Src="~/gui_currentList.ascx" TagName="gui_currentList" TagPrefix="uc2" %>
<%@ Register Src="~/gui_video.ascx" TagPrefix="uc3" TagName="gui_video" %>
<%@ Register Src="~/gui_volume.ascx" TagPrefix="uc4" TagName="gui_volume" %>
<%@ Register Src="~/gui_find.ascx" TagPrefix="uc0" TagName="gui_find" %>
<%@ Register Src="~/gui_tune.ascx" TagPrefix="uc5" TagName="gui_tune" %>
<%@ Register Src="~/gui_advanced.ascx" TagPrefix="uc6" TagName="gui_advanced" %>
<%@ Register Src="~/ErrorDeadWCF.ascx" TagPrefix="uc7" TagName="wcferror" %>










<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="/images/crazyktv.png" />
    <link rel="apple-touch-icon-precomposed" href="/images/crazyktv.png" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--Mobile specific meta goodness-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1" />
    <!-- Adding "maximum-scale=1" fixes the Mobile Safari auto-zoom bug: http://filamentgroup.com/examples/iosScaleBug/ -->

    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 
    <link href="css/gui_layout.css" rel="stylesheet" />
    <link href="css/gui_button.css" rel="stylesheet" />
    <link href="css/gui_overlay.css" rel="stylesheet" />

    <!--[if lt IE 9]>
        <script src="Scripts/respond.min.js"></script>
        <script src="Scripts/html5shiv.min.js"></script>
    <![endif]-->

    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.watermark.js"></script>
    <script src="Scripts/hammer.js"></script>
    <script src="Scripts/jquery.specialevent.hammer.js"></script>

    <meta charset="utf-8" />
    <title>CrazyKTV</title>
</head>

<body dir='<asp:Literal ID="Literal1" runat="server" Text="<%$Resources: GlobalMessages, directionltr %>"></asp:Literal>'>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="True">
        </asp:ScriptManager>

        <!-- Responsive Bootstrap Toolkit -->
        <script src="Scripts/bootstrap-toolkit.min.js"></script>
        <!-- Your scripts using Responsive Bootstrap Toolkit -->
        <script src="Scripts/bootstrap-toolkit.main.js"></script>

        <script type="text/javascript">

            $(document).ready(function () {
                AfterPostBack();
                // You are calling this function the page loads for the first time
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(AfterPostBack);

                //  EndRequest added on endRequest of Postback..  This is when the page pots back..
                // Called when postback occurs

            });

            function toggleFullScreen() {
                if (!document.fullscreenElement &&    // alternative standard method
                    !document.mozFullScreenElement && !document.webkitFullscreenElement && !document.msFullscreenElement) {  // current working methods
                    if (document.documentElement.requestFullscreen) {
                        document.documentElement.requestFullscreen();
                    } else if (document.documentElement.msRequestFullscreen) {
                        document.documentElement.msRequestFullscreen();
                    } else if (document.documentElement.mozRequestFullScreen) {
                        document.documentElement.mozRequestFullScreen();
                    } else if (document.documentElement.webkitRequestFullscreen) {
                        document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
                    }
                } else {
                    if (document.exitFullscreen) {
                        document.exitFullscreen();
                    } else if (document.msExitFullscreen) {
                        document.msExitFullscreen();
                    } else if (document.mozCancelFullScreen) {
                        document.mozCancelFullScreen();
                    } else if (document.webkitExitFullscreen) {
                        document.webkitExitFullscreen();
                    }
                }
            }

            var AfterPostBack = function () {
                // You write your code here to assign Data
                if ($('#ddlanguage').val() == "en-US")
                { $('#tSearch').watermark('All Songs'); }
                else { $('#tSearch').watermark('全部歌曲'); }

                if ($('#findCaller').val() == "toTop") {
                    $("html, body").animate({ scrollTop: 0 }, "slow");
                    //return false;
                }

                $(document).ready(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                    if ($('#Showsuball').val() == "0")
                    { Hidesuball(); }
                    else { Showsuball(); }
                })

                $("#up").click(function () {
                    Showsuball();
                });

                $("#down").click(function () {
                    Hidesuball();
                });

                $(".arrowSpacer").click(function () {
                    Hidesuball();
                });
                
                function Showsuball() {
                    $("#suball").css("display", "block");
                    $("#BottomVisibleDiv").animate({ bottom: ($("#BottomVisibleDiv").height() / 5) - ($("#BottomVisibleDiv").height() / 5) + 'px' }, "fast");
                    $("#down").css("display", "inline-block");
                    $("#up").css("display", "none");
                    $('#Showsuball').val("1");
                }

                function Hidesuball()
                {
                    $("#BottomVisibleDiv").css("bottom", "0px")
                    //$("#BottomVisibleDiv").animate({ bottom: '-0px' }, "fast");
                    $("#up").css("display", "inline-block");
                    $("#down").css("display", "none");
                    $("#suball").css("display", "none");
                    $('#Showsuball').val("0");
                }


                $('#ddSearchType').change(function () {
                    var _value = $('#ddSearchType').val();
                    if (_value == "Song" || _value == "Singer" || _value == "WordCount") {
                        $('#tSearch').show();
                    }
                    else if (_value.toLowerCase().indexOf("---") >= 0) {
                        $('#tSearch').hide();
                    }
                    else {
                        $('#tSearch').hide();
                        $('#bSearch').click();
                    }

                });

                $('#ddSearchType').ready(function () {
                    var _value = $('#ddSearchType').val();
                    if (_value == "Song" || _value == "Singer" || _value == "WordCount") {
                        $('#tSearch').show();
                    }
                    else {
                        $('#tSearch').hide();
                    }
                });

                //touch events

                function hammerLog(event) {
                    event.preventDefault();

                    if (event.direction == "down") {
                        Hidesuball();
                    }
                    else if (event.direction == "up")
                        {
                        Showsuball();
                     }
                }

                $("#BottomVisibleDiv").children('*').on('swipe', hammerLog);
                $("#BottomVisibleDiv").on('swipe', hammerLog);
                $("#suball").children('*').on('swipe', hammerLog);
                $("#suball").on('swipe', hammerLog);
                return false;
            }
        </script>
        
        <asp:HiddenField ID="Showsuball" runat="server" Value="0" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <header id="masterheader">
                    <section>
                        <nav class="navbar navbar-fixed-top">
                            <div id="HeaderVisibleDiv">
                                <div class ="container">
                                    <div class="row">
                                        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                            <div class="col-xs-3 col-sm-3 col-md-1 col-lg-1" style="padding: 0px;">
                                                <asp:Image ID="CrazyKTVLogo" ImageUrl="images/main_crazyktv.png" runat="server" CssClass="MainImage"/>
                                            </div>
                                            <div class="col-xs-3 col-sm-3 hidden-md hidden-lg">
                                                <asp:ImageButton ID="PlayListButton" ImageUrl="images/main_playlist.png" runat="server" CssClass="MainButton"  OnClick="PlayListButton_Click"/>
                                            </div>
                                            <div class="col-xs-3 col-sm-3 hidden-md hidden-lg">
                                                <asp:ImageButton ID="FindSongButton" ImageUrl="images/main_findsong.png" runat="server" CssClass="MainButton" OnClick="FindSongButton_Click"/>
                                            </div>
                                            <div class="col-xs-3 col-sm-3 hidden-md hidden-lg">
                                                <asp:ImageButton ID="AdvancedButton" ImageUrl="images/main_advanced.png" runat="server" CssClass="MainButton" OnClick="AdvancedButton_Click"/>
                                            </div>
                                            <!-- Desktop / Tablet -->
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_FindSingerDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_findsinger_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="歌星" meta:resourcekey="MainMenu_FindSinger_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_FindLangDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_findlang_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="語系" meta:resourcekey="MainMenu_FindLangButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_QuerySongDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_querysong_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="搜尋" meta:resourcekey="MainMenu_QuerySongButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_WordCountDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_wordcount_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="字數" meta:resourcekey="MainMenu_WordCountButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_ChorusSongDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_chorussong_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="合唱" meta:resourcekey="MainMenu_ChorusSongButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_NewSongDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_newsong_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="新進" meta:resourcekey="MainMenu_NewSongButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_TopSongDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_topsong_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="排行" meta:resourcekey="MainMenu_TopSongButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_FavoriteSongDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_favoritesong_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="最愛" meta:resourcekey="MainMenu_FavoriteSongButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 3px; padding-right: 3px;">
                                                <asp:LinkButton ID="MainMenu_SongNumberDesktopButton" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="MainMenu_Desktop_Button_Click">
                                                    <asp:Image ImageUrl="images/mainmenu_songnumber_small.png" runat="server" CssClass="MainMenuMinImage"/>
                                                    <asp:Label runat="server" Text="編號" meta:resourcekey="MainMenu_SongNumberButton_RES"/>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding: 0px;">
                                            <asp:LinkButton ID="ToggleFullScreenButton" runat="server" CssClass="MainMinButton navbar-right" OnClientClick="javascript:toggleFullScreen()" style="text-shadow: black 1px 1px 2px;">
                                                <span class="glyphicon glyphicon-fullscreen"></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </section>
                </header>
                
                <article id="mainarea">
                    <section>
                        <div class="spacerToTop"/>
                        <div class="container">
                            <div class ="row">
                                <div class="hidden-md hidden-lg">
                                    <uc1:gui_songNumber runat="server" ID="gui_songNumber" Visible="False" />
                                    <uc2:gui_currentList ID="gui_currentList" runat="server" Visible="False" />
                                    <uc3:gui_video runat="server" ID="gui_video" Visible="False" />
                                    <uc4:gui_volume runat="server" ID="gui_volume" Visible="False" />
                                    <uc5:gui_tune runat="server" ID="gui_tune" Visible="False" />
                                    <uc6:gui_advanced runat="server" ID="gui_advanced" Visible="False" />
                                    <uc0:gui_find runat="server" ID="gui_find" Visible="true" />
                                    <uc7:wcferror runat="server" ID="wcferror" Visible="False" />
                                </div>
                            </div>
                        </div>
                        <!-- Desktop / Tablet -->
                        <div class="container">
                            <div class ="row">
                                <div class="hidden-xs hidden-sm col-md-5 col-lg-5" style="padding-left: 5px; padding-right: 5px;">
                                        <uc2:gui_currentList ID="gui_currentListDesktop" runat="server" Visible="true" />

                                    
                                    
                                    
                                </div>
                            
                                <div class="hidden-xs hidden-sm col-md-7 col-lg-7" style="padding-left: 5px; padding-right: 5px;">
                                    <uc0:gui_find runat="server" ID="gui_findDesktop" Visible="true" />
                                </div>
                            
                            
                                
                            </div>
                        </div>

                        <div class="spacerToFooter" />
                    </section>
                </article>

                <nav id="BottomNav" class="navbar navbar-fixed-bottom">
                    <div id="BottomVisibleDiv">
                        <div class ="container">
                            <div class="row">
                                <div class="col-xs-11 col-sm-11 col-md-12 col-lg-12" style="padding-left: 5px; padding-right: 5px;">
                                    <div class="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BChannel" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BChannel_Click">
                                            <span class="glyphicon glyphicon-user"></span>
                                            <asp:Label runat="server" Text="導唱" meta:resourcekey="BChannelResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BFind" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BFind_Click">
                                            <span class="glyphicon glyphicon-th-list"></span>
                                            <asp:Label runat="server" Text="點歌" meta:resourcekey="BFindResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 hidden-md hidden-lg" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BCut" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BCut_Click" OnClientClick="return confirm('確認切歌?');" style="text-shadow: black 1px 1px 2px;">
                                            <span class="glyphicon glyphicon-ban-circle"></span>
                                            <asp:Label runat="server" Text="切歌" meta:resourcekey="BCutResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <!-- Desktop / Tablet -->
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdPauseDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdPause_Click">
                                            <span class="glyphicon glyphicon-pause"></span>
                                            <asp:Label runat="server" Text="暫停" meta:resourcekey="BdPauseResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BCutDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BCut_Click" OnClientClick="return confirm('確認切歌?');" style="text-shadow: black 1px 1px 2px;">
                                            <span class="glyphicon glyphicon-ban-circle"></span>
                                            <asp:Label runat="server" Text="切歌" meta:resourcekey="BCutResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdRestartDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdRestart_Click">
                                            <span class="glyphicon glyphicon-refresh"></span>
                                            <asp:Label runat="server" Text="重播" meta:resourcekey="BdRestartResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdRepeatDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdRepeat_Click">
                                            <span class="glyphicon glyphicon-repeat"></span>
                                            <asp:Label runat="server" Text="重複" meta:resourcekey="BdRepeatResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdKeyDownDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdKeyDown_Click">
                                            <span class="glyphicon glyphicon-arrow-down"></span>
                                            <asp:Label runat="server" Text="降調" meta:resourcekey="BdKeyDownResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdDefaultPitchDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdDefaultPitch_Click">
                                            <span class="glyphicon glyphicon-music"></span>
                                            <asp:Label runat="server" Text="原調" meta:resourcekey="BdDefaultPitchResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdKeyUpDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdKeyUp_Click">
                                            <span class="glyphicon glyphicon-arrow-up"></span>
                                            <asp:Label runat="server" Text="升調" meta:resourcekey="BdKeyUpResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdVolumeDownDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdVolumeDown_Click">
                                            <span class="glyphicon glyphicon-volume-down"></span>
                                            <asp:Label runat="server" Text="小聲" meta:resourcekey="BdVolumeDownResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdMuteDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdMute_Click">
                                            <span class="glyphicon glyphicon-volume-off"></span>
                                            <asp:Label runat="server" Text="靜音" meta:resourcekey="BdMuteResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdVolumeUpDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdVolumeUp_Click">
                                            <span class="glyphicon glyphicon-volume-up"></span>
                                            <asp:Label runat="server" Text="大聲" meta:resourcekey="BdVolumeUpResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BdFixedCHDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdFixedCH_Click">
                                            <span class="glyphicon glyphicon-lock"></span>
                                            <asp:Label runat="server" Text="固定" meta:resourcekey="BdFixedCHResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="hidden-xs hidden-sm col-md-1 col-lg-1" style="padding-left: 5px; padding-right: 5px;">
                                        <asp:LinkButton ID="BChannelDesktop" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BChannel_Click">
                                            <span class="glyphicon glyphicon-user"></span>
                                            <asp:Label runat="server" Text="導唱" meta:resourcekey="BChannelResource1"/>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-sm-1 hidden-md hidden-lg" style="padding: 0px;">
                                    <span id="up" class="glyphicon glyphicon-chevron-up" style="font-size: 24px; width: 100%; padding-top: 20px; padding-bottom: 20px;"></span>
                                    <span id="down" class="glyphicon glyphicon-chevron-down" style="font-size: 24px; width: 100%; padding-top: 20px; padding-bottom: 20px;"></span>
                                </div>
                            </div>
                        </div>

                        <div id="all" style="height: 0px;" class="hidden-md hidden-lg">
                            <div id="suball" class="container" style="display: none;">
                                <div class="row">
                                    <div class="col-xs-11 col-sm-11 col-md-11" style="padding-left: 5px; padding-right: 5px;">
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdFixedCH" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdFixedCH_Click">
                                                <span class="glyphicon glyphicon-lock"></span>
                                                <asp:Label runat="server" Text="固定" meta:resourcekey="BdFixedCHResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdSongRecoed" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdSongRecoed_Click">
                                                <span class="glyphicon glyphicon-log-in"></span>
                                                <asp:Label runat="server" Text="記錄" meta:resourcekey="BdSongRecoedResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdPause" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdPause_Click">
                                                <span class="glyphicon glyphicon-pause"></span>
                                                <asp:Label runat="server" Text="暫停" meta:resourcekey="BdPauseResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1" style="padding: 0px;">
                                        <span class="glyphicon glyphicon-chevron-down arrowSpacer"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-11 col-sm-11 col-md-11" style="padding-left: 5px; padding-right: 5px;">
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdRestart" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdRestart_Click">
                                                <span class="glyphicon glyphicon-refresh"></span>
                                                <asp:Label runat="server" Text="重播" meta:resourcekey="BdRestartResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdRepeat" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdRepeat_Click">
                                                <span class="glyphicon glyphicon-repeat"></span>
                                                <asp:Label runat="server" Text="重複" meta:resourcekey="BdRepeatResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdRandom" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdRandom_Click">
                                                <span class="glyphicon glyphicon-random"></span>
                                                <asp:Label runat="server" Text="隨機" meta:resourcekey="BdRandomResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1" style="padding: 0px;">
                                        <span class="glyphicon glyphicon-chevron-down arrowSpacer"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-11 col-sm-11 col-md-11" style="padding-left: 5px; padding-right: 5px;">
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdKeyDown" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdKeyDown_Click">
                                                <span class="glyphicon glyphicon-arrow-down"></span>
                                                <asp:Label runat="server" Text="降調" meta:resourcekey="BdKeyDownResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdDefaultPitch" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdDefaultPitch_Click">
                                                <span class="glyphicon glyphicon-music"></span>
                                                <asp:Label runat="server" Text="原調" meta:resourcekey="BdDefaultPitchResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdKeyUp" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdKeyUp_Click">
                                                <span class="glyphicon glyphicon-arrow-up"></span>
                                                <asp:Label runat="server" Text="升調" meta:resourcekey="BdKeyUpResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1" style="padding: 0px;">
                                        <span class="glyphicon glyphicon-chevron-down arrowSpacer"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-11 col-sm-11 col-md-11" style="padding-left: 5px; padding-right: 5px;">
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdVolumeDown" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdVolumeDown_Click">
                                                <span class="glyphicon glyphicon-volume-down"></span>
                                                <asp:Label runat="server" Text="小聲" meta:resourcekey="BdVolumeDownResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdMute" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdMute_Click">
                                                <span class="glyphicon glyphicon-volume-off"></span>
                                                <asp:Label runat="server" Text="靜音" meta:resourcekey="BdMuteResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-xs-4 col-sm-4 col-md-4" style="padding-left: 5px; padding-right: 5px;">
                                            <asp:LinkButton ID="BdVolumeUp" runat="server" CssClass="ControlButton btn btn-success btn-lg" OnClick="BdVolumeUp_Click">
                                                <span class="glyphicon glyphicon-volume-up"></span>
                                                <asp:Label runat="server" Text="大聲" meta:resourcekey="BdVolumeUpResource1"/>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1" style="padding: 0px;">
                                        <span class="glyphicon glyphicon-chevron-down arrowSpacer"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
                
                <asp:HiddenField ID="BootstrapResponsiveMode" runat="server" />
                <asp:HiddenField ID="BrowserScreenMode" runat="server" />
                <asp:HiddenField ID="CurrentSinerType" runat="server" Value="0" />
                <asp:HiddenField ID="CurrentSongQueryType" runat="server" />
                <asp:HiddenField ID="CurrentSongQueryValue" runat="server" />
                <asp:Button ID="RefreshUpdatePanelButton" runat="server" OnClick="RefreshUpdatePanelButton_Click" Style="display: none;" />
                
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="overlay" />
                        <div class="overlayContent" id="overlayContent1">
                            <h2><asp:Label ID="lLoading" runat="server" Text="Loading..." meta:resourcekey="lLoadingResource1"/></h2>
                            <img src="/images/ajax-loader.gif" alt="Loading" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>