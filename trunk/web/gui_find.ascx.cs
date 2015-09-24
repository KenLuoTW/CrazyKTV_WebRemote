﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Drawing.Imaging;

namespace web
{
    public partial class gui_find : System.Web.UI.UserControl
    {
        public void EnableMainMenuPanel()
        {
            hideAllGridViewPanel();
            MainMenuPanel.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


/*
        private void songList(int page, int rows)
        {
            findCaller.Value = "toTop";
            //pre-set
            hideAllGridViewPanel();
            SongListPanel.Visible = true;


            int currentPageNumber  = page;
            int rowsPerPage = rows;
            try
            {
                string jsonText = "";
                gvMode.Value = "";

                if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "Song".ToLower())
                {

                    jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_SongName like '%" + tSearch.Text.ToString().Trim() + "%'", currentPageNumber, rowsPerPage, "Song_WordCount,Song_SongStroke,Song_SongName"); //more than 2000 per rows will be super slow
                }
                else if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "Singer".ToLower())
                {
                    jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_Singer like '%" + tSearch.Text.ToString().Trim() + "%'", page, rows, "Song_Singer, Song_WordCount,Song_SongStroke, Song_SongName"); //more than 2000 per rows will be super slow
                
                }
                else if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "NewSongs".ToLower())
                {
                    tSearch.Text = "";
                    jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_CreatDate >= '" + DateTime.Now.AddDays(-120).ToString("yyyy/MM/dd") + "'", currentPageNumber, rowsPerPage, "Song_CreatDate desc, Song_SongName"); //more than 2000 per rows will be super slow
                }
                else if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "chorus".ToLower())
                {
                    jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_SingerType=3", currentPageNumber, rowsPerPage, "Song_WordCount,Song_SongStroke, Song_SongName, Song_Singer, Song_CreatDate desc"); //more than 2000 per rows will be super slow
                    tSearch.Text = "";
                }
                else if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "wordcount".ToLower())
                {
                    if (tSearch.Text.ToString().Trim().Length > 0)
                    {
                        jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_WordCount=" + tSearch.Text.ToString().Trim(), currentPageNumber, rowsPerPage, "Song_WordCount,Song_SongStroke,Song_SongName,Song_CreatDate desc"); //more than 2000 per rows will be super slow
                    }
                    else {
                        jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_Singer like '%'", currentPageNumber, rowsPerPage, "Song_WordCount,Song_SongStroke,Song_SongName,Song_CreatDate desc"); //more than 2000 per rows will be super slow
                   
                    }
                }
                else if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "toporder".ToLower())
                {
                    jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_PlayCount >= 1 ", currentPageNumber, rowsPerPage, "Song_PlayCount desc, Song_CreatDate desc, Song_SongStroke, Song_SongName"); //more than 2000 per rows will be super slow
                    tSearch.Text = "";
                }
                else if (ddSearchType.SelectedValue.ToString().Trim().ToLower() == "Favorites".ToLower())
                {
                    tSearch.Text = "";
                    hideAllGridViewPanel();
                    Panel3.Visible = true;

                    jsonText = CrazyKTVWCF.FavoriteUser(0, 200);

                    DataTable dt2 = GlobalFunctions.JsontoDataTable(jsonText);

                    DataView dv2 = new DataView(dt2);
                    //dv.Sort = "Song_Singer asc, Song_SongName asc, Song_Id asc";

                    GridView2.DataSource = dv2;
                    GridView2.DataBind();

                }

                //jsonText = jsonText.TrimStart('"');
                //jsonText = jsonText.TrimEnd('"');
                //jsonText = Regex.Replace(jsonText, @"\\""", @"""");

                try
                {
                    DataTable dt = GlobalFunctions.JsontoDataTable(jsonText);

                    DataView dv = new DataView(dt);
                    //dv.Sort = "Song_Singer asc, Song_SongName asc, Song_Id asc";

                    GridView1.DataSource = dv;
                    GridView1.DataBind();

                    if (dv.Count == rows)
                    {
                        BNext.Visible = true;
                        if (page > 0)
                        {
                            BPrevious.Visible = true;
                        }
                        else
                        {
                            BPrevious.Visible = false;
                        }

                    }
                    else
                    {
                        BNext.Visible = false;
                        if (page > 0)
                        {
                            BPrevious.Visible = true;
                        }
                        else
                        {
                            BPrevious.Visible = false;
                        }
                    }

                    
                }
                catch { }

               
                


            }
            catch { }

            //  GlobalFunctions.DerializetoDataTable(); //test data
           

        }
        */

        //protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    //clean up data on display
        //    GridView1.DataSource = null;
        //    GridView1.DataBind();
        //    tSearch.Text = "";
        //    hideAllGridViewPanel();
        //    SongListPanel.Visible = true;
        //    BNext.Visible = false;
        //    BPrevious.Visible = false;
        //    songDGpage.Value = "0";
        //    LPageNumCount.Text = "1";

        //    var data = GridView2.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]; //get DataKeyNames="User_ID"
        //    gvMode.Value = data.ToString();
        //    FSongList(0, 100, data.ToString());
        //}


        //protected void Bfavorite_Click(object sender, EventArgs e)
        //{
        //    //clean up data on display
        //    GridView1.DataSource = null;
        //    GridView1.DataBind();
        //    tSearch.Text = "";
        //    hideAllGridViewPanel();
        //    SongListPanel.Visible = true;
        //    BNext.Visible = false;
        //    BPrevious.Visible = false;
        //    songDGpage.Value = "0";
        //    LPageNumCount.Text = "1";


        //    //LocationID = Me.MyListView.DataKeys(currentItem.DataItemIndex)("LocationID")

        //    //var data = this.GridView2.DataKeys( ((Button)sender).Text.ToString(); //get DataKeyNames="User_ID"
        //    //gvMode.Value = data.ToString();
        //    //FSongList(0, 100, data.ToString());
        //}



        private void FSongList(int page, int rows, string user)
        {
            if (user.Length > 0)
            {
                CrazyKTVWCF.FavoriteLogin(user.ToString()); //need to login first to see favoritesongs
            }

            string jsonText = CrazyKTVWCF.FavoriteSong(user.ToString().Trim(), page, rows);

            DataTable dt3 = GlobalFunctions.JsontoDataTable(jsonText);
            DataView dv3 = new DataView(dt3);
            //dv.Sort = "Song_Singer asc, Song_SongName asc, Song_Id asc";

            SongListGridView.DataSource = dv3;
            SongListGridView.DataBind();

        }

        protected void hideAllGridViewPanel()
        {
            MainMenuPanel.Visible = false;
            SingerListPanel.Visible = false;
            SongListPanel.Visible = false;
            Panel3.Visible = false;

            if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Mobile"))
            {
                SingerTypePanel.Visible = false;
                SongLangPanel.Visible = false;
            }
        }

        private void SongList(int page, int rows, string QueryType, string QueryValue)
        {
            ((HiddenField)this.Parent.FindControl("CurrentSongQueryType")).Value = QueryType;
            ((HiddenField)this.Parent.FindControl("CurrentSongQueryValue")).Value = QueryValue;

            string jsonText = "";
            string dvSortStr = "";
            DataTable dt = new DataTable();

            if (GuiGlobal.AllSongDTStatus == false)
            {
                switch (QueryType)
                {
                    case "Singer":
                        jsonText = CrazyKTVWCF.QuerySong(null, null, null, "Song_Singer like '%" + QueryValue.Trim() + "%'", page, rows, "Song_WordCount,Song_SongStroke,Song_SongName");
                        dvSortStr = "Song_WordCount, Song_SongStroke, Song_SongName";
                        break;
                    case "SongLang":
                        jsonText = CrazyKTVWCF.QuerySong(QueryValue, null, null, null, page, rows, "Song_WordCount,Song_SongStroke,Song_SongName,Song_Singer");
                        dvSortStr = "Song_WordCount, Song_SongStroke, Song_SongName, Song_Singer";
                        break;
                }
                dt = GlobalFunctions.JsontoDataTable(jsonText);
            }
            else
            {
                dt = GuiGlobal.AllSongDT.Clone();

                switch (QueryType)
                {
                    case "Singer":
                        dvSortStr = "Song_WordCount, Song_SongStroke, Song_SongName";
                        var SingerQuery = from row in GuiGlobal.AllSongDT.AsEnumerable()
                                    where row.Field<string>("Song_Singer").Equals(QueryValue) ||
                                          row.Field<string>("Song_Singer").StartsWith(QueryValue + "&") ||
                                          row.Field<string>("Song_Singer").EndsWith("&" + QueryValue)
                                    select row;
                        if (SingerQuery.Count<DataRow>() > 0)
                        {
                            foreach (DataRow row in SingerQuery)
                            {
                                dt.ImportRow(row);
                            }
                        }
                        break;
                    case "SongLang":
                        dvSortStr = "Song_WordCount, Song_SongStroke, Song_SongName, Song_Singer";
                        var SongLangQuery = from row in GuiGlobal.AllSongDT.AsEnumerable()
                                    where row.Field<string>("Song_Lang").Equals(QueryValue)
                                    select row;
                        if (SongLangQuery.Count<DataRow>() > 0)
                        {
                            foreach (DataRow row in SongLangQuery)
                            {
                                dt.ImportRow(row);
                            }
                        }
                        break;
                }
            }

            DataView dv = new DataView(dt);
            dv.Sort = dvSortStr;
            dt = dv.ToTable();
            
            // Desktop / Tablet Mode
            if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Desktop"))
            {
                if (dt.Rows.Count == 0 && GuiGlobal.AllSongDTStatus == false)
                {
                    DataColumn col = new DataColumn("Song_Id");
                    dt.Columns.Add(col);
                    col = new DataColumn("Song_Lang");
                    dt.Columns.Add(col);
                    col = new DataColumn("Song_SongName");
                    dt.Columns.Add(col);
                    col = new DataColumn("Song_Singer");
                    dt.Columns.Add(col);
                }

                int CurPageSize = SongListGridView.PageSize;
                if (dt.Rows.Count > CurPageSize)
                {
                    if (dt.Rows.Count % CurPageSize > 0)
                    {
                        int NewRowCount = CurPageSize - (dt.Rows.Count % CurPageSize);
                        for (int i = 0; i < NewRowCount; i++)
                        {
                            DataRow row = dt.NewRow();
                            row["Song_Lang"] = " ";
                            dt.Rows.Add(row);
                        }
                    }
                    SongListGridView.ShowFooter = false;
                }
                else
                {
                    int NewRowCount = CurPageSize - dt.Rows.Count;
                    for (int i = 0; i < NewRowCount; i++)
                    {
                        DataRow row = dt.NewRow();
                        row["Song_Lang"] = " ";
                        dt.Rows.Add(row);
                    }
                    SongListGridView.ShowFooter = true;
                }
            }

            SongListGridView.DataSource = dt;
            SongListGridView.DataBind();

            findCaller.Value = "toTop";
        }


        protected void GridView2_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            //clean up data on display
            SongListGridView.DataSource = null;
            SongListGridView.DataBind();
            hideAllGridViewPanel();
            SongListPanel.Visible = true;




            //LocationID = Me.MyListView.DataKeys(currentItem.DataItemIndex)("LocationID")

            var data = this.GridView2.DataKeys[e.Item.DataItemIndex]["User_Id"]; //get DataKeyNames="User_ID"

            FSongList(0, 100, data.ToString());
        }

