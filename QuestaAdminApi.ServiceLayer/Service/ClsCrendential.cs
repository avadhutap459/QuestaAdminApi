using QuestaAdminApi.DatabaseLayer;
using QuestaAdminApi.ServiceLayer.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestaAdminApi.ServiceLayer.Service
{
    public class ClsCrendential : ICrendential, IDisposable
    {
        ClsDbConnection Connectionmgr;

        private bool isDisposed = false;
        public ClsCrendential()
        {
            Connectionmgr = ClsDbConnection.Instance;
        }

        ~ClsCrendential()
        {
            Dispose(false);
        }

        public bool ChkValidCrendential(string EmailId,string PasswordHash)
        {
            try
            {
                using(Id)
            }
            catch(Exception ex)
            {
                throw;
            }
        }


        #region Dispose


        protected void Dispose(bool disposing)
        {
            if (disposing)
            {

                // Code to dispose the managed resources of the class
            }
            // Code to dispose the un-managed resources of the class
            isDisposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        #endregion

    }
}
