﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;

namespace Ubiquicity.UserControls
{
    public partial class UCFormNews : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CleanForm(List<Category> categories)
        {
            titleInput.Value = "";
            bodyInput.InnerText = "";
            fileImage.Src = "";
            imageInputBase64.Value = "";
            dropCategoryInput.DataTextField = "Name";
            dropCategoryInput.DataValueField = "Id";
            dropCategoryInput.DataSource = categories;
            dropCategoryInput.DataBind();
            sinceInput.Date = DateTime.Now.ToShortDateString();
            sinceInput.DefaultView = AjaxControlToolkit.CalendarDefaultView.Days;
            untilInput.Date = DateTime.Now.AddDays(1).ToShortDateString();
            untilInput.DefaultView = AjaxControlToolkit.CalendarDefaultView.Days;

        }

        public void FillForm(News news)
        {
            titleInput.Value = news.Title;
            bodyInput.InnerText = news.Body;
            fileImage.Src = news.Image;
            imageInputBase64.Value = news.Image;
            dropCategoryInput.SelectedValue = news.Category.Id.ToString();
            sinceInput.Date = news.Since.ToString();
            sinceInput.DefaultView = AjaxControlToolkit.CalendarDefaultView.Days;
            untilInput.Date = news.Until.ToString();
            untilInput.DefaultView = AjaxControlToolkit.CalendarDefaultView.Days;
        }

        public void PopulateModel(News news)
        {
            news.Title = titleInput.Value;
            news.Body = bodyInput.InnerText;
            news.Image = imageInputBase64.Value;
            news.Category.Id = Convert.ToInt32(dropCategoryInput.SelectedValue);
            news.Since = Convert.ToDateTime(sinceInput.Date);
            news.Until= Convert.ToDateTime(untilInput.Date);
        }
    }
}