        protected void MainMenu_Button_Click(object sender, EventArgs e)
        {
            switch (((LinkButton)sender).ID)
            {
                case "MainMenu_FindSingerButton":
                    hideAllGridViewPanel();
                    SingerTypePanel.Visible = true;
                    break;
                case "MainMenu_FindLangButton":
                    hideAllGridViewPanel();
                    SongLangPanel.Visible = true;
                    break;
                case "MainMenu_QuerySongButton":
                    hideAllGridViewPanel();
                    
                    break;
                case "MainMenu_WordCountButton":
                    hideAllGridViewPanel();

                    break;
                case "MainMenu_ChorusSongButton":
                    hideAllGridViewPanel();

                    break;
                case "MainMenu_TopSongButton":
                    hideAllGridViewPanel();

                    break;
                case "MainMenu_NewSongButton":
                    hideAllGridViewPanel();

                    break;
                case "MainMenu_FavoriteSongButton":
                    hideAllGridViewPanel();

                    break;
                case "MainMenu_SongNumberButton":
                    hideAllGridViewPanel();

                    break;

            }
        }

        protected void SingerTypeButton_Click(object sender, EventArgs e)
        {
            if (CrazyKTVWCF.checkWCF() == true)
            {
                hideAllGridViewPanel();
                SingerListPanel.Visible = true;

                int PageSize = 0;

                if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Mobile"))
                {
                    PageSize = GuiGlobal.SingerTypePageSize;
                }
                else
                {
                    if ((((HiddenField)this.Parent.FindControl("BrowserScreenMode")).Value == "Fullscreen"))
                    {
                        PageSize = GuiGlobal.SingerTypeFullscreenPageSize;
                    }
                    else
                    {
                        PageSize = GuiGlobal.SingerTypeDesktopPageSize;
                    }

                    SingerTypeMaleDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    SingerTypeFemaleDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    SingerTypeGroupDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    SingerTypeForeignMaleDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    SingerTypeForeignFemaleDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    SingerTypeForeignGroupDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    SingerTypeOtherDesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                    ((LinkButton)sender).CssClass = "MainMenuButton " + GuiGlobal.ActiveButtonCssClass;
                }
                    
                SingerListDataPager.SetPageProperties(0, PageSize, true);

                string jsonText = "";
                string SingerType = "";
                int SingerTypeIndex = -1;

                DataTable[] dtlist =
                {
                    GuiGlobal.SingerTypeMaleDT,
                    GuiGlobal.SingerTypeFemaleDT,
                    GuiGlobal.SingerTypeGroupDT,
                    GuiGlobal.SingerTypeForeignMale,
                    GuiGlobal.SingerTypeForeignFemale,
                    GuiGlobal.SingerTypeForeignGroup,
                    GuiGlobal.SingerTypeOther
                };

                switch (((LinkButton)sender).ID)
                {
                    case "SingerTypeMaleButton":
                    case "SingerTypeMaleDesktopButton":
                        SingerType = "0";
                        SingerTypeIndex = 0;
                        break;
                    case "SingerTypeFemaleButton":
                    case "SingerTypeFemaleDesktopButton":
                        SingerType = "1";
                        SingerTypeIndex = 1;
                        break;
                    case "SingerTypeGroupButton":
                    case "SingerTypeGroupDesktopButton":
                        SingerType = "2";
                        SingerTypeIndex = 2;
                        break;
                    case "SingerTypeForeignMaleButton":
                    case "SingerTypeForeignMaleDesktopButton":
                        SingerType = "4";
                        SingerTypeIndex = 3;
                        break;
                    case "SingerTypeForeignFemaleButton":
                    case "SingerTypeForeignFemaleDesktopButton":
                        SingerType = "5";
                        SingerTypeIndex = 4;
                        break;
                    case "SingerTypeForeignGroupButton":
                    case "SingerTypeForeignGroupDesktopButton":
                        SingerType = "6";
                        SingerTypeIndex = 5;
                        break;
                    case "SingerTypeOtherButton":
                    case "SingerTypeOtherDesktopButton":
                        SingerType = "7";
                        SingerTypeIndex = 6;
                        break;
                }
                ((HiddenField)this.Parent.FindControl("CurrentSinerType")).Value = SingerTypeIndex.ToString();

                DataView dv3 = new DataView();

                if (GuiGlobal.SingerTypeDTStatus == false)
                {
                    List<string> ImgFormatList = new List<string>() { ".jpg", ".png", ".bmp", ".gif" };
                    jsonText = CrazyKTVWCF.QuerySinger("Singer_Type=" + SingerType, 0, GuiGlobal.QuerySongRows, "Singer_Strokes, Singer_Name");
                    DataTable dt3 = GlobalFunctions.JsontoDataTable(jsonText);

                    if (dt3.Rows.Count != dtlist[SingerTypeIndex].Rows.Count)
                    {
                        dt3.Columns.Add("ImgFileUrl");

                        foreach (DataRow row in dt3.AsEnumerable())
                        {
                            foreach (string ImgFormat in ImgFormatList)
                            {
                                if (File.Exists(Server.MapPath("/singerimg/" + row["Singer_Name"].ToString() + ImgFormat)))
                                {
                                    row["ImgFileUrl"] = "/singerimg/" + row["Singer_Name"].ToString() + ImgFormat;
                                    break;
                                }
                            }
                            if (row["ImgFileUrl"].ToString() == "")
                            {
                                row["ImgFileUrl"] = "/images/singertype_default.png";
                            }
                        }

                        dv3 = new DataView(dt3);
                        switch (SingerTypeIndex)
                        {
                            case 0:
                                GuiGlobal.SingerTypeMaleDT = dt3;
                                break;
                            case 1:
                                GuiGlobal.SingerTypeFemaleDT = dt3;
                                break;
                            case 2:
                                GuiGlobal.SingerTypeGroupDT = dt3;
                                break;
                            case 3:
                                GuiGlobal.SingerTypeForeignMale = dt3;
                                break;
                            case 4:
                                GuiGlobal.SingerTypeForeignFemale = dt3;
                                break;
                            case 5:
                                GuiGlobal.SingerTypeForeignGroup = dt3;
                                break;
                            case 6:
                                GuiGlobal.SingerTypeOther = dt3;
                                break;
                        }
                    }
                }
                else
                {
                    dv3 = new DataView(dtlist[SingerTypeIndex]);
                }

                SingerListView.DataSource = dv3;
                SingerListView.DataBind();
            }
        }

