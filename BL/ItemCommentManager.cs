using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class ItemCommentManager:BaseManager
    {
        /// <summary>
        /// Recupera los id de un producto
        /// </summary>
        /// <param name="resourceId"></param>
        /// <returns></returns>
        public List<ItemComment> Get(int resourceId)
        {
            UserManager userManager = new UserManager();
            ItemCommenMapper commentMapper = new ItemCommenMapper();
            List<ItemComment> comments = commentMapper.Get(resourceId);

            //feo, pero supongo que es lo único que podemos hacer por el momento
            foreach (ItemComment comment in comments)
            {
                comment.User = userManager.Get(comment.User.Id);
            }

                return comments;
        }

        public bool Save(ItemComment itemComment)
        {
            if (!IsValid(itemComment)) return false;

            ItemCommenMapper commentMapper = new ItemCommenMapper();
            itemComment.Date = DateTime.Now;

            if (!commentMapper.Save(itemComment))
            {
                string errorDescription = "No se ha podido guardar el comentario.";
                log.AddLogCritical("Save", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        private bool IsValid(ItemComment itemComment)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(itemComment.Comment))
            {
                string errorDescription = "Debe ingresarse un comentario.";
                log.AddLogWarn("IsValid", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.INCOMPLETE_FIELDS, errorDescription));
                isValid = false;
            }

            return isValid;
        }
    }
}
