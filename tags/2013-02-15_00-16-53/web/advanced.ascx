﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="advanced.ascx.cs" Inherits="web.advanced" %>
<link href="css/layout.css" rel="stylesheet" />
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
  <section>
      <article>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
               <asp:Button ID="Random" runat="server" Text="Random" CssClass="button1" meta:resourcekey="RandomResource1" OnClick="Random_Click" /> 
                <asp:Button ID="ShowTime" runat="server" Text="Show Count Time" CssClass="button1" meta:resourcekey="ShowTimeResource1"/>
                <asp:Button ID="HideConsole" runat="server" Text="Hide Console" CssClass="button1" meta:resourcekey="HideConsoleResource1" />
                <p/><hr style="
    height: 5PX;
    background-color: rgb(73, 72, 72);
    color: rgb(73, 72, 72);
"/>
                <div style="flex-align:center; text-align:center">

                    <asp:Label ID="LToFriend" runat="server" Text="QR to Share with Friends:" CssClass="displayBlock" meta:resourcekey="LToFriendResource1"></asp:Label>
                    <asp:Image ID="ImageQR" runat="server" ImageUrl="GenImage.ashx" Height="160px" Width="160px" CssClass="displayBlock" meta:resourcekey="ImageQRResource1" />
                </div>
                
                <hr style="
    height: 5PX;
    background-color: rgb(73, 72, 72);
    color: rgb(73, 72, 72);
"/>
                <asp:Button ID="Exit" runat="server" Text="Exit" CssClass="button1" OnClick="Exit_Click" meta:resourcekey="ExitResource1"  />
                <asp:Button ID="Close" runat="server" Text="Close" CssClass="button1" OnClick="Close_Click" meta:resourcekey="CloseResource1"  />
            </asp:Panel>
        </ContentTemplate>
        
    </asp:UpdatePanel>

       </article>
   </section>


