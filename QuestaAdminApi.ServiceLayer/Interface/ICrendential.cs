using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestaAdminApi.ServiceLayer.Interface
{
    public interface ICrendential
    {
        bool ChkValidCrendential();
        void Dispose();
    }
}