        protected void SingerListButton_Click(object sender, EventArgs e)
        {
            //clean up data on display
            SongListGridView.DataSource = null;
            SongListGridView.DataBind();

            hideAllGridViewPanel();
            SongListPanel.Visible = true;
            SongListGridView.PageIndex = 0;

            var data = ((Label)((LinkButton)sender).Controls[0]).Text;
            SongList(0, GuiGlobal.QuerySongRows, "Singer", data.ToString());
        }

        protected void SingerListView_PagePropertiesChanged(object sender, EventArgs e)
        {
            SingerListView.DataSource = null;
            SingerListView.DataBind();

            int PageSize = 0;

            if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Mobile"))
            {
                PageSize = GuiGlobal.SingerTypePageSize;
            }
            else
            {
                if ((((HiddenField)this.Parent.FindControl("BrowserScreenMode")).Value == "Fullscreen"))
                {
                    PageSize = GuiGlobal.SingerTypeFullscreenPageSize;
                }
                else
                {
                    PageSize = GuiGlobal.SingerTypeDesktopPageSize;
                }
            }
                
            int StartRowIndex = SingerListDataPager.StartRowIndex;
            SingerListDataPager.SetPageProperties(StartRowIndex, PageSize, true);

            DataTable[] dtlist =
            {
                    GuiGlobal.SingerTypeMaleDT,
                    GuiGlobal.SingerTypeFemaleDT,
                    GuiGlobal.SingerTypeGroupDT,
                    GuiGlobal.SingerTypeForeignMale,
                    GuiGlobal.SingerTypeForeignFemale,
                    GuiGlobal.SingerTypeForeignGroup,
                    GuiGlobal.SingerTypeOther
            };

            int SingerTypeIndex = Convert.ToInt32(((HiddenField)this.Parent.FindControl("CurrentSinerType")).Value);

            DataView dv = new DataView(dtlist[SingerTypeIndex]);
            SingerListView.DataSource = dv;
            SingerListView.DataBind();
        }

