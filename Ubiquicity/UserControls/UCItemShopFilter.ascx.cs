using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BL;

namespace Ubiquicity.UserControls
{
    public partial class UCItemShopFilter : System.Web.UI.UserControl
    {
        private Repeater shopRepeater;
        private const string PLACE_HOLDER = "::: Categorías :::";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                PerformSearch(null, null);
            }
        }

        private void LoadCategories()
        {
            try
            {
                CategoryManager newsCategoryManager = new CategoryManager();
                List<Category> categories = newsCategoryManager.Get();

                //Se inserta para que en la lista aparezca la opción "Todas las categorías"
                Category placeHolder = new Category();
                placeHolder.Name = PLACE_HOLDER;
                categories.Insert(0, placeHolder);

                dropCategoryInput.DataTextField = "Name";
                dropCategoryInput.DataValueField = "Name";
                dropCategoryInput.DataSource = categories;
                dropCategoryInput.DataBind();
            }
            catch
            {
                //TODO - controlar errores

            }
        }


        protected void PerformSearch(object sender, EventArgs e)
        {
            List<QueryFilter> filters = new List<QueryFilter>();

            if (!String.IsNullOrEmpty(nameInput.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@name";
                qf.Value = nameInput.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(descriptionInput.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@description";
                qf.Value = descriptionInput.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(minInput.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@min";
                qf.Value = minInput.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(maxInput.Value))
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@max";
                qf.Value = maxInput.Value;
                filters.Add(qf);
            }

            if (!String.IsNullOrEmpty(dropCategoryInput.SelectedValue) && dropCategoryInput.SelectedValue != PLACE_HOLDER)
            {
                QueryFilter qf = new QueryFilter();
                qf.Key = "@categoryName";
                qf.Value = dropCategoryInput.SelectedValue;
                filters.Add(qf);
            }

            //TODO - controlar errores
            MapManager mapManager = new MapManager();
            List<Map> maps = mapManager.Get(filters);
            ShopRepeater.DataSource = maps;
            ShopRepeater.DataBind();

        }

        // Referencia a la grilla afectada
        public Repeater ShopRepeater
        {
            set { shopRepeater = value; }
            get { return shopRepeater; }
        }

       
    }
}