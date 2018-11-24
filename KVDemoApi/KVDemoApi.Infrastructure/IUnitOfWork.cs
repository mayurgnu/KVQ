using KVDemoApi.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace KVDemoApi.Infrastructure
{
    public interface IUnitOfWork
    {
        IMainRepository<TblUser> TblUser_Repository { get; }
    }
}