        protected void SingerListDataPager_OnPagerCommand(object sender, DataPagerCommandEventArgs e)
        {
            // Check which button raised the event
            switch (e.CommandName)
            {
                case "Next":
                    int newIndex = e.Item.Pager.StartRowIndex + e.Item.Pager.PageSize;
                    if (newIndex <= e.TotalRowCount)
                    {
                        e.NewStartRowIndex = newIndex;
                        e.NewMaximumRows = e.Item.Pager.MaximumRows;
                    }
                    break;
                case "Last":
                    e.NewStartRowIndex = (Convert.ToInt32(e.CommandArgument) - 1) * e.Item.Pager.PageSize;
                    e.NewMaximumRows = e.Item.Pager.MaximumRows;
                    break;
                case "Previous":
                    e.NewStartRowIndex = e.Item.Pager.StartRowIndex - e.Item.Pager.PageSize;
                    e.NewMaximumRows = e.Item.Pager.MaximumRows;
                    break;
                case "First":
                    e.NewStartRowIndex = 0;
                    e.NewMaximumRows = e.Item.Pager.MaximumRows;
                    break;
            }
        }

        protected void SongListAddSong_Click(object sender, EventArgs e)
        {
            findCaller.Value = "";
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            var data = SongListGridView.DataKeys[row.RowIndex].Value.ToString(); //get hiddent Song_ID
            CrazyKTVWCF.wcf_addsong(data.ToString().Trim());
            SongListPanel.Visible = true;
        }

