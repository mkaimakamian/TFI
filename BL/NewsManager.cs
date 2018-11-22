using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class NewsManager : BaseManager
    {

        public bool Save(News news)
        {
            if (!IsValid(news)) return false;

            NewsMapper newsMapper = new NewsMapper();
            if (!newsMapper.Save(news))
            {
                string errorDescription = "No se ha podido guardar la novedad.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        public bool Edit(News news)
        {
            if (!IsValid(news)) return false;

            NewsMapper newsMapper = new NewsMapper();

            if (!newsMapper.Edit(news))
            {
                string errorDescription = "No se ha podido modificar la noticia.";
                log.AddLogCritical("Edit", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        public News Get(int id)
        {
            NewsMapper newsMapper = new NewsMapper();
            News news = newsMapper.Get(id);

            if (news == null)
            {
                string errorDescription = "No se ha encontrado la noticia con id " + id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.NULL, errorDescription));
            }

            return news;
        }

        public List<News> GetByCategory(int[] categoriesId)
        {
            CategoryManager newscategoryManager = new CategoryManager();
            NewsMapper newsMapper = new NewsMapper();
            List<News> newsList = new List<News>();

            //Rever como pasar un listado a la base para evitar realizar tantas llamadas.
            for (int i = 0; i < categoriesId.Length; ++i)
            {
                List<News> news = newsMapper.GetByCategory(categoriesId[i]);

                if (news != null) newsList.AddRange(newsMapper.GetByCategory(categoriesId[i]));
            }

            Dictionary<int, Category> newsCategories = newscategoryManager.GetDictinoray();

            if (newsList != null) { 
            foreach (News news in newsList)
            {
                news.Category = newsCategories[news.Category.Id];
            }
            }
            return newsList;
        }

        /// <summary>
        /// Devuelve el listado de novedades de la base.
        /// </summary>
        /// <returns></returns>
        public List<News> Get()
        {
            NewsMapper newsMapper = new NewsMapper();
            List<News> newsList = newsMapper.Get();

            CategoryManager newscategoryManager = new CategoryManager();
            Dictionary<int, Category> newsCategories = newscategoryManager.GetDictinoray();

            foreach (News news in newsList)
            {
                news.Category = newsCategories[news.Category.Id];
            }

            return newsList;
        }

        public bool Delete(int id)
        {
            NewsMapper newsMapper = new NewsMapper();

            if (!newsMapper.Delete(id))
            {
                string errorDescription = "No se ha podido eliminar la noticia con id " + id + ".";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }
        
        public bool IsValid(News news)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(news.Title))
            {
                string errorDescription = "Debe completarse el título.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(news.Body))
            {
                string errorDescription = "Debe completarse el cuerpo.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (String.IsNullOrEmpty(news.Image))
            {
                string errorDescription = "Debe asignarse una imagen.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            if (news.Until <= DateTime.Now)
            {
                string errorDescription = "La fecha de vencimiento tiene que se rposterior al día actual";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }

        public override string ToString() { return "News"; }

    }
}
