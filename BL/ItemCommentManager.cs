using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using ORM;

namespace BL
{
    public class ItemCommentManager : BaseManager
    {
        /// <summary>
        /// Recupera los id de un producto
        /// </summary>
        /// <param name="resourceId"></param>
        /// <returns></returns>
        public List<ItemComment> GetByResource(int resourceId)
        {
            UserManager userManager = new UserManager();
            ItemCommentMapper commentMapper = new ItemCommentMapper();
            List<ItemComment> comments = commentMapper.GetByResource(resourceId);

            //feo, pero supongo que es lo único que podemos hacer por el momento
            foreach (ItemComment comment in comments)
            {
                comment.User = userManager.Get(comment.User.Id);
            }

            return comments;
        }

        public List<ItemComment> Get()
        {
            UserManager userManager = new UserManager();
            ItemCommentMapper commentMapper = new ItemCommentMapper();
            List<ItemComment> comments = commentMapper.Get();

            //feo, pero supongo que es lo único que podemos hacer por el momento
            foreach (ItemComment comment in comments)
            {
                comment.User = userManager.Get(comment.User.Id);
                comment.SentenceReference = commentMapper.GetReference(comment.Id);
            }

            return comments;
        }

        /// <summary>
        /// Recupera un comentario en particular y su repsuesta asociada.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ItemComment Get(int id)
        {
            UserManager userManager = new UserManager();
            MapManager mapManager = new MapManager();

            ItemCommentMapper commentMapper = new ItemCommentMapper();
            ItemComment comment = commentMapper.Get(id);

            if (comment == null)
            {
                string errorDescription = "No se ha podido recuperar el comentario con id " + id + ".";
                log.AddLogCritical("Get", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
            }
            else
            {
                //Todo - implementar control de error
                comment.User = userManager.Get(comment.User.Id);
                comment.Resource = mapManager.Get(comment.Resource.Id);
                comment.SentenceReference = commentMapper.GetReference(comment.Id);
            }

            return comment;
        }

        /// <summary>
        /// Guarda el item en la base.
        /// </summary>
        /// <param name="itemComment"></param>
        /// <returns></returns>
        public bool Save(ItemComment itemComment)
        {
            if (!IsValid(itemComment)) return false;

            ItemCommentMapper commentMapper = new ItemCommentMapper();
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

        /// <summary>
        /// Elimina el elemento cuyo id es pasado por parámetro.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            ItemCommentMapper itemCommentMapper = new ItemCommentMapper();

            if (!itemCommentMapper.Delete(id))
            {
                string errorDescription = "No se ha podido eliminar el comentario con id " + id + ".";
                log.AddLogCritical("Delete", errorDescription, this);
                AddError(new ResultBE(ResultBE.Type.FAIL, errorDescription));
                return false;
            }

            return true;
        }

        private bool IsValid(ItemComment itemComment)
        {
            bool isValid = true;

            if (String.IsNullOrEmpty(itemComment.Sentence))
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