        protected void SongListQuerySinger_Click(object sender, EventArgs e)
        {
            findCaller.Value = "";
            //clean up data on display
            SongListGridView.DataSource = null;
            SongListGridView.DataBind();

            hideAllGridViewPanel();
            SongListPanel.Visible = true;

            findCaller.Value = "toTop";
            string singer = ((LinkButton)sender).Text.Trim();

            SongList(0, GuiGlobal.QuerySongRows, "Singer", singer);
        }

        protected void SongListInsSong_Click(object sender, EventArgs e)
        {
            findCaller.Value = "";
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            var data = SongListGridView.DataKeys[row.RowIndex].Value.ToString(); //get hiddent Song_ID

            CrazyKTVWCF.wcf_insertsong(data.ToString().Trim());
            SongListPanel.Visible = true;
        }

        protected void SongListGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.Header:

                    TableCellCollection tcHeader = e.Row.Cells;
                    tcHeader.Clear();

                    tcHeader.Add(new TableHeaderCell());
                    tcHeader[0].Attributes.Add("colspan", "5");
                    tcHeader[0].CssClass = "gridviewHeader";
                    tcHeader[0].Text = "歌曲列表";
                    break;
            }
        }

        protected void SongListGridView_PreRender(object sender, EventArgs e)
        {
            SongListGetData();
        }

        protected void SongListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SongListGridView.PageIndex = e.NewPageIndex;
            SongListGridView.DataBind();
        }

        private void SongListGetData()
        {
            string SongQueryType = ((HiddenField)this.Parent.FindControl("CurrentSongQueryType")).Value;
            string SongQueryValue = ((HiddenField)this.Parent.FindControl("CurrentSongQueryValue")).Value;

            int PageSize = 0;
            if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Mobile"))
            {
                PageSize = GuiGlobal.SongListPageSize;
            }
            else
            {
                if ((((HiddenField)this.Parent.FindControl("BrowserScreenMode")).Value == "Fullscreen"))
                {
                    PageSize = GuiGlobal.SongListFullscreenPageSize;
                }
                else
                {
                    PageSize = GuiGlobal.SongListDesktopPageSize;
                }
            }

            SongListGridView.PageSize = PageSize;

            SongList(0, GuiGlobal.QuerySongRows, SongQueryType, SongQueryValue);

            // Desktop / Tablet Mode
            if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Desktop"))
            {
                if (SongListGridView.PageCount > 1)
                {
                    DropDownList ddlSelectPage = (DropDownList)SongListGridView.BottomPagerRow.FindControl("SongListddlSelectPage");
                    for (int i = 0; i < SongListGridView.PageCount; i++)
                    {
                        ddlSelectPage.Items.Add(new ListItem((i + 1).ToString(), i.ToString()));
                    }
                    ddlSelectPage.SelectedIndex = SongListGridView.PageIndex;
                }
            }
        }

        protected void SongListddlSelectPage_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlSelectPage = (DropDownList)SongListGridView.BottomPagerRow.FindControl("SongListddlSelectPage");

            int pIndex = 0;
            if (int.TryParse(ddlSelectPage.SelectedValue, out pIndex))
            {
                SongListGridView.PageIndex = pIndex;
            }
        }

        protected void SongLangPanel_PreRender(object sender, EventArgs e)
        {
            string LangImgFile = "";

            System.Web.UI.WebControls.Image[] SongLangImage =
            {
                SongLang1Image,
                SongLang2Image,
                SongLang3Image,
                SongLang4Image,
                SongLang5Image,
                SongLang6Image,
                SongLang7Image,
                SongLang8Image,
                SongLang9Image,
                SongLang10Image
            };

            System.Web.UI.WebControls.Image[] SongLangDesktopImage =
            {
                SongLang1DesktopImage,
                SongLang2DesktopImage,
                SongLang3DesktopImage,
                SongLang4DesktopImage,
                SongLang5DesktopImage,
                SongLang6DesktopImage,
                SongLang7DesktopImage,
                SongLang8DesktopImage,
                SongLang9DesktopImage,
                SongLang10DesktopImage
            };

            System.Web.UI.WebControls.Label[] SongLangLabel =
            {
                SongLang1Label,
                SongLang2Label,
                SongLang3Label,
                SongLang4Label,
                SongLang5Label,
                SongLang6Label,
                SongLang7Label,
                SongLang8Label,
                SongLang9Label,
                SongLang10Label
            };

            System.Web.UI.WebControls.Label[] SongLangDesktopLabel =
            {
                SongLang1DesktopLabel,
                SongLang2DesktopLabel,
                SongLang3DesktopLabel,
                SongLang4DesktopLabel,
                SongLang5DesktopLabel,
                SongLang6DesktopLabel,
                SongLang7DesktopLabel,
                SongLang8DesktopLabel,
                SongLang9DesktopLabel,
                SongLang10DesktopLabel
            };

            for (int i = 0; i < GuiGlobal.SongLangList.Count; i++)
            {
                LangImgFile = "/images/langstr_" + GuiGlobal.SongLangList[i].Substring(0, 1) + ".png";
                if (File.Exists(Server.MapPath(LangImgFile)))
                {
                    SongLangImage[i].ImageUrl = LangImgFile;
                    SongLangDesktopImage[i].ImageUrl = LangImgFile;
                }
                else
                {
                    SongLangImage[i].ImageUrl = DrawLangImage(GuiGlobal.SongLangList[i].Substring(0, 1));
                    SongLangDesktopImage[i].ImageUrl = LangImgFile;
                }

                if (GuiGlobal.SongLangList[i].Length > 2)
                {
                    SongLangLabel[i].Text = GuiGlobal.SongLangList[i].Substring(0,1) + GuiGlobal.SongLangList[i].Substring(GuiGlobal.SongLangList[i].Length - 1, 1);
                    SongLangDesktopLabel[i].Text = GuiGlobal.SongLangList[i].Substring(0, 1) + GuiGlobal.SongLangList[i].Substring(GuiGlobal.SongLangList[i].Length - 1, 1);
                }
                else
                {
                    SongLangLabel[i].Text = GuiGlobal.SongLangList[i];
                    SongLangDesktopLabel[i].Text = GuiGlobal.SongLangList[i];
                }
            }
        }

        private string DrawLangImage(string LangStr)
        {
            Bitmap bitmap = new Bitmap(1, 1);
            Font font = new Font("標楷體", 116, FontStyle.Bold, GraphicsUnit.Pixel);
            Graphics graphics = Graphics.FromImage(bitmap);
            int width = 128;
            int height = 100;
            bitmap = new Bitmap(bitmap, new Size(width, height));
            graphics = Graphics.FromImage(bitmap);
            graphics.Clear(Color.Transparent);
            graphics.SmoothingMode = SmoothingMode.AntiAlias;
            graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.DrawString(LangStr, font, new SolidBrush(Color.FromArgb(90, 0, 0, 0)), -12, -8);
            graphics.DrawString(LangStr, font, new SolidBrush(Color.FromArgb(255, 255, 255)), -14, -10);
            graphics.Flush();
            graphics.Dispose();
            string fileName = "langstr_" + LangStr + ".png";
            bitmap.Save(Server.MapPath("/images/") + fileName, ImageFormat.Png);
            return "/images/" + fileName;
        }

        protected void SongLangButton_Click(object sender, EventArgs e)
        {
            //clean up data on display
            SongListGridView.DataSource = null;
            SongListGridView.DataBind();

            hideAllGridViewPanel();
            SongListPanel.Visible = true;
            SongListGridView.PageIndex = 0;

            var data = ((Label)((LinkButton)sender).Controls[1]).Text;
            ((HiddenField)this.Parent.FindControl("CurrentSongLang")).Value = GuiGlobal.SongLangList.IndexOf(data.ToString()).ToString();

            if (((HiddenField)this.Parent.FindControl("BootstrapResponsiveMode")).Value.Contains("Desktop"))
            {
                SongLang1DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang2DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang3DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang4DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang5DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang6DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang7DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang8DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang9DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                SongLang10DesktopButton.CssClass = "MainMenuButton " + GuiGlobal.DefaultButtonCssClass;
                ((LinkButton)sender).CssClass = "MainMenuButton " + GuiGlobal.ActiveButtonCssClass;
            }

            SongList(0, GuiGlobal.QuerySongRows, "SongLang", data.ToString());
        }


    }
}