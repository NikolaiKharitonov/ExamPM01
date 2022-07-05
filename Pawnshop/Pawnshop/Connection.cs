using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pawnshop
{
    class Connection //Класс для создания с базой данных
    {
        private static Model.PawnshopEntities Cnct;
        public static Model.PawnshopEntities GetContext()
        {
            if (Cnct == null)
            {
                Cnct = new Model.PawnshopEntities();
            }
            return Cnct;
        }
    }
}
